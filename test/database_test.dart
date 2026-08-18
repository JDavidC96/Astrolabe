import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('creates a project, a character and a location, and reads them back', () async {
    final projectId = await db.projectDao.createProject(name: 'Mi universo');
    final project = await db.projectDao.getProject(projectId);
    expect(project.name, 'Mi universo');

    final characterId = await db.characterDao.createCharacter(
      projectId: projectId,
      firstName: 'Aria',
    );
    final character = await db.characterDao.getCharacter(characterId);
    expect(character.firstName, 'Aria');
    expect(character.projectId, projectId);

    final rootLocationId = await db.locationDao.createLocation(
      projectId: projectId,
      name: 'Continente Norte',
    );
    final cityId = await db.locationDao.createLocation(
      projectId: projectId,
      parentLocationId: rootLocationId,
      name: 'Puerto Gris',
    );
    final city = await db.locationDao.getLocation(cityId);
    expect(city.parentLocationId, rootLocationId);

    final factionId = await db.factionDao.createFaction(
      projectId: projectId,
      name: 'Guardia del Norte',
    );
    await db.characterDao.updateCharacter(
      CharactersCompanion(id: Value(characterId), factionId: Value(factionId)));
    final members = await db.factionDao.watchFactionMembers(factionId).first;
    expect(members.map((m) => m.id), contains(characterId));

    final eventId = await db.timelineDao.createEvent(projectId: projectId, title: 'La caída');
    await db.timelineDao.setEventCharacters(eventId, [characterId]);
    final involved = await db.timelineDao.watchEventCharacters(eventId).first;
    expect(involved.map((c) => c.id), [characterId]);

    await db.projectDao.deleteProject(projectId);
    final remaining = await db.characterDao.watchCharacters(projectId).first;
    expect(remaining, isEmpty);
  });

  test('a relationship is visible from every character in it', () async {
    final projectId = await db.projectDao.createProject(name: 'Mi universo');
    final ariaId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Aria');
    final kaelId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Kael');
    final lyraId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Lyra');

    // A trio, not a pair — this is the case the pair-of-columns model
    // could not represent.
    await db.relationshipDao.createRelationship(
      projectId: projectId,
      relationshipType: 'Hermanos',
      characterIds: [ariaId, kaelId, lyraId],
    );

    for (final entry in {
      ariaId: [kaelId, lyraId],
      kaelId: [ariaId, lyraId],
      lyraId: [ariaId, kaelId],
    }.entries) {
      final seen =
          await db.relationshipDao.watchRelationshipsForCharacter(entry.key).first;
      expect(seen, hasLength(1), reason: 'for ${entry.key}');
      expect(seen.single.members, hasLength(3));
      expect(
        seen.single.others.map((c) => c.id).toSet(),
        entry.value.toSet(),
        reason: 'others for ${entry.key}',
      );
    }
  });

  test('editing a relationship replaces its member list', () async {
    final projectId = await db.projectDao.createProject(name: 'Mi universo');
    final ariaId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Aria');
    final kaelId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Kael');
    final lyraId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Lyra');

    final id = await db.relationshipDao.createRelationship(
      projectId: projectId,
      relationshipType: 'Aliados',
      characterIds: [ariaId, kaelId],
    );

    await db.relationshipDao.updateRelationship(
      id: id,
      relationshipType: 'Pacto',
      characterIds: [ariaId, lyraId],
    );

    final fromAria =
        await db.relationshipDao.watchRelationshipsForCharacter(ariaId).first;
    expect(fromAria.single.relationship.relationshipType, 'Pacto');
    expect(fromAria.single.others.map((c) => c.id), [lyraId]);

    // Kael was dropped from the relationship, so it no longer shows up.
    final fromKael =
        await db.relationshipDao.watchRelationshipsForCharacter(kaelId).first;
    expect(fromKael, isEmpty);
  });

  test('reordering events persists the new manual order', () async {
    final projectId = await db.projectDao.createProject(name: 'Mi universo');
    final first = await db.timelineDao.createEvent(projectId: projectId, title: 'Primero');
    final second = await db.timelineDao.createEvent(projectId: projectId, title: 'Segundo');

    var events = await db.timelineDao.watchEvents(projectId).first;
    expect(events.map((e) => e.id), [first, second]);

    await db.timelineDao.reorderEvents([second, first]);

    events = await db.timelineDao.watchEvents(projectId).first;
    expect(events.map((e) => e.id), [second, first]);
  });
}
