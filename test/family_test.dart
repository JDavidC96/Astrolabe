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

  Future<String> newCharacter(String projectId, String name) {
    return db.characterDao.createCharacter(projectId: projectId, firstName: name);
  }

  test('parents and children resolve from both directions', () async {
    final projectId = await db.projectDao.createProject(name: 'Eldoria');
    final elder = await newCharacter(projectId, 'Elder');
    final child = await newCharacter(projectId, 'Child');

    await db.familyDao.addLink(parentId: elder, childId: child);

    final parents = await db.familyDao.watchParents(child).first;
    expect(parents.single.id, elder);

    final children = await db.familyDao.watchChildren(elder).first;
    expect(children.single.id, child);
  });

  test('a person cannot become their own ancestor', () async {
    final projectId = await db.projectDao.createProject(name: 'Eldoria');
    final a = await newCharacter(projectId, 'A');
    final b = await newCharacter(projectId, 'B');
    final c = await newCharacter(projectId, 'C');

    await db.familyDao.addLink(parentId: a, childId: b);
    await db.familyDao.addLink(parentId: b, childId: c);

    // Direct self-link.
    expect(await db.familyDao.wouldCreateCycle(a, a), isTrue);
    // Closing the loop C -> A, when A is already C's grandparent.
    expect(await db.familyDao.wouldCreateCycle(c, a), isTrue);
    // An unrelated new link is fine.
    final d = await newCharacter(projectId, 'D');
    expect(await db.familyDao.wouldCreateCycle(d, a), isFalse);
  });
}
