import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/daos/family_dao.dart';
import '../data/daos/relationship_dao.dart';
import '../data/daos/search_dao.dart';
import '../data/daos/secret_dao.dart';
import '../services/kinship.dart';
import 'core_providers.dart';

// Projects
final projectsStreamProvider = StreamProvider<List<Project>>((ref) {
  return ref.watch(projectDaoProvider).watchAllProjects();
});

final projectStreamProvider = StreamProvider.family<Project, String>((ref, projectId) {
  return ref.watch(projectDaoProvider).watchProject(projectId);
});

// Characters
final charactersStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, projectId) {
  return ref.watch(characterDaoProvider).watchCharacters(projectId);
});

final characterStreamProvider =
    StreamProvider.family<Character, String>((ref, characterId) {
  return ref.watch(characterDaoProvider).watchCharacter(characterId);
});

// Factions
final factionsStreamProvider =
    StreamProvider.family<List<Faction>, String>((ref, projectId) {
  return ref.watch(factionDaoProvider).watchFactions(projectId);
});

final factionStreamProvider = StreamProvider.family<Faction, String>((ref, factionId) {
  return ref.watch(factionDaoProvider).watchFaction(factionId);
});

final factionMembersStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, factionId) {
  return ref.watch(factionDaoProvider).watchFactionMembers(factionId);
});

// Locations
final locationsStreamProvider =
    StreamProvider.family<List<Location>, String>((ref, projectId) {
  return ref.watch(locationDaoProvider).watchLocations(projectId);
});

final locationStreamProvider =
    StreamProvider.family<Location, String>((ref, locationId) {
  return ref.watch(locationDaoProvider).watchLocation(locationId);
});

// Timeline
final timelineEventsStreamProvider =
    StreamProvider.family<List<TimelineEvent>, String>((ref, projectId) {
  return ref.watch(timelineDaoProvider).watchEvents(projectId);
});

final timelineEventStreamProvider =
    StreamProvider.family<TimelineEvent, String>((ref, eventId) {
  return ref.watch(timelineDaoProvider).watchEvent(eventId);
});

final eventCharactersStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, eventId) {
  return ref.watch(timelineDaoProvider).watchEventCharacters(eventId);
});

// Relationships
final relationshipsForCharacterStreamProvider =
    StreamProvider.family<List<RelationshipWithMembers>, String>((ref, characterId) {
  return ref.watch(relationshipDaoProvider).watchRelationshipsForCharacter(characterId);
});

final relationshipsStreamProvider =
    StreamProvider.family<List<RelationshipWithMembers>, String>((ref, projectId) {
  return ref.watch(relationshipDaoProvider).watchRelationships(projectId);
});

// Chapters
final chaptersStreamProvider =
    StreamProvider.family<List<Chapter>, String>((ref, projectId) {
  return ref.watch(chapterDaoProvider).watchChapters(projectId);
});

final chapterCharactersStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, chapterId) {
  return ref.watch(chapterDaoProvider).watchChapterCharacters(chapterId);
});

final chapterLocationsStreamProvider =
    StreamProvider.family<List<Location>, String>((ref, chapterId) {
  return ref.watch(chapterDaoProvider).watchChapterLocations(chapterId);
});

// Notes
final notesStreamProvider =
    StreamProvider.family<List<Note>, String>((ref, projectId) {
  return ref.watch(noteDaoProvider).watchNotes(projectId);
});

// Items
final itemsStreamProvider =
    StreamProvider.family<List<Item>, String>((ref, projectId) {
  return ref.watch(itemDaoProvider).watchItems(projectId);
});

final itemsForOwnerStreamProvider =
    StreamProvider.family<List<Item>, String>((ref, characterId) {
  return ref.watch(itemDaoProvider).watchItemsForOwner(characterId);
});

// Magic systems
final magicSystemsStreamProvider =
    StreamProvider.family<List<MagicSystem>, String>((ref, projectId) {
  return ref.watch(magicDaoProvider).watchMagicSystems(projectId);
});

// Tags
final tagsStreamProvider = StreamProvider.family<List<Tag>, String>((ref, projectId) {
  return ref.watch(tagDaoProvider).watchTags(projectId);
});

/// Tags attached to one entity, keyed by `(entityType, entityId)`.
final tagsForEntityStreamProvider =
    StreamProvider.family<List<Tag>, (String, String)>((ref, key) {
  return ref.watch(tagDaoProvider).watchTagsFor(key.$1, key.$2);
});

// Global search
final searchResultsProvider =
    FutureProvider.family<List<SearchResult>, (String, String)>((ref, key) {
  return ref.watch(searchDaoProvider).search(key.$1, key.$2);
});

// D&D character sheets
final characterSheetStreamProvider =
    StreamProvider.family<CharacterSheet?, String>((ref, characterId) {
  return ref.watch(sheetDaoProvider).watchSheet(characterId);
});

// Genealogy
final familyStreamProvider =
    StreamProvider.family<List<FamilyNode>, String>((ref, projectId) {
  return ref.watch(familyDaoProvider).watchFamily(projectId);
});

/// Everything needed to draw or reason about the family: the links plus the
/// characters they refer to.
final kinshipProvider =
    StreamProvider.family<Kinship, String>((ref, projectId) async* {
  final db = ref.watch(databaseProvider);
  final characters = await ref.watch(charactersStreamProvider(projectId).future);
  final ids = characters.map((c) => c.id).toSet();

  await for (final _ in db.familyDao.watchFamily(projectId)) {
    final links = await db.select(db.familyLinks).get();
    final partners = await db.select(db.partnerLinks).get();
    yield Kinship.fromLinks(
      // Links are global; keep only those inside this project.
      familyLinks: links
          .where((l) => ids.contains(l.parentId) && ids.contains(l.childId))
          .map((l) => (l.parentId, l.childId)),
      partnerLinks: partners
          .where((p) => ids.contains(p.aId) && ids.contains(p.bId))
          .map((p) => (p.aId, p.bId)),
    );
  }
});

final partnersStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, characterId) {
  return ref.watch(partnerDaoProvider).watchPartnersOf(characterId);
});

final parentsStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, childId) {
  return ref.watch(familyDaoProvider).watchParents(childId);
});

final childrenStreamProvider =
    StreamProvider.family<List<Character>, String>((ref, parentId) {
  return ref.watch(familyDaoProvider).watchChildren(parentId);
});

// Secrets
final secretsStreamProvider =
    StreamProvider.family<List<SecretWithKnowers>, String>((ref, projectId) {
  return ref.watch(secretDaoProvider).watchSecrets(projectId);
});

final secretsKnownByStreamProvider =
    StreamProvider.family<List<Secret>, String>((ref, characterId) {
  return ref.watch(secretDaoProvider).watchSecretsKnownBy(characterId);
});

/// Custom fields for one entity, keyed by `(entityType, entityId)`.
final customFieldsStreamProvider =
    StreamProvider.family<List<CustomField>, (String, String)>((ref, key) {
  return ref.watch(customFieldDaoProvider).watchFields(key.$1, key.$2);
});

// Map pins
final mapPinsStreamProvider =
    StreamProvider.family<List<MapPin>, String>((ref, mapLocationId) {
  return ref.watch(mapPinDaoProvider).watchPinsOnMap(mapLocationId);
});

// Dice
final diceRollsStreamProvider =
    StreamProvider.family<List<DiceRoll>, String>((ref, projectId) {
  return ref.watch(diceDaoProvider).watchRolls(projectId);
});
