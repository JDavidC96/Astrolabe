// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverImagePathMeta = const VerificationMeta(
    'coverImagePath',
  );
  @override
  late final GeneratedColumn<String> coverImagePath = GeneratedColumn<String>(
    'cover_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(ProjectKind.novel),
  );
  static const VerificationMeta _themeIdMeta = const VerificationMeta(
    'themeId',
  );
  @override
  late final GeneratedColumn<String> themeId = GeneratedColumn<String>(
    'theme_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('classic'),
  );
  static const VerificationMeta _autoChapterTimelineMeta =
      const VerificationMeta('autoChapterTimeline');
  @override
  late final GeneratedColumn<bool> autoChapterTimeline = GeneratedColumn<bool>(
    'auto_chapter_timeline',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_chapter_timeline" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _timelineSortByYearMeta =
      const VerificationMeta('timelineSortByYear');
  @override
  late final GeneratedColumn<bool> timelineSortByYear = GeneratedColumn<bool>(
    'timeline_sort_by_year',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("timeline_sort_by_year" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    coverImagePath,
    kind,
    themeId,
    autoChapterTimeline,
    timelineSortByYear,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('cover_image_path')) {
      context.handle(
        _coverImagePathMeta,
        coverImagePath.isAcceptableOrUnknown(
          data['cover_image_path']!,
          _coverImagePathMeta,
        ),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('theme_id')) {
      context.handle(
        _themeIdMeta,
        themeId.isAcceptableOrUnknown(data['theme_id']!, _themeIdMeta),
      );
    }
    if (data.containsKey('auto_chapter_timeline')) {
      context.handle(
        _autoChapterTimelineMeta,
        autoChapterTimeline.isAcceptableOrUnknown(
          data['auto_chapter_timeline']!,
          _autoChapterTimelineMeta,
        ),
      );
    }
    if (data.containsKey('timeline_sort_by_year')) {
      context.handle(
        _timelineSortByYearMeta,
        timelineSortByYear.isAcceptableOrUnknown(
          data['timeline_sort_by_year']!,
          _timelineSortByYearMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      coverImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_path'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      themeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_id'],
      )!,
      autoChapterTimeline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_chapter_timeline'],
      )!,
      timelineSortByYear: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}timeline_sort_by_year'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String name;
  final String? description;
  final String? coverImagePath;
  final String kind;

  /// Visual theme id (see `theme/app_themes.dart`); each universe carries
  /// its own look so a medieval saga and a cyberpunk campaign don't share one.
  final String themeId;

  /// When on, every chapter that has a summary is mirrored into the
  /// timeline and kept in sync with it.
  final bool autoChapterTimeline;

  /// Order the timeline by in-story year instead of manual drag order.
  final bool timelineSortByYear;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Project({
    required this.id,
    required this.name,
    this.description,
    this.coverImagePath,
    required this.kind,
    required this.themeId,
    required this.autoChapterTimeline,
    required this.timelineSortByYear,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || coverImagePath != null) {
      map['cover_image_path'] = Variable<String>(coverImagePath);
    }
    map['kind'] = Variable<String>(kind);
    map['theme_id'] = Variable<String>(themeId);
    map['auto_chapter_timeline'] = Variable<bool>(autoChapterTimeline);
    map['timeline_sort_by_year'] = Variable<bool>(timelineSortByYear);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverImagePath: coverImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImagePath),
      kind: Value(kind),
      themeId: Value(themeId),
      autoChapterTimeline: Value(autoChapterTimeline),
      timelineSortByYear: Value(timelineSortByYear),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      coverImagePath: serializer.fromJson<String?>(json['coverImagePath']),
      kind: serializer.fromJson<String>(json['kind']),
      themeId: serializer.fromJson<String>(json['themeId']),
      autoChapterTimeline: serializer.fromJson<bool>(
        json['autoChapterTimeline'],
      ),
      timelineSortByYear: serializer.fromJson<bool>(json['timelineSortByYear']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'coverImagePath': serializer.toJson<String?>(coverImagePath),
      'kind': serializer.toJson<String>(kind),
      'themeId': serializer.toJson<String>(themeId),
      'autoChapterTimeline': serializer.toJson<bool>(autoChapterTimeline),
      'timelineSortByYear': serializer.toJson<bool>(timelineSortByYear),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Project copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> coverImagePath = const Value.absent(),
    String? kind,
    String? themeId,
    bool? autoChapterTimeline,
    bool? timelineSortByYear,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Project(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    coverImagePath: coverImagePath.present
        ? coverImagePath.value
        : this.coverImagePath,
    kind: kind ?? this.kind,
    themeId: themeId ?? this.themeId,
    autoChapterTimeline: autoChapterTimeline ?? this.autoChapterTimeline,
    timelineSortByYear: timelineSortByYear ?? this.timelineSortByYear,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      coverImagePath: data.coverImagePath.present
          ? data.coverImagePath.value
          : this.coverImagePath,
      kind: data.kind.present ? data.kind.value : this.kind,
      themeId: data.themeId.present ? data.themeId.value : this.themeId,
      autoChapterTimeline: data.autoChapterTimeline.present
          ? data.autoChapterTimeline.value
          : this.autoChapterTimeline,
      timelineSortByYear: data.timelineSortByYear.present
          ? data.timelineSortByYear.value
          : this.timelineSortByYear,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverImagePath: $coverImagePath, ')
          ..write('kind: $kind, ')
          ..write('themeId: $themeId, ')
          ..write('autoChapterTimeline: $autoChapterTimeline, ')
          ..write('timelineSortByYear: $timelineSortByYear, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    coverImagePath,
    kind,
    themeId,
    autoChapterTimeline,
    timelineSortByYear,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.coverImagePath == this.coverImagePath &&
          other.kind == this.kind &&
          other.themeId == this.themeId &&
          other.autoChapterTimeline == this.autoChapterTimeline &&
          other.timelineSortByYear == this.timelineSortByYear &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> coverImagePath;
  final Value<String> kind;
  final Value<String> themeId;
  final Value<bool> autoChapterTimeline;
  final Value<bool> timelineSortByYear;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.coverImagePath = const Value.absent(),
    this.kind = const Value.absent(),
    this.themeId = const Value.absent(),
    this.autoChapterTimeline = const Value.absent(),
    this.timelineSortByYear = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.coverImagePath = const Value.absent(),
    this.kind = const Value.absent(),
    this.themeId = const Value.absent(),
    this.autoChapterTimeline = const Value.absent(),
    this.timelineSortByYear = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? coverImagePath,
    Expression<String>? kind,
    Expression<String>? themeId,
    Expression<bool>? autoChapterTimeline,
    Expression<bool>? timelineSortByYear,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (coverImagePath != null) 'cover_image_path': coverImagePath,
      if (kind != null) 'kind': kind,
      if (themeId != null) 'theme_id': themeId,
      if (autoChapterTimeline != null)
        'auto_chapter_timeline': autoChapterTimeline,
      if (timelineSortByYear != null)
        'timeline_sort_by_year': timelineSortByYear,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? coverImagePath,
    Value<String>? kind,
    Value<String>? themeId,
    Value<bool>? autoChapterTimeline,
    Value<bool>? timelineSortByYear,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      kind: kind ?? this.kind,
      themeId: themeId ?? this.themeId,
      autoChapterTimeline: autoChapterTimeline ?? this.autoChapterTimeline,
      timelineSortByYear: timelineSortByYear ?? this.timelineSortByYear,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverImagePath.present) {
      map['cover_image_path'] = Variable<String>(coverImagePath.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (themeId.present) {
      map['theme_id'] = Variable<String>(themeId.value);
    }
    if (autoChapterTimeline.present) {
      map['auto_chapter_timeline'] = Variable<bool>(autoChapterTimeline.value);
    }
    if (timelineSortByYear.present) {
      map['timeline_sort_by_year'] = Variable<bool>(timelineSortByYear.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverImagePath: $coverImagePath, ')
          ..write('kind: $kind, ')
          ..write('themeId: $themeId, ')
          ..write('autoChapterTimeline: $autoChapterTimeline, ')
          ..write('timelineSortByYear: $timelineSortByYear, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FactionsTable extends Factions with TableInfo<$FactionsTable, Faction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _symbolImagePathMeta = const VerificationMeta(
    'symbolImagePath',
  );
  @override
  late final GeneratedColumn<String> symbolImagePath = GeneratedColumn<String>(
    'symbol_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _symbolIsDrawingMeta = const VerificationMeta(
    'symbolIsDrawing',
  );
  @override
  late final GeneratedColumn<bool> symbolIsDrawing = GeneratedColumn<bool>(
    'symbol_is_drawing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("symbol_is_drawing" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    type,
    description,
    symbolImagePath,
    symbolIsDrawing,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'factions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Faction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('symbol_image_path')) {
      context.handle(
        _symbolImagePathMeta,
        symbolImagePath.isAcceptableOrUnknown(
          data['symbol_image_path']!,
          _symbolImagePathMeta,
        ),
      );
    }
    if (data.containsKey('symbol_is_drawing')) {
      context.handle(
        _symbolIsDrawingMeta,
        symbolIsDrawing.isAcceptableOrUnknown(
          data['symbol_is_drawing']!,
          _symbolIsDrawingMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Faction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Faction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      symbolImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol_image_path'],
      ),
      symbolIsDrawing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}symbol_is_drawing'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $FactionsTable createAlias(String alias) {
    return $FactionsTable(attachedDatabase, alias);
  }
}

class Faction extends DataClass implements Insertable<Faction> {
  final String id;
  final String projectId;
  final String name;
  final String? type;
  final String? description;
  final String? symbolImagePath;
  final bool symbolIsDrawing;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Faction({
    required this.id,
    required this.projectId,
    required this.name,
    this.type,
    this.description,
    this.symbolImagePath,
    required this.symbolIsDrawing,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || symbolImagePath != null) {
      map['symbol_image_path'] = Variable<String>(symbolImagePath);
    }
    map['symbol_is_drawing'] = Variable<bool>(symbolIsDrawing);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FactionsCompanion toCompanion(bool nullToAbsent) {
    return FactionsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      symbolImagePath: symbolImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(symbolImagePath),
      symbolIsDrawing: Value(symbolIsDrawing),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Faction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Faction(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      symbolImagePath: serializer.fromJson<String?>(json['symbolImagePath']),
      symbolIsDrawing: serializer.fromJson<bool>(json['symbolIsDrawing']),
      status: serializer.fromJson<String?>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'description': serializer.toJson<String?>(description),
      'symbolImagePath': serializer.toJson<String?>(symbolImagePath),
      'symbolIsDrawing': serializer.toJson<bool>(symbolIsDrawing),
      'status': serializer.toJson<String?>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Faction copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> type = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> symbolImagePath = const Value.absent(),
    bool? symbolIsDrawing,
    Value<String?> status = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Faction(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    description: description.present ? description.value : this.description,
    symbolImagePath: symbolImagePath.present
        ? symbolImagePath.value
        : this.symbolImagePath,
    symbolIsDrawing: symbolIsDrawing ?? this.symbolIsDrawing,
    status: status.present ? status.value : this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Faction copyWithCompanion(FactionsCompanion data) {
    return Faction(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      symbolImagePath: data.symbolImagePath.present
          ? data.symbolImagePath.value
          : this.symbolImagePath,
      symbolIsDrawing: data.symbolIsDrawing.present
          ? data.symbolIsDrawing.value
          : this.symbolIsDrawing,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Faction(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('symbolImagePath: $symbolImagePath, ')
          ..write('symbolIsDrawing: $symbolIsDrawing, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    type,
    description,
    symbolImagePath,
    symbolIsDrawing,
    status,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Faction &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.symbolImagePath == this.symbolImagePath &&
          other.symbolIsDrawing == this.symbolIsDrawing &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FactionsCompanion extends UpdateCompanion<Faction> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> type;
  final Value<String?> description;
  final Value<String?> symbolImagePath;
  final Value<bool> symbolIsDrawing;
  final Value<String?> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FactionsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.symbolImagePath = const Value.absent(),
    this.symbolIsDrawing = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FactionsCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.symbolImagePath = const Value.absent(),
    this.symbolIsDrawing = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<Faction> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? symbolImagePath,
    Expression<bool>? symbolIsDrawing,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (symbolImagePath != null) 'symbol_image_path': symbolImagePath,
      if (symbolIsDrawing != null) 'symbol_is_drawing': symbolIsDrawing,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? type,
    Value<String?>? description,
    Value<String?>? symbolImagePath,
    Value<bool>? symbolIsDrawing,
    Value<String?>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return FactionsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      symbolImagePath: symbolImagePath ?? this.symbolImagePath,
      symbolIsDrawing: symbolIsDrawing ?? this.symbolIsDrawing,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (symbolImagePath.present) {
      map['symbol_image_path'] = Variable<String>(symbolImagePath.value);
    }
    if (symbolIsDrawing.present) {
      map['symbol_is_drawing'] = Variable<bool>(symbolIsDrawing.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('symbolImagePath: $symbolImagePath, ')
          ..write('symbolIsDrawing: $symbolIsDrawing, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _parentLocationIdMeta = const VerificationMeta(
    'parentLocationId',
  );
  @override
  late final GeneratedColumn<String> parentLocationId = GeneratedColumn<String>(
    'parent_location_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _climateMeta = const VerificationMeta(
    'climate',
  );
  @override
  late final GeneratedColumn<String> climate = GeneratedColumn<String>(
    'climate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<String> population = GeneratedColumn<String>(
    'population',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _governmentMeta = const VerificationMeta(
    'government',
  );
  @override
  late final GeneratedColumn<String> government = GeneratedColumn<String>(
    'government',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mapImagePathMeta = const VerificationMeta(
    'mapImagePath',
  );
  @override
  late final GeneratedColumn<String> mapImagePath = GeneratedColumn<String>(
    'map_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mapIsDrawingMeta = const VerificationMeta(
    'mapIsDrawing',
  );
  @override
  late final GeneratedColumn<bool> mapIsDrawing = GeneratedColumn<bool>(
    'map_is_drawing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("map_is_drawing" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    parentLocationId,
    name,
    type,
    description,
    climate,
    population,
    government,
    status,
    mapImagePath,
    mapIsDrawing,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Location> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('parent_location_id')) {
      context.handle(
        _parentLocationIdMeta,
        parentLocationId.isAcceptableOrUnknown(
          data['parent_location_id']!,
          _parentLocationIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('climate')) {
      context.handle(
        _climateMeta,
        climate.isAcceptableOrUnknown(data['climate']!, _climateMeta),
      );
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    }
    if (data.containsKey('government')) {
      context.handle(
        _governmentMeta,
        government.isAcceptableOrUnknown(data['government']!, _governmentMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('map_image_path')) {
      context.handle(
        _mapImagePathMeta,
        mapImagePath.isAcceptableOrUnknown(
          data['map_image_path']!,
          _mapImagePathMeta,
        ),
      );
    }
    if (data.containsKey('map_is_drawing')) {
      context.handle(
        _mapIsDrawingMeta,
        mapIsDrawing.isAcceptableOrUnknown(
          data['map_is_drawing']!,
          _mapIsDrawingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Location(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      parentLocationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_location_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      climate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}climate'],
      ),
      population: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}population'],
      ),
      government: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}government'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      mapImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}map_image_path'],
      ),
      mapIsDrawing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}map_is_drawing'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final String id;
  final String projectId;
  final String? parentLocationId;
  final String name;
  final String? type;
  final String? description;
  final String? climate;
  final String? population;
  final String? government;
  final String? status;
  final String? mapImagePath;
  final bool mapIsDrawing;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Location({
    required this.id,
    required this.projectId,
    this.parentLocationId,
    required this.name,
    this.type,
    this.description,
    this.climate,
    this.population,
    this.government,
    this.status,
    this.mapImagePath,
    required this.mapIsDrawing,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    if (!nullToAbsent || parentLocationId != null) {
      map['parent_location_id'] = Variable<String>(parentLocationId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || climate != null) {
      map['climate'] = Variable<String>(climate);
    }
    if (!nullToAbsent || population != null) {
      map['population'] = Variable<String>(population);
    }
    if (!nullToAbsent || government != null) {
      map['government'] = Variable<String>(government);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || mapImagePath != null) {
      map['map_image_path'] = Variable<String>(mapImagePath);
    }
    map['map_is_drawing'] = Variable<bool>(mapIsDrawing);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      parentLocationId: parentLocationId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentLocationId),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      climate: climate == null && nullToAbsent
          ? const Value.absent()
          : Value(climate),
      population: population == null && nullToAbsent
          ? const Value.absent()
          : Value(population),
      government: government == null && nullToAbsent
          ? const Value.absent()
          : Value(government),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      mapImagePath: mapImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(mapImagePath),
      mapIsDrawing: Value(mapIsDrawing),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Location.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      parentLocationId: serializer.fromJson<String?>(json['parentLocationId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      climate: serializer.fromJson<String?>(json['climate']),
      population: serializer.fromJson<String?>(json['population']),
      government: serializer.fromJson<String?>(json['government']),
      status: serializer.fromJson<String?>(json['status']),
      mapImagePath: serializer.fromJson<String?>(json['mapImagePath']),
      mapIsDrawing: serializer.fromJson<bool>(json['mapIsDrawing']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'parentLocationId': serializer.toJson<String?>(parentLocationId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'description': serializer.toJson<String?>(description),
      'climate': serializer.toJson<String?>(climate),
      'population': serializer.toJson<String?>(population),
      'government': serializer.toJson<String?>(government),
      'status': serializer.toJson<String?>(status),
      'mapImagePath': serializer.toJson<String?>(mapImagePath),
      'mapIsDrawing': serializer.toJson<bool>(mapIsDrawing),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Location copyWith({
    String? id,
    String? projectId,
    Value<String?> parentLocationId = const Value.absent(),
    String? name,
    Value<String?> type = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> climate = const Value.absent(),
    Value<String?> population = const Value.absent(),
    Value<String?> government = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> mapImagePath = const Value.absent(),
    bool? mapIsDrawing,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Location(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    parentLocationId: parentLocationId.present
        ? parentLocationId.value
        : this.parentLocationId,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    description: description.present ? description.value : this.description,
    climate: climate.present ? climate.value : this.climate,
    population: population.present ? population.value : this.population,
    government: government.present ? government.value : this.government,
    status: status.present ? status.value : this.status,
    mapImagePath: mapImagePath.present ? mapImagePath.value : this.mapImagePath,
    mapIsDrawing: mapIsDrawing ?? this.mapIsDrawing,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Location copyWithCompanion(LocationsCompanion data) {
    return Location(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      parentLocationId: data.parentLocationId.present
          ? data.parentLocationId.value
          : this.parentLocationId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      climate: data.climate.present ? data.climate.value : this.climate,
      population: data.population.present
          ? data.population.value
          : this.population,
      government: data.government.present
          ? data.government.value
          : this.government,
      status: data.status.present ? data.status.value : this.status,
      mapImagePath: data.mapImagePath.present
          ? data.mapImagePath.value
          : this.mapImagePath,
      mapIsDrawing: data.mapIsDrawing.present
          ? data.mapIsDrawing.value
          : this.mapIsDrawing,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('parentLocationId: $parentLocationId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('climate: $climate, ')
          ..write('population: $population, ')
          ..write('government: $government, ')
          ..write('status: $status, ')
          ..write('mapImagePath: $mapImagePath, ')
          ..write('mapIsDrawing: $mapIsDrawing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    parentLocationId,
    name,
    type,
    description,
    climate,
    population,
    government,
    status,
    mapImagePath,
    mapIsDrawing,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.parentLocationId == this.parentLocationId &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.climate == this.climate &&
          other.population == this.population &&
          other.government == this.government &&
          other.status == this.status &&
          other.mapImagePath == this.mapImagePath &&
          other.mapIsDrawing == this.mapIsDrawing &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String?> parentLocationId;
  final Value<String> name;
  final Value<String?> type;
  final Value<String?> description;
  final Value<String?> climate;
  final Value<String?> population;
  final Value<String?> government;
  final Value<String?> status;
  final Value<String?> mapImagePath;
  final Value<bool> mapIsDrawing;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.parentLocationId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.climate = const Value.absent(),
    this.population = const Value.absent(),
    this.government = const Value.absent(),
    this.status = const Value.absent(),
    this.mapImagePath = const Value.absent(),
    this.mapIsDrawing = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationsCompanion.insert({
    required String id,
    required String projectId,
    this.parentLocationId = const Value.absent(),
    required String name,
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.climate = const Value.absent(),
    this.population = const Value.absent(),
    this.government = const Value.absent(),
    this.status = const Value.absent(),
    this.mapImagePath = const Value.absent(),
    this.mapIsDrawing = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<Location> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? parentLocationId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? climate,
    Expression<String>? population,
    Expression<String>? government,
    Expression<String>? status,
    Expression<String>? mapImagePath,
    Expression<bool>? mapIsDrawing,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (parentLocationId != null) 'parent_location_id': parentLocationId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (climate != null) 'climate': climate,
      if (population != null) 'population': population,
      if (government != null) 'government': government,
      if (status != null) 'status': status,
      if (mapImagePath != null) 'map_image_path': mapImagePath,
      if (mapIsDrawing != null) 'map_is_drawing': mapIsDrawing,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String?>? parentLocationId,
    Value<String>? name,
    Value<String?>? type,
    Value<String?>? description,
    Value<String?>? climate,
    Value<String?>? population,
    Value<String?>? government,
    Value<String?>? status,
    Value<String?>? mapImagePath,
    Value<bool>? mapIsDrawing,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LocationsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      parentLocationId: parentLocationId ?? this.parentLocationId,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      climate: climate ?? this.climate,
      population: population ?? this.population,
      government: government ?? this.government,
      status: status ?? this.status,
      mapImagePath: mapImagePath ?? this.mapImagePath,
      mapIsDrawing: mapIsDrawing ?? this.mapIsDrawing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (parentLocationId.present) {
      map['parent_location_id'] = Variable<String>(parentLocationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (climate.present) {
      map['climate'] = Variable<String>(climate.value);
    }
    if (population.present) {
      map['population'] = Variable<String>(population.value);
    }
    if (government.present) {
      map['government'] = Variable<String>(government.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (mapImagePath.present) {
      map['map_image_path'] = Variable<String>(mapImagePath.value);
    }
    if (mapIsDrawing.present) {
      map['map_is_drawing'] = Variable<bool>(mapIsDrawing.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('parentLocationId: $parentLocationId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('climate: $climate, ')
          ..write('population: $population, ')
          ..write('government: $government, ')
          ..write('status: $status, ')
          ..write('mapImagePath: $mapImagePath, ')
          ..write('mapIsDrawing: $mapIsDrawing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aliasNicknameMeta = const VerificationMeta(
    'aliasNickname',
  );
  @override
  late final GeneratedColumn<String> aliasNickname = GeneratedColumn<String>(
    'alias_nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<String> race = GeneratedColumn<String>(
    'race',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _factionIdMeta = const VerificationMeta(
    'factionId',
  );
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
    'faction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES factions (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _physicalDescriptionMeta =
      const VerificationMeta('physicalDescription');
  @override
  late final GeneratedColumn<String> physicalDescription =
      GeneratedColumn<String>(
        'physical_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _personalityMeta = const VerificationMeta(
    'personality',
  );
  @override
  late final GeneratedColumn<String> personality = GeneratedColumn<String>(
    'personality',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backstoryMeta = const VerificationMeta(
    'backstory',
  );
  @override
  late final GeneratedColumn<String> backstory = GeneratedColumn<String>(
    'backstory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _abilitiesMeta = const VerificationMeta(
    'abilities',
  );
  @override
  late final GeneratedColumn<String> abilities = GeneratedColumn<String>(
    'abilities',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _portraitImagePathMeta = const VerificationMeta(
    'portraitImagePath',
  );
  @override
  late final GeneratedColumn<String> portraitImagePath =
      GeneratedColumn<String>(
        'portrait_image_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _portraitIsDrawingMeta = const VerificationMeta(
    'portraitIsDrawing',
  );
  @override
  late final GeneratedColumn<bool> portraitIsDrawing = GeneratedColumn<bool>(
    'portrait_is_drawing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("portrait_is_drawing" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    firstName,
    lastName,
    aliasNickname,
    race,
    gender,
    age,
    occupation,
    factionId,
    status,
    physicalDescription,
    personality,
    backstory,
    abilities,
    notes,
    portraitImagePath,
    portraitIsDrawing,
    role,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('alias_nickname')) {
      context.handle(
        _aliasNicknameMeta,
        aliasNickname.isAcceptableOrUnknown(
          data['alias_nickname']!,
          _aliasNicknameMeta,
        ),
      );
    }
    if (data.containsKey('race')) {
      context.handle(
        _raceMeta,
        race.isAcceptableOrUnknown(data['race']!, _raceMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('faction_id')) {
      context.handle(
        _factionIdMeta,
        factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('physical_description')) {
      context.handle(
        _physicalDescriptionMeta,
        physicalDescription.isAcceptableOrUnknown(
          data['physical_description']!,
          _physicalDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('personality')) {
      context.handle(
        _personalityMeta,
        personality.isAcceptableOrUnknown(
          data['personality']!,
          _personalityMeta,
        ),
      );
    }
    if (data.containsKey('backstory')) {
      context.handle(
        _backstoryMeta,
        backstory.isAcceptableOrUnknown(data['backstory']!, _backstoryMeta),
      );
    }
    if (data.containsKey('abilities')) {
      context.handle(
        _abilitiesMeta,
        abilities.isAcceptableOrUnknown(data['abilities']!, _abilitiesMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('portrait_image_path')) {
      context.handle(
        _portraitImagePathMeta,
        portraitImagePath.isAcceptableOrUnknown(
          data['portrait_image_path']!,
          _portraitImagePathMeta,
        ),
      );
    }
    if (data.containsKey('portrait_is_drawing')) {
      context.handle(
        _portraitIsDrawingMeta,
        portraitIsDrawing.isAcceptableOrUnknown(
          data['portrait_is_drawing']!,
          _portraitIsDrawingMeta,
        ),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      aliasNickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alias_nickname'],
      ),
      race: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age'],
      ),
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      factionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}faction_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      physicalDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}physical_description'],
      ),
      personality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personality'],
      ),
      backstory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backstory'],
      ),
      abilities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abilities'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      portraitImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}portrait_image_path'],
      ),
      portraitIsDrawing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}portrait_is_drawing'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final String id;
  final String projectId;
  final String firstName;
  final String? lastName;
  final String? aliasNickname;
  final String? race;
  final String? gender;
  final String? age;
  final String? occupation;
  final String? factionId;
  final String? status;
  final String? physicalDescription;
  final String? personality;
  final String? backstory;
  final String? abilities;
  final String? notes;
  final String? portraitImagePath;
  final bool portraitIsDrawing;

  /// 'pc' | 'npc' | 'enemy' — mainly for campaigns, harmless for novels.
  final String? role;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Character({
    required this.id,
    required this.projectId,
    required this.firstName,
    this.lastName,
    this.aliasNickname,
    this.race,
    this.gender,
    this.age,
    this.occupation,
    this.factionId,
    this.status,
    this.physicalDescription,
    this.personality,
    this.backstory,
    this.abilities,
    this.notes,
    this.portraitImagePath,
    required this.portraitIsDrawing,
    this.role,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || aliasNickname != null) {
      map['alias_nickname'] = Variable<String>(aliasNickname);
    }
    if (!nullToAbsent || race != null) {
      map['race'] = Variable<String>(race);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<String>(age);
    }
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || factionId != null) {
      map['faction_id'] = Variable<String>(factionId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || physicalDescription != null) {
      map['physical_description'] = Variable<String>(physicalDescription);
    }
    if (!nullToAbsent || personality != null) {
      map['personality'] = Variable<String>(personality);
    }
    if (!nullToAbsent || backstory != null) {
      map['backstory'] = Variable<String>(backstory);
    }
    if (!nullToAbsent || abilities != null) {
      map['abilities'] = Variable<String>(abilities);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || portraitImagePath != null) {
      map['portrait_image_path'] = Variable<String>(portraitImagePath);
    }
    map['portrait_is_drawing'] = Variable<bool>(portraitIsDrawing);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      projectId: Value(projectId),
      firstName: Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      aliasNickname: aliasNickname == null && nullToAbsent
          ? const Value.absent()
          : Value(aliasNickname),
      race: race == null && nullToAbsent ? const Value.absent() : Value(race),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      factionId: factionId == null && nullToAbsent
          ? const Value.absent()
          : Value(factionId),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      physicalDescription: physicalDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(physicalDescription),
      personality: personality == null && nullToAbsent
          ? const Value.absent()
          : Value(personality),
      backstory: backstory == null && nullToAbsent
          ? const Value.absent()
          : Value(backstory),
      abilities: abilities == null && nullToAbsent
          ? const Value.absent()
          : Value(abilities),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      portraitImagePath: portraitImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(portraitImagePath),
      portraitIsDrawing: Value(portraitIsDrawing),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      aliasNickname: serializer.fromJson<String?>(json['aliasNickname']),
      race: serializer.fromJson<String?>(json['race']),
      gender: serializer.fromJson<String?>(json['gender']),
      age: serializer.fromJson<String?>(json['age']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      factionId: serializer.fromJson<String?>(json['factionId']),
      status: serializer.fromJson<String?>(json['status']),
      physicalDescription: serializer.fromJson<String?>(
        json['physicalDescription'],
      ),
      personality: serializer.fromJson<String?>(json['personality']),
      backstory: serializer.fromJson<String?>(json['backstory']),
      abilities: serializer.fromJson<String?>(json['abilities']),
      notes: serializer.fromJson<String?>(json['notes']),
      portraitImagePath: serializer.fromJson<String?>(
        json['portraitImagePath'],
      ),
      portraitIsDrawing: serializer.fromJson<bool>(json['portraitIsDrawing']),
      role: serializer.fromJson<String?>(json['role']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'aliasNickname': serializer.toJson<String?>(aliasNickname),
      'race': serializer.toJson<String?>(race),
      'gender': serializer.toJson<String?>(gender),
      'age': serializer.toJson<String?>(age),
      'occupation': serializer.toJson<String?>(occupation),
      'factionId': serializer.toJson<String?>(factionId),
      'status': serializer.toJson<String?>(status),
      'physicalDescription': serializer.toJson<String?>(physicalDescription),
      'personality': serializer.toJson<String?>(personality),
      'backstory': serializer.toJson<String?>(backstory),
      'abilities': serializer.toJson<String?>(abilities),
      'notes': serializer.toJson<String?>(notes),
      'portraitImagePath': serializer.toJson<String?>(portraitImagePath),
      'portraitIsDrawing': serializer.toJson<bool>(portraitIsDrawing),
      'role': serializer.toJson<String?>(role),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Character copyWith({
    String? id,
    String? projectId,
    String? firstName,
    Value<String?> lastName = const Value.absent(),
    Value<String?> aliasNickname = const Value.absent(),
    Value<String?> race = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> age = const Value.absent(),
    Value<String?> occupation = const Value.absent(),
    Value<String?> factionId = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> physicalDescription = const Value.absent(),
    Value<String?> personality = const Value.absent(),
    Value<String?> backstory = const Value.absent(),
    Value<String?> abilities = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> portraitImagePath = const Value.absent(),
    bool? portraitIsDrawing,
    Value<String?> role = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Character(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    firstName: firstName ?? this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    aliasNickname: aliasNickname.present
        ? aliasNickname.value
        : this.aliasNickname,
    race: race.present ? race.value : this.race,
    gender: gender.present ? gender.value : this.gender,
    age: age.present ? age.value : this.age,
    occupation: occupation.present ? occupation.value : this.occupation,
    factionId: factionId.present ? factionId.value : this.factionId,
    status: status.present ? status.value : this.status,
    physicalDescription: physicalDescription.present
        ? physicalDescription.value
        : this.physicalDescription,
    personality: personality.present ? personality.value : this.personality,
    backstory: backstory.present ? backstory.value : this.backstory,
    abilities: abilities.present ? abilities.value : this.abilities,
    notes: notes.present ? notes.value : this.notes,
    portraitImagePath: portraitImagePath.present
        ? portraitImagePath.value
        : this.portraitImagePath,
    portraitIsDrawing: portraitIsDrawing ?? this.portraitIsDrawing,
    role: role.present ? role.value : this.role,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      aliasNickname: data.aliasNickname.present
          ? data.aliasNickname.value
          : this.aliasNickname,
      race: data.race.present ? data.race.value : this.race,
      gender: data.gender.present ? data.gender.value : this.gender,
      age: data.age.present ? data.age.value : this.age,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      status: data.status.present ? data.status.value : this.status,
      physicalDescription: data.physicalDescription.present
          ? data.physicalDescription.value
          : this.physicalDescription,
      personality: data.personality.present
          ? data.personality.value
          : this.personality,
      backstory: data.backstory.present ? data.backstory.value : this.backstory,
      abilities: data.abilities.present ? data.abilities.value : this.abilities,
      notes: data.notes.present ? data.notes.value : this.notes,
      portraitImagePath: data.portraitImagePath.present
          ? data.portraitImagePath.value
          : this.portraitImagePath,
      portraitIsDrawing: data.portraitIsDrawing.present
          ? data.portraitIsDrawing.value
          : this.portraitIsDrawing,
      role: data.role.present ? data.role.value : this.role,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('aliasNickname: $aliasNickname, ')
          ..write('race: $race, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('occupation: $occupation, ')
          ..write('factionId: $factionId, ')
          ..write('status: $status, ')
          ..write('physicalDescription: $physicalDescription, ')
          ..write('personality: $personality, ')
          ..write('backstory: $backstory, ')
          ..write('abilities: $abilities, ')
          ..write('notes: $notes, ')
          ..write('portraitImagePath: $portraitImagePath, ')
          ..write('portraitIsDrawing: $portraitIsDrawing, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    projectId,
    firstName,
    lastName,
    aliasNickname,
    race,
    gender,
    age,
    occupation,
    factionId,
    status,
    physicalDescription,
    personality,
    backstory,
    abilities,
    notes,
    portraitImagePath,
    portraitIsDrawing,
    role,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.aliasNickname == this.aliasNickname &&
          other.race == this.race &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.occupation == this.occupation &&
          other.factionId == this.factionId &&
          other.status == this.status &&
          other.physicalDescription == this.physicalDescription &&
          other.personality == this.personality &&
          other.backstory == this.backstory &&
          other.abilities == this.abilities &&
          other.notes == this.notes &&
          other.portraitImagePath == this.portraitImagePath &&
          other.portraitIsDrawing == this.portraitIsDrawing &&
          other.role == this.role &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> firstName;
  final Value<String?> lastName;
  final Value<String?> aliasNickname;
  final Value<String?> race;
  final Value<String?> gender;
  final Value<String?> age;
  final Value<String?> occupation;
  final Value<String?> factionId;
  final Value<String?> status;
  final Value<String?> physicalDescription;
  final Value<String?> personality;
  final Value<String?> backstory;
  final Value<String?> abilities;
  final Value<String?> notes;
  final Value<String?> portraitImagePath;
  final Value<bool> portraitIsDrawing;
  final Value<String?> role;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.aliasNickname = const Value.absent(),
    this.race = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.occupation = const Value.absent(),
    this.factionId = const Value.absent(),
    this.status = const Value.absent(),
    this.physicalDescription = const Value.absent(),
    this.personality = const Value.absent(),
    this.backstory = const Value.absent(),
    this.abilities = const Value.absent(),
    this.notes = const Value.absent(),
    this.portraitImagePath = const Value.absent(),
    this.portraitIsDrawing = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersCompanion.insert({
    required String id,
    required String projectId,
    required String firstName,
    this.lastName = const Value.absent(),
    this.aliasNickname = const Value.absent(),
    this.race = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.occupation = const Value.absent(),
    this.factionId = const Value.absent(),
    this.status = const Value.absent(),
    this.physicalDescription = const Value.absent(),
    this.personality = const Value.absent(),
    this.backstory = const Value.absent(),
    this.abilities = const Value.absent(),
    this.notes = const Value.absent(),
    this.portraitImagePath = const Value.absent(),
    this.portraitIsDrawing = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       firstName = Value(firstName);
  static Insertable<Character> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? aliasNickname,
    Expression<String>? race,
    Expression<String>? gender,
    Expression<String>? age,
    Expression<String>? occupation,
    Expression<String>? factionId,
    Expression<String>? status,
    Expression<String>? physicalDescription,
    Expression<String>? personality,
    Expression<String>? backstory,
    Expression<String>? abilities,
    Expression<String>? notes,
    Expression<String>? portraitImagePath,
    Expression<bool>? portraitIsDrawing,
    Expression<String>? role,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (aliasNickname != null) 'alias_nickname': aliasNickname,
      if (race != null) 'race': race,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (occupation != null) 'occupation': occupation,
      if (factionId != null) 'faction_id': factionId,
      if (status != null) 'status': status,
      if (physicalDescription != null)
        'physical_description': physicalDescription,
      if (personality != null) 'personality': personality,
      if (backstory != null) 'backstory': backstory,
      if (abilities != null) 'abilities': abilities,
      if (notes != null) 'notes': notes,
      if (portraitImagePath != null) 'portrait_image_path': portraitImagePath,
      if (portraitIsDrawing != null) 'portrait_is_drawing': portraitIsDrawing,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? firstName,
    Value<String?>? lastName,
    Value<String?>? aliasNickname,
    Value<String?>? race,
    Value<String?>? gender,
    Value<String?>? age,
    Value<String?>? occupation,
    Value<String?>? factionId,
    Value<String?>? status,
    Value<String?>? physicalDescription,
    Value<String?>? personality,
    Value<String?>? backstory,
    Value<String?>? abilities,
    Value<String?>? notes,
    Value<String?>? portraitImagePath,
    Value<bool>? portraitIsDrawing,
    Value<String?>? role,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      aliasNickname: aliasNickname ?? this.aliasNickname,
      race: race ?? this.race,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      occupation: occupation ?? this.occupation,
      factionId: factionId ?? this.factionId,
      status: status ?? this.status,
      physicalDescription: physicalDescription ?? this.physicalDescription,
      personality: personality ?? this.personality,
      backstory: backstory ?? this.backstory,
      abilities: abilities ?? this.abilities,
      notes: notes ?? this.notes,
      portraitImagePath: portraitImagePath ?? this.portraitImagePath,
      portraitIsDrawing: portraitIsDrawing ?? this.portraitIsDrawing,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (aliasNickname.present) {
      map['alias_nickname'] = Variable<String>(aliasNickname.value);
    }
    if (race.present) {
      map['race'] = Variable<String>(race.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<String>(factionId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (physicalDescription.present) {
      map['physical_description'] = Variable<String>(physicalDescription.value);
    }
    if (personality.present) {
      map['personality'] = Variable<String>(personality.value);
    }
    if (backstory.present) {
      map['backstory'] = Variable<String>(backstory.value);
    }
    if (abilities.present) {
      map['abilities'] = Variable<String>(abilities.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (portraitImagePath.present) {
      map['portrait_image_path'] = Variable<String>(portraitImagePath.value);
    }
    if (portraitIsDrawing.present) {
      map['portrait_is_drawing'] = Variable<bool>(portraitIsDrawing.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('aliasNickname: $aliasNickname, ')
          ..write('race: $race, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('occupation: $occupation, ')
          ..write('factionId: $factionId, ')
          ..write('status: $status, ')
          ..write('physicalDescription: $physicalDescription, ')
          ..write('personality: $personality, ')
          ..write('backstory: $backstory, ')
          ..write('abilities: $abilities, ')
          ..write('notes: $notes, ')
          ..write('portraitImagePath: $portraitImagePath, ')
          ..write('portraitIsDrawing: $portraitIsDrawing, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionDateMeta = const VerificationMeta(
    'sessionDate',
  );
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
    'session_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wordGoalMeta = const VerificationMeta(
    'wordGoal',
  );
  @override
  late final GeneratedColumn<int> wordGoal = GeneratedColumn<int>(
    'word_goal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storyYearMeta = const VerificationMeta(
    'storyYear',
  );
  @override
  late final GeneratedColumn<int> storyYear = GeneratedColumn<int>(
    'story_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortIndexMeta = const VerificationMeta(
    'sortIndex',
  );
  @override
  late final GeneratedColumn<int> sortIndex = GeneratedColumn<int>(
    'sort_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    title,
    summary,
    content,
    status,
    sessionDate,
    wordGoal,
    storyYear,
    sortIndex,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chapter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('session_date')) {
      context.handle(
        _sessionDateMeta,
        sessionDate.isAcceptableOrUnknown(
          data['session_date']!,
          _sessionDateMeta,
        ),
      );
    }
    if (data.containsKey('word_goal')) {
      context.handle(
        _wordGoalMeta,
        wordGoal.isAcceptableOrUnknown(data['word_goal']!, _wordGoalMeta),
      );
    }
    if (data.containsKey('story_year')) {
      context.handle(
        _storyYearMeta,
        storyYear.isAcceptableOrUnknown(data['story_year']!, _storyYearMeta),
      );
    }
    if (data.containsKey('sort_index')) {
      context.handle(
        _sortIndexMeta,
        sortIndex.isAcceptableOrUnknown(data['sort_index']!, _sortIndexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      sessionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}session_date'],
      ),
      wordGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word_goal'],
      ),
      storyYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}story_year'],
      ),
      sortIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final String id;
  final String projectId;
  final String title;
  final String? summary;
  final String? content;
  final String? status;

  /// Real-world date the session was played (campaigns only).
  final DateTime? sessionDate;

  /// Target word count for this chapter, if the writer set one.
  final int? wordGoal;

  /// In-story year this chapter happens in, used to place it on the
  /// timeline chronologically.
  final int? storyYear;
  final int sortIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Chapter({
    required this.id,
    required this.projectId,
    required this.title,
    this.summary,
    this.content,
    this.status,
    this.sessionDate,
    this.wordGoal,
    this.storyYear,
    required this.sortIndex,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || sessionDate != null) {
      map['session_date'] = Variable<DateTime>(sessionDate);
    }
    if (!nullToAbsent || wordGoal != null) {
      map['word_goal'] = Variable<int>(wordGoal);
    }
    if (!nullToAbsent || storyYear != null) {
      map['story_year'] = Variable<int>(storyYear);
    }
    map['sort_index'] = Variable<int>(sortIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      projectId: Value(projectId),
      title: Value(title),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      sessionDate: sessionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionDate),
      wordGoal: wordGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(wordGoal),
      storyYear: storyYear == null && nullToAbsent
          ? const Value.absent()
          : Value(storyYear),
      sortIndex: Value(sortIndex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Chapter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String?>(json['summary']),
      content: serializer.fromJson<String?>(json['content']),
      status: serializer.fromJson<String?>(json['status']),
      sessionDate: serializer.fromJson<DateTime?>(json['sessionDate']),
      wordGoal: serializer.fromJson<int?>(json['wordGoal']),
      storyYear: serializer.fromJson<int?>(json['storyYear']),
      sortIndex: serializer.fromJson<int>(json['sortIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String?>(summary),
      'content': serializer.toJson<String?>(content),
      'status': serializer.toJson<String?>(status),
      'sessionDate': serializer.toJson<DateTime?>(sessionDate),
      'wordGoal': serializer.toJson<int?>(wordGoal),
      'storyYear': serializer.toJson<int?>(storyYear),
      'sortIndex': serializer.toJson<int>(sortIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Chapter copyWith({
    String? id,
    String? projectId,
    String? title,
    Value<String?> summary = const Value.absent(),
    Value<String?> content = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<DateTime?> sessionDate = const Value.absent(),
    Value<int?> wordGoal = const Value.absent(),
    Value<int?> storyYear = const Value.absent(),
    int? sortIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Chapter(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    title: title ?? this.title,
    summary: summary.present ? summary.value : this.summary,
    content: content.present ? content.value : this.content,
    status: status.present ? status.value : this.status,
    sessionDate: sessionDate.present ? sessionDate.value : this.sessionDate,
    wordGoal: wordGoal.present ? wordGoal.value : this.wordGoal,
    storyYear: storyYear.present ? storyYear.value : this.storyYear,
    sortIndex: sortIndex ?? this.sortIndex,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Chapter copyWithCompanion(ChaptersCompanion data) {
    return Chapter(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      content: data.content.present ? data.content.value : this.content,
      status: data.status.present ? data.status.value : this.status,
      sessionDate: data.sessionDate.present
          ? data.sessionDate.value
          : this.sessionDate,
      wordGoal: data.wordGoal.present ? data.wordGoal.value : this.wordGoal,
      storyYear: data.storyYear.present ? data.storyYear.value : this.storyYear,
      sortIndex: data.sortIndex.present ? data.sortIndex.value : this.sortIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('wordGoal: $wordGoal, ')
          ..write('storyYear: $storyYear, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    title,
    summary,
    content,
    status,
    sessionDate,
    wordGoal,
    storyYear,
    sortIndex,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.content == this.content &&
          other.status == this.status &&
          other.sessionDate == this.sessionDate &&
          other.wordGoal == this.wordGoal &&
          other.storyYear == this.storyYear &&
          other.sortIndex == this.sortIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> title;
  final Value<String?> summary;
  final Value<String?> content;
  final Value<String?> status;
  final Value<DateTime?> sessionDate;
  final Value<int?> wordGoal;
  final Value<int?> storyYear;
  final Value<int> sortIndex;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.status = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.wordGoal = const Value.absent(),
    this.storyYear = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChaptersCompanion.insert({
    required String id,
    required String projectId,
    required String title,
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.status = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.wordGoal = const Value.absent(),
    this.storyYear = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       title = Value(title);
  static Insertable<Chapter> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? content,
    Expression<String>? status,
    Expression<DateTime>? sessionDate,
    Expression<int>? wordGoal,
    Expression<int>? storyYear,
    Expression<int>? sortIndex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (content != null) 'content': content,
      if (status != null) 'status': status,
      if (sessionDate != null) 'session_date': sessionDate,
      if (wordGoal != null) 'word_goal': wordGoal,
      if (storyYear != null) 'story_year': storyYear,
      if (sortIndex != null) 'sort_index': sortIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChaptersCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? title,
    Value<String?>? summary,
    Value<String?>? content,
    Value<String?>? status,
    Value<DateTime?>? sessionDate,
    Value<int?>? wordGoal,
    Value<int?>? storyYear,
    Value<int>? sortIndex,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ChaptersCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      status: status ?? this.status,
      sessionDate: sessionDate ?? this.sessionDate,
      wordGoal: wordGoal ?? this.wordGoal,
      storyYear: storyYear ?? this.storyYear,
      sortIndex: sortIndex ?? this.sortIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (wordGoal.present) {
      map['word_goal'] = Variable<int>(wordGoal.value);
    }
    if (storyYear.present) {
      map['story_year'] = Variable<int>(storyYear.value);
    }
    if (sortIndex.present) {
      map['sort_index'] = Variable<int>(sortIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('status: $status, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('wordGoal: $wordGoal, ')
          ..write('storyYear: $storyYear, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimelineEventsTable extends TimelineEvents
    with TableInfo<$TimelineEventsTable, TimelineEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fictionalDateMeta = const VerificationMeta(
    'fictionalDate',
  );
  @override
  late final GeneratedColumn<String> fictionalDate = GeneratedColumn<String>(
    'fictional_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceChapterIdMeta = const VerificationMeta(
    'sourceChapterId',
  );
  @override
  late final GeneratedColumn<String> sourceChapterId = GeneratedColumn<String>(
    'source_chapter_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _sortIndexMeta = const VerificationMeta(
    'sortIndex',
  );
  @override
  late final GeneratedColumn<int> sortIndex = GeneratedColumn<int>(
    'sort_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    title,
    fictionalDate,
    description,
    locationId,
    year,
    sourceChapterId,
    sortIndex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimelineEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('fictional_date')) {
      context.handle(
        _fictionalDateMeta,
        fictionalDate.isAcceptableOrUnknown(
          data['fictional_date']!,
          _fictionalDateMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('source_chapter_id')) {
      context.handle(
        _sourceChapterIdMeta,
        sourceChapterId.isAcceptableOrUnknown(
          data['source_chapter_id']!,
          _sourceChapterIdMeta,
        ),
      );
    }
    if (data.containsKey('sort_index')) {
      context.handle(
        _sortIndexMeta,
        sortIndex.isAcceptableOrUnknown(data['sort_index']!, _sortIndexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      fictionalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fictional_date'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      sourceChapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_chapter_id'],
      ),
      sortIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TimelineEventsTable createAlias(String alias) {
    return $TimelineEventsTable(attachedDatabase, alias);
  }
}

class TimelineEvent extends DataClass implements Insertable<TimelineEvent> {
  final String id;
  final String projectId;
  final String title;
  final String? fictionalDate;
  final String? description;
  final String? locationId;

  /// Numeric in-story year, used to sort chronologically. Kept separate
  /// from [fictionalDate], which stays free text ("12 del invierno largo").
  final int? year;

  /// Set when this event was mirrored from a chapter. The chapter owns the
  /// text while the link exists; unlinking turns it into a normal event.
  final String? sourceChapterId;
  final int sortIndex;
  final DateTime createdAt;
  const TimelineEvent({
    required this.id,
    required this.projectId,
    required this.title,
    this.fictionalDate,
    this.description,
    this.locationId,
    this.year,
    this.sourceChapterId,
    required this.sortIndex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || fictionalDate != null) {
      map['fictional_date'] = Variable<String>(fictionalDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<String>(locationId);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || sourceChapterId != null) {
      map['source_chapter_id'] = Variable<String>(sourceChapterId);
    }
    map['sort_index'] = Variable<int>(sortIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TimelineEventsCompanion toCompanion(bool nullToAbsent) {
    return TimelineEventsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      title: Value(title),
      fictionalDate: fictionalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(fictionalDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      sourceChapterId: sourceChapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceChapterId),
      sortIndex: Value(sortIndex),
      createdAt: Value(createdAt),
    );
  }

  factory TimelineEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineEvent(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      title: serializer.fromJson<String>(json['title']),
      fictionalDate: serializer.fromJson<String?>(json['fictionalDate']),
      description: serializer.fromJson<String?>(json['description']),
      locationId: serializer.fromJson<String?>(json['locationId']),
      year: serializer.fromJson<int?>(json['year']),
      sourceChapterId: serializer.fromJson<String?>(json['sourceChapterId']),
      sortIndex: serializer.fromJson<int>(json['sortIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'title': serializer.toJson<String>(title),
      'fictionalDate': serializer.toJson<String?>(fictionalDate),
      'description': serializer.toJson<String?>(description),
      'locationId': serializer.toJson<String?>(locationId),
      'year': serializer.toJson<int?>(year),
      'sourceChapterId': serializer.toJson<String?>(sourceChapterId),
      'sortIndex': serializer.toJson<int>(sortIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TimelineEvent copyWith({
    String? id,
    String? projectId,
    String? title,
    Value<String?> fictionalDate = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> locationId = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<String?> sourceChapterId = const Value.absent(),
    int? sortIndex,
    DateTime? createdAt,
  }) => TimelineEvent(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    title: title ?? this.title,
    fictionalDate: fictionalDate.present
        ? fictionalDate.value
        : this.fictionalDate,
    description: description.present ? description.value : this.description,
    locationId: locationId.present ? locationId.value : this.locationId,
    year: year.present ? year.value : this.year,
    sourceChapterId: sourceChapterId.present
        ? sourceChapterId.value
        : this.sourceChapterId,
    sortIndex: sortIndex ?? this.sortIndex,
    createdAt: createdAt ?? this.createdAt,
  );
  TimelineEvent copyWithCompanion(TimelineEventsCompanion data) {
    return TimelineEvent(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      title: data.title.present ? data.title.value : this.title,
      fictionalDate: data.fictionalDate.present
          ? data.fictionalDate.value
          : this.fictionalDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      year: data.year.present ? data.year.value : this.year,
      sourceChapterId: data.sourceChapterId.present
          ? data.sourceChapterId.value
          : this.sourceChapterId,
      sortIndex: data.sortIndex.present ? data.sortIndex.value : this.sortIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEvent(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('fictionalDate: $fictionalDate, ')
          ..write('description: $description, ')
          ..write('locationId: $locationId, ')
          ..write('year: $year, ')
          ..write('sourceChapterId: $sourceChapterId, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    title,
    fictionalDate,
    description,
    locationId,
    year,
    sourceChapterId,
    sortIndex,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineEvent &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.title == this.title &&
          other.fictionalDate == this.fictionalDate &&
          other.description == this.description &&
          other.locationId == this.locationId &&
          other.year == this.year &&
          other.sourceChapterId == this.sourceChapterId &&
          other.sortIndex == this.sortIndex &&
          other.createdAt == this.createdAt);
}

class TimelineEventsCompanion extends UpdateCompanion<TimelineEvent> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> title;
  final Value<String?> fictionalDate;
  final Value<String?> description;
  final Value<String?> locationId;
  final Value<int?> year;
  final Value<String?> sourceChapterId;
  final Value<int> sortIndex;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TimelineEventsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.title = const Value.absent(),
    this.fictionalDate = const Value.absent(),
    this.description = const Value.absent(),
    this.locationId = const Value.absent(),
    this.year = const Value.absent(),
    this.sourceChapterId = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimelineEventsCompanion.insert({
    required String id,
    required String projectId,
    required String title,
    this.fictionalDate = const Value.absent(),
    this.description = const Value.absent(),
    this.locationId = const Value.absent(),
    this.year = const Value.absent(),
    this.sourceChapterId = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       title = Value(title);
  static Insertable<TimelineEvent> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? title,
    Expression<String>? fictionalDate,
    Expression<String>? description,
    Expression<String>? locationId,
    Expression<int>? year,
    Expression<String>? sourceChapterId,
    Expression<int>? sortIndex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (title != null) 'title': title,
      if (fictionalDate != null) 'fictional_date': fictionalDate,
      if (description != null) 'description': description,
      if (locationId != null) 'location_id': locationId,
      if (year != null) 'year': year,
      if (sourceChapterId != null) 'source_chapter_id': sourceChapterId,
      if (sortIndex != null) 'sort_index': sortIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimelineEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? title,
    Value<String?>? fictionalDate,
    Value<String?>? description,
    Value<String?>? locationId,
    Value<int?>? year,
    Value<String?>? sourceChapterId,
    Value<int>? sortIndex,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TimelineEventsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      fictionalDate: fictionalDate ?? this.fictionalDate,
      description: description ?? this.description,
      locationId: locationId ?? this.locationId,
      year: year ?? this.year,
      sourceChapterId: sourceChapterId ?? this.sourceChapterId,
      sortIndex: sortIndex ?? this.sortIndex,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (fictionalDate.present) {
      map['fictional_date'] = Variable<String>(fictionalDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (sourceChapterId.present) {
      map['source_chapter_id'] = Variable<String>(sourceChapterId.value);
    }
    if (sortIndex.present) {
      map['sort_index'] = Variable<int>(sortIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineEventsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('fictionalDate: $fictionalDate, ')
          ..write('description: $description, ')
          ..write('locationId: $locationId, ')
          ..write('year: $year, ')
          ..write('sourceChapterId: $sourceChapterId, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterRelationshipsTable extends CharacterRelationships
    with TableInfo<$CharacterRelationshipsTable, CharacterRelationship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterRelationshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _relationshipTypeMeta = const VerificationMeta(
    'relationshipType',
  );
  @override
  late final GeneratedColumn<String> relationshipType = GeneratedColumn<String>(
    'relationship_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    relationshipType,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_relationships';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterRelationship> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('relationship_type')) {
      context.handle(
        _relationshipTypeMeta,
        relationshipType.isAcceptableOrUnknown(
          data['relationship_type']!,
          _relationshipTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterRelationship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterRelationship(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      relationshipType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CharacterRelationshipsTable createAlias(String alias) {
    return $CharacterRelationshipsTable(attachedDatabase, alias);
  }
}

class CharacterRelationship extends DataClass
    implements Insertable<CharacterRelationship> {
  final String id;
  final String projectId;
  final String relationshipType;
  final String? description;
  final DateTime createdAt;
  const CharacterRelationship({
    required this.id,
    required this.projectId,
    required this.relationshipType,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['relationship_type'] = Variable<String>(relationshipType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CharacterRelationshipsCompanion toCompanion(bool nullToAbsent) {
    return CharacterRelationshipsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      relationshipType: Value(relationshipType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory CharacterRelationship.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterRelationship(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      relationshipType: serializer.fromJson<String>(json['relationshipType']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'relationshipType': serializer.toJson<String>(relationshipType),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CharacterRelationship copyWith({
    String? id,
    String? projectId,
    String? relationshipType,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => CharacterRelationship(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    relationshipType: relationshipType ?? this.relationshipType,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  CharacterRelationship copyWithCompanion(
    CharacterRelationshipsCompanion data,
  ) {
    return CharacterRelationship(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      relationshipType: data.relationshipType.present
          ? data.relationshipType.value
          : this.relationshipType,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterRelationship(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, relationshipType, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterRelationship &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.relationshipType == this.relationshipType &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class CharacterRelationshipsCompanion
    extends UpdateCompanion<CharacterRelationship> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> relationshipType;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CharacterRelationshipsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.relationshipType = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterRelationshipsCompanion.insert({
    required String id,
    required String projectId,
    required String relationshipType,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       relationshipType = Value(relationshipType);
  static Insertable<CharacterRelationship> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? relationshipType,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (relationshipType != null) 'relationship_type': relationshipType,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterRelationshipsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? relationshipType,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CharacterRelationshipsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      relationshipType: relationshipType ?? this.relationshipType,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (relationshipType.present) {
      map['relationship_type'] = Variable<String>(relationshipType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterRelationshipsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('relationshipType: $relationshipType, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationshipMembersTable extends RelationshipMembers
    with TableInfo<$RelationshipMembersTable, RelationshipMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _relationshipIdMeta = const VerificationMeta(
    'relationshipId',
  );
  @override
  late final GeneratedColumn<String> relationshipId = GeneratedColumn<String>(
    'relationship_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES character_relationships (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [relationshipId, characterId, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationship_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelationshipMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('relationship_id')) {
      context.handle(
        _relationshipIdMeta,
        relationshipId.isAcceptableOrUnknown(
          data['relationship_id']!,
          _relationshipIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {relationshipId, characterId};
  @override
  RelationshipMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationshipMember(
      relationshipId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship_id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
    );
  }

  @override
  $RelationshipMembersTable createAlias(String alias) {
    return $RelationshipMembersTable(attachedDatabase, alias);
  }
}

class RelationshipMember extends DataClass
    implements Insertable<RelationshipMember> {
  final String relationshipId;
  final String characterId;

  /// Optional per-member label, e.g. Aria is the "hermana mayor" of the trio.
  final String? role;
  const RelationshipMember({
    required this.relationshipId,
    required this.characterId,
    this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['relationship_id'] = Variable<String>(relationshipId);
    map['character_id'] = Variable<String>(characterId);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    return map;
  }

  RelationshipMembersCompanion toCompanion(bool nullToAbsent) {
    return RelationshipMembersCompanion(
      relationshipId: Value(relationshipId),
      characterId: Value(characterId),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  factory RelationshipMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationshipMember(
      relationshipId: serializer.fromJson<String>(json['relationshipId']),
      characterId: serializer.fromJson<String>(json['characterId']),
      role: serializer.fromJson<String?>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'relationshipId': serializer.toJson<String>(relationshipId),
      'characterId': serializer.toJson<String>(characterId),
      'role': serializer.toJson<String?>(role),
    };
  }

  RelationshipMember copyWith({
    String? relationshipId,
    String? characterId,
    Value<String?> role = const Value.absent(),
  }) => RelationshipMember(
    relationshipId: relationshipId ?? this.relationshipId,
    characterId: characterId ?? this.characterId,
    role: role.present ? role.value : this.role,
  );
  RelationshipMember copyWithCompanion(RelationshipMembersCompanion data) {
    return RelationshipMember(
      relationshipId: data.relationshipId.present
          ? data.relationshipId.value
          : this.relationshipId,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipMember(')
          ..write('relationshipId: $relationshipId, ')
          ..write('characterId: $characterId, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(relationshipId, characterId, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationshipMember &&
          other.relationshipId == this.relationshipId &&
          other.characterId == this.characterId &&
          other.role == this.role);
}

class RelationshipMembersCompanion extends UpdateCompanion<RelationshipMember> {
  final Value<String> relationshipId;
  final Value<String> characterId;
  final Value<String?> role;
  final Value<int> rowid;
  const RelationshipMembersCompanion({
    this.relationshipId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationshipMembersCompanion.insert({
    required String relationshipId,
    required String characterId,
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : relationshipId = Value(relationshipId),
       characterId = Value(characterId);
  static Insertable<RelationshipMember> custom({
    Expression<String>? relationshipId,
    Expression<String>? characterId,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (relationshipId != null) 'relationship_id': relationshipId,
      if (characterId != null) 'character_id': characterId,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationshipMembersCompanion copyWith({
    Value<String>? relationshipId,
    Value<String>? characterId,
    Value<String?>? role,
    Value<int>? rowid,
  }) {
    return RelationshipMembersCompanion(
      relationshipId: relationshipId ?? this.relationshipId,
      characterId: characterId ?? this.characterId,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (relationshipId.present) {
      map['relationship_id'] = Variable<String>(relationshipId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipMembersCompanion(')
          ..write('relationshipId: $relationshipId, ')
          ..write('characterId: $characterId, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventCharactersTable extends EventCharacters
    with TableInfo<$EventCharactersTable, EventCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timeline_events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, characterId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId, characterId};
  @override
  EventCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventCharacter(
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
    );
  }

  @override
  $EventCharactersTable createAlias(String alias) {
    return $EventCharactersTable(attachedDatabase, alias);
  }
}

class EventCharacter extends DataClass implements Insertable<EventCharacter> {
  final String eventId;
  final String characterId;
  const EventCharacter({required this.eventId, required this.characterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['character_id'] = Variable<String>(characterId);
    return map;
  }

  EventCharactersCompanion toCompanion(bool nullToAbsent) {
    return EventCharactersCompanion(
      eventId: Value(eventId),
      characterId: Value(characterId),
    );
  }

  factory EventCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventCharacter(
      eventId: serializer.fromJson<String>(json['eventId']),
      characterId: serializer.fromJson<String>(json['characterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventId': serializer.toJson<String>(eventId),
      'characterId': serializer.toJson<String>(characterId),
    };
  }

  EventCharacter copyWith({String? eventId, String? characterId}) =>
      EventCharacter(
        eventId: eventId ?? this.eventId,
        characterId: characterId ?? this.characterId,
      );
  EventCharacter copyWithCompanion(EventCharactersCompanion data) {
    return EventCharacter(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventCharacter(')
          ..write('eventId: $eventId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventId, characterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventCharacter &&
          other.eventId == this.eventId &&
          other.characterId == this.characterId);
}

class EventCharactersCompanion extends UpdateCompanion<EventCharacter> {
  final Value<String> eventId;
  final Value<String> characterId;
  final Value<int> rowid;
  const EventCharactersCompanion({
    this.eventId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventCharactersCompanion.insert({
    required String eventId,
    required String characterId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       characterId = Value(characterId);
  static Insertable<EventCharacter> custom({
    Expression<String>? eventId,
    Expression<String>? characterId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (characterId != null) 'character_id': characterId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventCharactersCompanion copyWith({
    Value<String>? eventId,
    Value<String>? characterId,
    Value<int>? rowid,
  }) {
    return EventCharactersCompanion(
      eventId: eventId ?? this.eventId,
      characterId: characterId ?? this.characterId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventCharactersCompanion(')
          ..write('eventId: $eventId, ')
          ..write('characterId: $characterId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChapterCharactersTable extends ChapterCharacters
    with TableInfo<$ChapterCharactersTable, ChapterCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [chapterId, characterId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapter_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChapterCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {chapterId, characterId};
  @override
  ChapterCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChapterCharacter(
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
    );
  }

  @override
  $ChapterCharactersTable createAlias(String alias) {
    return $ChapterCharactersTable(attachedDatabase, alias);
  }
}

class ChapterCharacter extends DataClass
    implements Insertable<ChapterCharacter> {
  final String chapterId;
  final String characterId;
  const ChapterCharacter({required this.chapterId, required this.characterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chapter_id'] = Variable<String>(chapterId);
    map['character_id'] = Variable<String>(characterId);
    return map;
  }

  ChapterCharactersCompanion toCompanion(bool nullToAbsent) {
    return ChapterCharactersCompanion(
      chapterId: Value(chapterId),
      characterId: Value(characterId),
    );
  }

  factory ChapterCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChapterCharacter(
      chapterId: serializer.fromJson<String>(json['chapterId']),
      characterId: serializer.fromJson<String>(json['characterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chapterId': serializer.toJson<String>(chapterId),
      'characterId': serializer.toJson<String>(characterId),
    };
  }

  ChapterCharacter copyWith({String? chapterId, String? characterId}) =>
      ChapterCharacter(
        chapterId: chapterId ?? this.chapterId,
        characterId: characterId ?? this.characterId,
      );
  ChapterCharacter copyWithCompanion(ChapterCharactersCompanion data) {
    return ChapterCharacter(
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChapterCharacter(')
          ..write('chapterId: $chapterId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chapterId, characterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChapterCharacter &&
          other.chapterId == this.chapterId &&
          other.characterId == this.characterId);
}

class ChapterCharactersCompanion extends UpdateCompanion<ChapterCharacter> {
  final Value<String> chapterId;
  final Value<String> characterId;
  final Value<int> rowid;
  const ChapterCharactersCompanion({
    this.chapterId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChapterCharactersCompanion.insert({
    required String chapterId,
    required String characterId,
    this.rowid = const Value.absent(),
  }) : chapterId = Value(chapterId),
       characterId = Value(characterId);
  static Insertable<ChapterCharacter> custom({
    Expression<String>? chapterId,
    Expression<String>? characterId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (chapterId != null) 'chapter_id': chapterId,
      if (characterId != null) 'character_id': characterId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChapterCharactersCompanion copyWith({
    Value<String>? chapterId,
    Value<String>? characterId,
    Value<int>? rowid,
  }) {
    return ChapterCharactersCompanion(
      chapterId: chapterId ?? this.chapterId,
      characterId: characterId ?? this.characterId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChapterCharactersCompanion(')
          ..write('chapterId: $chapterId, ')
          ..write('characterId: $characterId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChapterLocationsTable extends ChapterLocations
    with TableInfo<$ChapterLocationsTable, ChapterLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [chapterId, locationId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapter_locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChapterLocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {chapterId, locationId};
  @override
  ChapterLocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChapterLocation(
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
    );
  }

  @override
  $ChapterLocationsTable createAlias(String alias) {
    return $ChapterLocationsTable(attachedDatabase, alias);
  }
}

class ChapterLocation extends DataClass implements Insertable<ChapterLocation> {
  final String chapterId;
  final String locationId;
  const ChapterLocation({required this.chapterId, required this.locationId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chapter_id'] = Variable<String>(chapterId);
    map['location_id'] = Variable<String>(locationId);
    return map;
  }

  ChapterLocationsCompanion toCompanion(bool nullToAbsent) {
    return ChapterLocationsCompanion(
      chapterId: Value(chapterId),
      locationId: Value(locationId),
    );
  }

  factory ChapterLocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChapterLocation(
      chapterId: serializer.fromJson<String>(json['chapterId']),
      locationId: serializer.fromJson<String>(json['locationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chapterId': serializer.toJson<String>(chapterId),
      'locationId': serializer.toJson<String>(locationId),
    };
  }

  ChapterLocation copyWith({String? chapterId, String? locationId}) =>
      ChapterLocation(
        chapterId: chapterId ?? this.chapterId,
        locationId: locationId ?? this.locationId,
      );
  ChapterLocation copyWithCompanion(ChapterLocationsCompanion data) {
    return ChapterLocation(
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChapterLocation(')
          ..write('chapterId: $chapterId, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chapterId, locationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChapterLocation &&
          other.chapterId == this.chapterId &&
          other.locationId == this.locationId);
}

class ChapterLocationsCompanion extends UpdateCompanion<ChapterLocation> {
  final Value<String> chapterId;
  final Value<String> locationId;
  final Value<int> rowid;
  const ChapterLocationsCompanion({
    this.chapterId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChapterLocationsCompanion.insert({
    required String chapterId,
    required String locationId,
    this.rowid = const Value.absent(),
  }) : chapterId = Value(chapterId),
       locationId = Value(locationId);
  static Insertable<ChapterLocation> custom({
    Expression<String>? chapterId,
    Expression<String>? locationId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (chapterId != null) 'chapter_id': chapterId,
      if (locationId != null) 'location_id': locationId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChapterLocationsCompanion copyWith({
    Value<String>? chapterId,
    Value<String>? locationId,
    Value<int>? rowid,
  }) {
    return ChapterLocationsCompanion(
      chapterId: chapterId ?? this.chapterId,
      locationId: locationId ?? this.locationId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChapterLocationsCompanion(')
          ..write('chapterId: $chapterId, ')
          ..write('locationId: $locationId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    title,
    content,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String projectId;
  final String title;
  final String? content;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Note({
    required this.id,
    required this.projectId,
    required this.title,
    this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      projectId: Value(projectId),
      title: Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Note copyWith({
    String? id,
    String? projectId,
    String? title,
    Value<String?> content = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Note(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    title: title ?? this.title,
    content: content.present ? content.value : this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, title, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> title;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String projectId,
    required String title,
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       title = Value(title);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? title,
    Value<String?>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _powersMeta = const VerificationMeta('powers');
  @override
  late final GeneratedColumn<String> powers = GeneratedColumn<String>(
    'powers',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerCharacterIdMeta = const VerificationMeta(
    'ownerCharacterId',
  );
  @override
  late final GeneratedColumn<String> ownerCharacterId = GeneratedColumn<String>(
    'owner_character_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    type,
    description,
    powers,
    origin,
    ownerCharacterId,
    locationId,
    imagePath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<Item> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('powers')) {
      context.handle(
        _powersMeta,
        powers.isAcceptableOrUnknown(data['powers']!, _powersMeta),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('owner_character_id')) {
      context.handle(
        _ownerCharacterIdMeta,
        ownerCharacterId.isAcceptableOrUnknown(
          data['owner_character_id']!,
          _ownerCharacterIdMeta,
        ),
      );
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      powers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}powers'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      ownerCharacterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_character_id'],
      ),
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final String id;
  final String projectId;
  final String name;
  final String? type;
  final String? description;
  final String? powers;
  final String? origin;
  final String? ownerCharacterId;
  final String? locationId;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Item({
    required this.id,
    required this.projectId,
    required this.name,
    this.type,
    this.description,
    this.powers,
    this.origin,
    this.ownerCharacterId,
    this.locationId,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || powers != null) {
      map['powers'] = Variable<String>(powers);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || ownerCharacterId != null) {
      map['owner_character_id'] = Variable<String>(ownerCharacterId);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<String>(locationId);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      powers: powers == null && nullToAbsent
          ? const Value.absent()
          : Value(powers),
      origin: origin == null && nullToAbsent
          ? const Value.absent()
          : Value(origin),
      ownerCharacterId: ownerCharacterId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerCharacterId),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Item.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      powers: serializer.fromJson<String?>(json['powers']),
      origin: serializer.fromJson<String?>(json['origin']),
      ownerCharacterId: serializer.fromJson<String?>(json['ownerCharacterId']),
      locationId: serializer.fromJson<String?>(json['locationId']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'description': serializer.toJson<String?>(description),
      'powers': serializer.toJson<String?>(powers),
      'origin': serializer.toJson<String?>(origin),
      'ownerCharacterId': serializer.toJson<String?>(ownerCharacterId),
      'locationId': serializer.toJson<String?>(locationId),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Item copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> type = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> powers = const Value.absent(),
    Value<String?> origin = const Value.absent(),
    Value<String?> ownerCharacterId = const Value.absent(),
    Value<String?> locationId = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Item(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    description: description.present ? description.value : this.description,
    powers: powers.present ? powers.value : this.powers,
    origin: origin.present ? origin.value : this.origin,
    ownerCharacterId: ownerCharacterId.present
        ? ownerCharacterId.value
        : this.ownerCharacterId,
    locationId: locationId.present ? locationId.value : this.locationId,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      powers: data.powers.present ? data.powers.value : this.powers,
      origin: data.origin.present ? data.origin.value : this.origin,
      ownerCharacterId: data.ownerCharacterId.present
          ? data.ownerCharacterId.value
          : this.ownerCharacterId,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('powers: $powers, ')
          ..write('origin: $origin, ')
          ..write('ownerCharacterId: $ownerCharacterId, ')
          ..write('locationId: $locationId, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    type,
    description,
    powers,
    origin,
    ownerCharacterId,
    locationId,
    imagePath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.powers == this.powers &&
          other.origin == this.origin &&
          other.ownerCharacterId == this.ownerCharacterId &&
          other.locationId == this.locationId &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> type;
  final Value<String?> description;
  final Value<String?> powers;
  final Value<String?> origin;
  final Value<String?> ownerCharacterId;
  final Value<String?> locationId;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.powers = const Value.absent(),
    this.origin = const Value.absent(),
    this.ownerCharacterId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.powers = const Value.absent(),
    this.origin = const Value.absent(),
    this.ownerCharacterId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<Item> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? powers,
    Expression<String>? origin,
    Expression<String>? ownerCharacterId,
    Expression<String>? locationId,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (powers != null) 'powers': powers,
      if (origin != null) 'origin': origin,
      if (ownerCharacterId != null) 'owner_character_id': ownerCharacterId,
      if (locationId != null) 'location_id': locationId,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? type,
    Value<String?>? description,
    Value<String?>? powers,
    Value<String?>? origin,
    Value<String?>? ownerCharacterId,
    Value<String?>? locationId,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      powers: powers ?? this.powers,
      origin: origin ?? this.origin,
      ownerCharacterId: ownerCharacterId ?? this.ownerCharacterId,
      locationId: locationId ?? this.locationId,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (powers.present) {
      map['powers'] = Variable<String>(powers.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (ownerCharacterId.present) {
      map['owner_character_id'] = Variable<String>(ownerCharacterId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('powers: $powers, ')
          ..write('origin: $origin, ')
          ..write('ownerCharacterId: $ownerCharacterId, ')
          ..write('locationId: $locationId, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MagicSystemsTable extends MagicSystems
    with TableInfo<$MagicSystemsTable, MagicSystem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MagicSystemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rulesMeta = const VerificationMeta('rules');
  @override
  late final GeneratedColumn<String> rules = GeneratedColumn<String>(
    'rules',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _limitationsMeta = const VerificationMeta(
    'limitations',
  );
  @override
  late final GeneratedColumn<String> limitations = GeneratedColumn<String>(
    'limitations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<String> cost = GeneratedColumn<String>(
    'cost',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    description,
    source,
    rules,
    limitations,
    cost,
    imagePath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'magic_systems';
  @override
  VerificationContext validateIntegrity(
    Insertable<MagicSystem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('rules')) {
      context.handle(
        _rulesMeta,
        rules.isAcceptableOrUnknown(data['rules']!, _rulesMeta),
      );
    }
    if (data.containsKey('limitations')) {
      context.handle(
        _limitationsMeta,
        limitations.isAcceptableOrUnknown(
          data['limitations']!,
          _limitationsMeta,
        ),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MagicSystem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MagicSystem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      rules: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rules'],
      ),
      limitations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}limitations'],
      ),
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cost'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MagicSystemsTable createAlias(String alias) {
    return $MagicSystemsTable(attachedDatabase, alias);
  }
}

class MagicSystem extends DataClass implements Insertable<MagicSystem> {
  final String id;
  final String projectId;
  final String name;
  final String? description;
  final String? source;
  final String? rules;
  final String? limitations;
  final String? cost;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MagicSystem({
    required this.id,
    required this.projectId,
    required this.name,
    this.description,
    this.source,
    this.rules,
    this.limitations,
    this.cost,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || rules != null) {
      map['rules'] = Variable<String>(rules);
    }
    if (!nullToAbsent || limitations != null) {
      map['limitations'] = Variable<String>(limitations);
    }
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<String>(cost);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MagicSystemsCompanion toCompanion(bool nullToAbsent) {
    return MagicSystemsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      rules: rules == null && nullToAbsent
          ? const Value.absent()
          : Value(rules),
      limitations: limitations == null && nullToAbsent
          ? const Value.absent()
          : Value(limitations),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MagicSystem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MagicSystem(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      source: serializer.fromJson<String?>(json['source']),
      rules: serializer.fromJson<String?>(json['rules']),
      limitations: serializer.fromJson<String?>(json['limitations']),
      cost: serializer.fromJson<String?>(json['cost']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'source': serializer.toJson<String?>(source),
      'rules': serializer.toJson<String?>(rules),
      'limitations': serializer.toJson<String?>(limitations),
      'cost': serializer.toJson<String?>(cost),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MagicSystem copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> source = const Value.absent(),
    Value<String?> rules = const Value.absent(),
    Value<String?> limitations = const Value.absent(),
    Value<String?> cost = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MagicSystem(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    source: source.present ? source.value : this.source,
    rules: rules.present ? rules.value : this.rules,
    limitations: limitations.present ? limitations.value : this.limitations,
    cost: cost.present ? cost.value : this.cost,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MagicSystem copyWithCompanion(MagicSystemsCompanion data) {
    return MagicSystem(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      source: data.source.present ? data.source.value : this.source,
      rules: data.rules.present ? data.rules.value : this.rules,
      limitations: data.limitations.present
          ? data.limitations.value
          : this.limitations,
      cost: data.cost.present ? data.cost.value : this.cost,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MagicSystem(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('source: $source, ')
          ..write('rules: $rules, ')
          ..write('limitations: $limitations, ')
          ..write('cost: $cost, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    description,
    source,
    rules,
    limitations,
    cost,
    imagePath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MagicSystem &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.description == this.description &&
          other.source == this.source &&
          other.rules == this.rules &&
          other.limitations == this.limitations &&
          other.cost == this.cost &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MagicSystemsCompanion extends UpdateCompanion<MagicSystem> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> source;
  final Value<String?> rules;
  final Value<String?> limitations;
  final Value<String?> cost;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MagicSystemsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.source = const Value.absent(),
    this.rules = const Value.absent(),
    this.limitations = const Value.absent(),
    this.cost = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MagicSystemsCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.description = const Value.absent(),
    this.source = const Value.absent(),
    this.rules = const Value.absent(),
    this.limitations = const Value.absent(),
    this.cost = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<MagicSystem> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? source,
    Expression<String>? rules,
    Expression<String>? limitations,
    Expression<String>? cost,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (source != null) 'source': source,
      if (rules != null) 'rules': rules,
      if (limitations != null) 'limitations': limitations,
      if (cost != null) 'cost': cost,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MagicSystemsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? source,
    Value<String?>? rules,
    Value<String?>? limitations,
    Value<String?>? cost,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MagicSystemsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      description: description ?? this.description,
      source: source ?? this.source,
      rules: rules ?? this.rules,
      limitations: limitations ?? this.limitations,
      cost: cost ?? this.cost,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rules.present) {
      map['rules'] = Variable<String>(rules.value);
    }
    if (limitations.present) {
      map['limitations'] = Variable<String>(limitations.value);
    }
    if (cost.present) {
      map['cost'] = Variable<String>(cost.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MagicSystemsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('source: $source, ')
          ..write('rules: $rules, ')
          ..write('limitations: $limitations, ')
          ..write('cost: $cost, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, projectId, name, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      ),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final String projectId;
  final String name;
  final int? color;
  const Tag({
    required this.id,
    required this.projectId,
    required this.name,
    this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
    );
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int?>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int?>(color),
    };
  }

  Tag copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<int?> color = const Value.absent(),
  }) => Tag(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
  );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.color == this.color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<int?> color;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<int>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<int?>? color,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagLinksTable extends TagLinks with TableInfo<$TagLinksTable, TagLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [tagId, entityType, entityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId, entityType, entityId};
  @override
  TagLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagLink(
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
    );
  }

  @override
  $TagLinksTable createAlias(String alias) {
    return $TagLinksTable(attachedDatabase, alias);
  }
}

class TagLink extends DataClass implements Insertable<TagLink> {
  final String tagId;
  final String entityType;
  final String entityId;
  const TagLink({
    required this.tagId,
    required this.entityType,
    required this.entityId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag_id'] = Variable<String>(tagId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    return map;
  }

  TagLinksCompanion toCompanion(bool nullToAbsent) {
    return TagLinksCompanion(
      tagId: Value(tagId),
      entityType: Value(entityType),
      entityId: Value(entityId),
    );
  }

  factory TagLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagLink(
      tagId: serializer.fromJson<String>(json['tagId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<String>(tagId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
    };
  }

  TagLink copyWith({String? tagId, String? entityType, String? entityId}) =>
      TagLink(
        tagId: tagId ?? this.tagId,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
      );
  TagLink copyWithCompanion(TagLinksCompanion data) {
    return TagLink(
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagLink(')
          ..write('tagId: $tagId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tagId, entityType, entityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagLink &&
          other.tagId == this.tagId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId);
}

class TagLinksCompanion extends UpdateCompanion<TagLink> {
  final Value<String> tagId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<int> rowid;
  const TagLinksCompanion({
    this.tagId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagLinksCompanion.insert({
    required String tagId,
    required String entityType,
    required String entityId,
    this.rowid = const Value.absent(),
  }) : tagId = Value(tagId),
       entityType = Value(entityType),
       entityId = Value(entityId);
  static Insertable<TagLink> custom({
    Expression<String>? tagId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagLinksCompanion copyWith({
    Value<String>? tagId,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<int>? rowid,
  }) {
    return TagLinksCompanion(
      tagId: tagId ?? this.tagId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagLinksCompanion(')
          ..write('tagId: $tagId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterSheetsTable extends CharacterSheets
    with TableInfo<$CharacterSheetsTable, CharacterSheet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterSheetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _classNameMeta = const VerificationMeta(
    'className',
  );
  @override
  late final GeneratedColumn<String> className = GeneratedColumn<String>(
    'class_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
    'strength',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dexterityMeta = const VerificationMeta(
    'dexterity',
  );
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
    'dexterity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _constitutionMeta = const VerificationMeta(
    'constitution',
  );
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
    'constitution',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intelligenceMeta = const VerificationMeta(
    'intelligence',
  );
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
    'intelligence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
    'wisdom',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _charismaMeta = const VerificationMeta(
    'charisma',
  );
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
    'charisma',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxHitPointsMeta = const VerificationMeta(
    'maxHitPoints',
  );
  @override
  late final GeneratedColumn<int> maxHitPoints = GeneratedColumn<int>(
    'max_hit_points',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentHitPointsMeta = const VerificationMeta(
    'currentHitPoints',
  );
  @override
  late final GeneratedColumn<int> currentHitPoints = GeneratedColumn<int>(
    'current_hit_points',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armorClassMeta = const VerificationMeta(
    'armorClass',
  );
  @override
  late final GeneratedColumn<int> armorClass = GeneratedColumn<int>(
    'armor_class',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<int> speed = GeneratedColumn<int>(
    'speed',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alignmentMeta = const VerificationMeta(
    'alignment',
  );
  @override
  late final GeneratedColumn<String> alignment = GeneratedColumn<String>(
    'alignment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backgroundMeta = const VerificationMeta(
    'background',
  );
  @override
  late final GeneratedColumn<String> background = GeneratedColumn<String>(
    'background',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _savingThrowProficienciesMeta =
      const VerificationMeta('savingThrowProficiencies');
  @override
  late final GeneratedColumn<String> savingThrowProficiencies =
      GeneratedColumn<String>(
        'saving_throw_proficiencies',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _skillProficienciesMeta =
      const VerificationMeta('skillProficiencies');
  @override
  late final GeneratedColumn<String> skillProficiencies =
      GeneratedColumn<String>(
        'skill_proficiencies',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _featuresMeta = const VerificationMeta(
    'features',
  );
  @override
  late final GeneratedColumn<String> features = GeneratedColumn<String>(
    'features',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    characterId,
    className,
    level,
    strength,
    dexterity,
    constitution,
    intelligence,
    wisdom,
    charisma,
    maxHitPoints,
    currentHitPoints,
    armorClass,
    speed,
    alignment,
    background,
    savingThrowProficiencies,
    skillProficiencies,
    features,
    equipment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_sheets';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterSheet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('class_name')) {
      context.handle(
        _classNameMeta,
        className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('dexterity')) {
      context.handle(
        _dexterityMeta,
        dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta),
      );
    }
    if (data.containsKey('constitution')) {
      context.handle(
        _constitutionMeta,
        constitution.isAcceptableOrUnknown(
          data['constitution']!,
          _constitutionMeta,
        ),
      );
    }
    if (data.containsKey('intelligence')) {
      context.handle(
        _intelligenceMeta,
        intelligence.isAcceptableOrUnknown(
          data['intelligence']!,
          _intelligenceMeta,
        ),
      );
    }
    if (data.containsKey('wisdom')) {
      context.handle(
        _wisdomMeta,
        wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta),
      );
    }
    if (data.containsKey('charisma')) {
      context.handle(
        _charismaMeta,
        charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta),
      );
    }
    if (data.containsKey('max_hit_points')) {
      context.handle(
        _maxHitPointsMeta,
        maxHitPoints.isAcceptableOrUnknown(
          data['max_hit_points']!,
          _maxHitPointsMeta,
        ),
      );
    }
    if (data.containsKey('current_hit_points')) {
      context.handle(
        _currentHitPointsMeta,
        currentHitPoints.isAcceptableOrUnknown(
          data['current_hit_points']!,
          _currentHitPointsMeta,
        ),
      );
    }
    if (data.containsKey('armor_class')) {
      context.handle(
        _armorClassMeta,
        armorClass.isAcceptableOrUnknown(data['armor_class']!, _armorClassMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('alignment')) {
      context.handle(
        _alignmentMeta,
        alignment.isAcceptableOrUnknown(data['alignment']!, _alignmentMeta),
      );
    }
    if (data.containsKey('background')) {
      context.handle(
        _backgroundMeta,
        background.isAcceptableOrUnknown(data['background']!, _backgroundMeta),
      );
    }
    if (data.containsKey('saving_throw_proficiencies')) {
      context.handle(
        _savingThrowProficienciesMeta,
        savingThrowProficiencies.isAcceptableOrUnknown(
          data['saving_throw_proficiencies']!,
          _savingThrowProficienciesMeta,
        ),
      );
    }
    if (data.containsKey('skill_proficiencies')) {
      context.handle(
        _skillProficienciesMeta,
        skillProficiencies.isAcceptableOrUnknown(
          data['skill_proficiencies']!,
          _skillProficienciesMeta,
        ),
      );
    }
    if (data.containsKey('features')) {
      context.handle(
        _featuresMeta,
        features.isAcceptableOrUnknown(data['features']!, _featuresMeta),
      );
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId};
  @override
  CharacterSheet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterSheet(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      className: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_name'],
      ),
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      ),
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strength'],
      ),
      dexterity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dexterity'],
      ),
      constitution: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}constitution'],
      ),
      intelligence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intelligence'],
      ),
      wisdom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wisdom'],
      ),
      charisma: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}charisma'],
      ),
      maxHitPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hit_points'],
      ),
      currentHitPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_hit_points'],
      ),
      armorClass: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}armor_class'],
      ),
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}speed'],
      ),
      alignment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alignment'],
      ),
      background: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}background'],
      ),
      savingThrowProficiencies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saving_throw_proficiencies'],
      ),
      skillProficiencies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skill_proficiencies'],
      ),
      features: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}features'],
      ),
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      ),
    );
  }

  @override
  $CharacterSheetsTable createAlias(String alias) {
    return $CharacterSheetsTable(attachedDatabase, alias);
  }
}

class CharacterSheet extends DataClass implements Insertable<CharacterSheet> {
  final String characterId;
  final String? className;
  final int? level;
  final int? strength;
  final int? dexterity;
  final int? constitution;
  final int? intelligence;
  final int? wisdom;
  final int? charisma;
  final int? maxHitPoints;
  final int? currentHitPoints;
  final int? armorClass;
  final int? speed;
  final String? alignment;
  final String? background;

  /// Comma-separated ability keys the character is proficient in for saves.
  final String? savingThrowProficiencies;
  final String? skillProficiencies;
  final String? features;
  final String? equipment;
  const CharacterSheet({
    required this.characterId,
    this.className,
    this.level,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.maxHitPoints,
    this.currentHitPoints,
    this.armorClass,
    this.speed,
    this.alignment,
    this.background,
    this.savingThrowProficiencies,
    this.skillProficiencies,
    this.features,
    this.equipment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    if (!nullToAbsent || className != null) {
      map['class_name'] = Variable<String>(className);
    }
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<int>(level);
    }
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<int>(strength);
    }
    if (!nullToAbsent || dexterity != null) {
      map['dexterity'] = Variable<int>(dexterity);
    }
    if (!nullToAbsent || constitution != null) {
      map['constitution'] = Variable<int>(constitution);
    }
    if (!nullToAbsent || intelligence != null) {
      map['intelligence'] = Variable<int>(intelligence);
    }
    if (!nullToAbsent || wisdom != null) {
      map['wisdom'] = Variable<int>(wisdom);
    }
    if (!nullToAbsent || charisma != null) {
      map['charisma'] = Variable<int>(charisma);
    }
    if (!nullToAbsent || maxHitPoints != null) {
      map['max_hit_points'] = Variable<int>(maxHitPoints);
    }
    if (!nullToAbsent || currentHitPoints != null) {
      map['current_hit_points'] = Variable<int>(currentHitPoints);
    }
    if (!nullToAbsent || armorClass != null) {
      map['armor_class'] = Variable<int>(armorClass);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<int>(speed);
    }
    if (!nullToAbsent || alignment != null) {
      map['alignment'] = Variable<String>(alignment);
    }
    if (!nullToAbsent || background != null) {
      map['background'] = Variable<String>(background);
    }
    if (!nullToAbsent || savingThrowProficiencies != null) {
      map['saving_throw_proficiencies'] = Variable<String>(
        savingThrowProficiencies,
      );
    }
    if (!nullToAbsent || skillProficiencies != null) {
      map['skill_proficiencies'] = Variable<String>(skillProficiencies);
    }
    if (!nullToAbsent || features != null) {
      map['features'] = Variable<String>(features);
    }
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String>(equipment);
    }
    return map;
  }

  CharacterSheetsCompanion toCompanion(bool nullToAbsent) {
    return CharacterSheetsCompanion(
      characterId: Value(characterId),
      className: className == null && nullToAbsent
          ? const Value.absent()
          : Value(className),
      level: level == null && nullToAbsent
          ? const Value.absent()
          : Value(level),
      strength: strength == null && nullToAbsent
          ? const Value.absent()
          : Value(strength),
      dexterity: dexterity == null && nullToAbsent
          ? const Value.absent()
          : Value(dexterity),
      constitution: constitution == null && nullToAbsent
          ? const Value.absent()
          : Value(constitution),
      intelligence: intelligence == null && nullToAbsent
          ? const Value.absent()
          : Value(intelligence),
      wisdom: wisdom == null && nullToAbsent
          ? const Value.absent()
          : Value(wisdom),
      charisma: charisma == null && nullToAbsent
          ? const Value.absent()
          : Value(charisma),
      maxHitPoints: maxHitPoints == null && nullToAbsent
          ? const Value.absent()
          : Value(maxHitPoints),
      currentHitPoints: currentHitPoints == null && nullToAbsent
          ? const Value.absent()
          : Value(currentHitPoints),
      armorClass: armorClass == null && nullToAbsent
          ? const Value.absent()
          : Value(armorClass),
      speed: speed == null && nullToAbsent
          ? const Value.absent()
          : Value(speed),
      alignment: alignment == null && nullToAbsent
          ? const Value.absent()
          : Value(alignment),
      background: background == null && nullToAbsent
          ? const Value.absent()
          : Value(background),
      savingThrowProficiencies: savingThrowProficiencies == null && nullToAbsent
          ? const Value.absent()
          : Value(savingThrowProficiencies),
      skillProficiencies: skillProficiencies == null && nullToAbsent
          ? const Value.absent()
          : Value(skillProficiencies),
      features: features == null && nullToAbsent
          ? const Value.absent()
          : Value(features),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
    );
  }

  factory CharacterSheet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterSheet(
      characterId: serializer.fromJson<String>(json['characterId']),
      className: serializer.fromJson<String?>(json['className']),
      level: serializer.fromJson<int?>(json['level']),
      strength: serializer.fromJson<int?>(json['strength']),
      dexterity: serializer.fromJson<int?>(json['dexterity']),
      constitution: serializer.fromJson<int?>(json['constitution']),
      intelligence: serializer.fromJson<int?>(json['intelligence']),
      wisdom: serializer.fromJson<int?>(json['wisdom']),
      charisma: serializer.fromJson<int?>(json['charisma']),
      maxHitPoints: serializer.fromJson<int?>(json['maxHitPoints']),
      currentHitPoints: serializer.fromJson<int?>(json['currentHitPoints']),
      armorClass: serializer.fromJson<int?>(json['armorClass']),
      speed: serializer.fromJson<int?>(json['speed']),
      alignment: serializer.fromJson<String?>(json['alignment']),
      background: serializer.fromJson<String?>(json['background']),
      savingThrowProficiencies: serializer.fromJson<String?>(
        json['savingThrowProficiencies'],
      ),
      skillProficiencies: serializer.fromJson<String?>(
        json['skillProficiencies'],
      ),
      features: serializer.fromJson<String?>(json['features']),
      equipment: serializer.fromJson<String?>(json['equipment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'className': serializer.toJson<String?>(className),
      'level': serializer.toJson<int?>(level),
      'strength': serializer.toJson<int?>(strength),
      'dexterity': serializer.toJson<int?>(dexterity),
      'constitution': serializer.toJson<int?>(constitution),
      'intelligence': serializer.toJson<int?>(intelligence),
      'wisdom': serializer.toJson<int?>(wisdom),
      'charisma': serializer.toJson<int?>(charisma),
      'maxHitPoints': serializer.toJson<int?>(maxHitPoints),
      'currentHitPoints': serializer.toJson<int?>(currentHitPoints),
      'armorClass': serializer.toJson<int?>(armorClass),
      'speed': serializer.toJson<int?>(speed),
      'alignment': serializer.toJson<String?>(alignment),
      'background': serializer.toJson<String?>(background),
      'savingThrowProficiencies': serializer.toJson<String?>(
        savingThrowProficiencies,
      ),
      'skillProficiencies': serializer.toJson<String?>(skillProficiencies),
      'features': serializer.toJson<String?>(features),
      'equipment': serializer.toJson<String?>(equipment),
    };
  }

  CharacterSheet copyWith({
    String? characterId,
    Value<String?> className = const Value.absent(),
    Value<int?> level = const Value.absent(),
    Value<int?> strength = const Value.absent(),
    Value<int?> dexterity = const Value.absent(),
    Value<int?> constitution = const Value.absent(),
    Value<int?> intelligence = const Value.absent(),
    Value<int?> wisdom = const Value.absent(),
    Value<int?> charisma = const Value.absent(),
    Value<int?> maxHitPoints = const Value.absent(),
    Value<int?> currentHitPoints = const Value.absent(),
    Value<int?> armorClass = const Value.absent(),
    Value<int?> speed = const Value.absent(),
    Value<String?> alignment = const Value.absent(),
    Value<String?> background = const Value.absent(),
    Value<String?> savingThrowProficiencies = const Value.absent(),
    Value<String?> skillProficiencies = const Value.absent(),
    Value<String?> features = const Value.absent(),
    Value<String?> equipment = const Value.absent(),
  }) => CharacterSheet(
    characterId: characterId ?? this.characterId,
    className: className.present ? className.value : this.className,
    level: level.present ? level.value : this.level,
    strength: strength.present ? strength.value : this.strength,
    dexterity: dexterity.present ? dexterity.value : this.dexterity,
    constitution: constitution.present ? constitution.value : this.constitution,
    intelligence: intelligence.present ? intelligence.value : this.intelligence,
    wisdom: wisdom.present ? wisdom.value : this.wisdom,
    charisma: charisma.present ? charisma.value : this.charisma,
    maxHitPoints: maxHitPoints.present ? maxHitPoints.value : this.maxHitPoints,
    currentHitPoints: currentHitPoints.present
        ? currentHitPoints.value
        : this.currentHitPoints,
    armorClass: armorClass.present ? armorClass.value : this.armorClass,
    speed: speed.present ? speed.value : this.speed,
    alignment: alignment.present ? alignment.value : this.alignment,
    background: background.present ? background.value : this.background,
    savingThrowProficiencies: savingThrowProficiencies.present
        ? savingThrowProficiencies.value
        : this.savingThrowProficiencies,
    skillProficiencies: skillProficiencies.present
        ? skillProficiencies.value
        : this.skillProficiencies,
    features: features.present ? features.value : this.features,
    equipment: equipment.present ? equipment.value : this.equipment,
  );
  CharacterSheet copyWithCompanion(CharacterSheetsCompanion data) {
    return CharacterSheet(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      className: data.className.present ? data.className.value : this.className,
      level: data.level.present ? data.level.value : this.level,
      strength: data.strength.present ? data.strength.value : this.strength,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      maxHitPoints: data.maxHitPoints.present
          ? data.maxHitPoints.value
          : this.maxHitPoints,
      currentHitPoints: data.currentHitPoints.present
          ? data.currentHitPoints.value
          : this.currentHitPoints,
      armorClass: data.armorClass.present
          ? data.armorClass.value
          : this.armorClass,
      speed: data.speed.present ? data.speed.value : this.speed,
      alignment: data.alignment.present ? data.alignment.value : this.alignment,
      background: data.background.present
          ? data.background.value
          : this.background,
      savingThrowProficiencies: data.savingThrowProficiencies.present
          ? data.savingThrowProficiencies.value
          : this.savingThrowProficiencies,
      skillProficiencies: data.skillProficiencies.present
          ? data.skillProficiencies.value
          : this.skillProficiencies,
      features: data.features.present ? data.features.value : this.features,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterSheet(')
          ..write('characterId: $characterId, ')
          ..write('className: $className, ')
          ..write('level: $level, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('maxHitPoints: $maxHitPoints, ')
          ..write('currentHitPoints: $currentHitPoints, ')
          ..write('armorClass: $armorClass, ')
          ..write('speed: $speed, ')
          ..write('alignment: $alignment, ')
          ..write('background: $background, ')
          ..write('savingThrowProficiencies: $savingThrowProficiencies, ')
          ..write('skillProficiencies: $skillProficiencies, ')
          ..write('features: $features, ')
          ..write('equipment: $equipment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    characterId,
    className,
    level,
    strength,
    dexterity,
    constitution,
    intelligence,
    wisdom,
    charisma,
    maxHitPoints,
    currentHitPoints,
    armorClass,
    speed,
    alignment,
    background,
    savingThrowProficiencies,
    skillProficiencies,
    features,
    equipment,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterSheet &&
          other.characterId == this.characterId &&
          other.className == this.className &&
          other.level == this.level &&
          other.strength == this.strength &&
          other.dexterity == this.dexterity &&
          other.constitution == this.constitution &&
          other.intelligence == this.intelligence &&
          other.wisdom == this.wisdom &&
          other.charisma == this.charisma &&
          other.maxHitPoints == this.maxHitPoints &&
          other.currentHitPoints == this.currentHitPoints &&
          other.armorClass == this.armorClass &&
          other.speed == this.speed &&
          other.alignment == this.alignment &&
          other.background == this.background &&
          other.savingThrowProficiencies == this.savingThrowProficiencies &&
          other.skillProficiencies == this.skillProficiencies &&
          other.features == this.features &&
          other.equipment == this.equipment);
}

class CharacterSheetsCompanion extends UpdateCompanion<CharacterSheet> {
  final Value<String> characterId;
  final Value<String?> className;
  final Value<int?> level;
  final Value<int?> strength;
  final Value<int?> dexterity;
  final Value<int?> constitution;
  final Value<int?> intelligence;
  final Value<int?> wisdom;
  final Value<int?> charisma;
  final Value<int?> maxHitPoints;
  final Value<int?> currentHitPoints;
  final Value<int?> armorClass;
  final Value<int?> speed;
  final Value<String?> alignment;
  final Value<String?> background;
  final Value<String?> savingThrowProficiencies;
  final Value<String?> skillProficiencies;
  final Value<String?> features;
  final Value<String?> equipment;
  final Value<int> rowid;
  const CharacterSheetsCompanion({
    this.characterId = const Value.absent(),
    this.className = const Value.absent(),
    this.level = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.maxHitPoints = const Value.absent(),
    this.currentHitPoints = const Value.absent(),
    this.armorClass = const Value.absent(),
    this.speed = const Value.absent(),
    this.alignment = const Value.absent(),
    this.background = const Value.absent(),
    this.savingThrowProficiencies = const Value.absent(),
    this.skillProficiencies = const Value.absent(),
    this.features = const Value.absent(),
    this.equipment = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterSheetsCompanion.insert({
    required String characterId,
    this.className = const Value.absent(),
    this.level = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.maxHitPoints = const Value.absent(),
    this.currentHitPoints = const Value.absent(),
    this.armorClass = const Value.absent(),
    this.speed = const Value.absent(),
    this.alignment = const Value.absent(),
    this.background = const Value.absent(),
    this.savingThrowProficiencies = const Value.absent(),
    this.skillProficiencies = const Value.absent(),
    this.features = const Value.absent(),
    this.equipment = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId);
  static Insertable<CharacterSheet> custom({
    Expression<String>? characterId,
    Expression<String>? className,
    Expression<int>? level,
    Expression<int>? strength,
    Expression<int>? dexterity,
    Expression<int>? constitution,
    Expression<int>? intelligence,
    Expression<int>? wisdom,
    Expression<int>? charisma,
    Expression<int>? maxHitPoints,
    Expression<int>? currentHitPoints,
    Expression<int>? armorClass,
    Expression<int>? speed,
    Expression<String>? alignment,
    Expression<String>? background,
    Expression<String>? savingThrowProficiencies,
    Expression<String>? skillProficiencies,
    Expression<String>? features,
    Expression<String>? equipment,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (className != null) 'class_name': className,
      if (level != null) 'level': level,
      if (strength != null) 'strength': strength,
      if (dexterity != null) 'dexterity': dexterity,
      if (constitution != null) 'constitution': constitution,
      if (intelligence != null) 'intelligence': intelligence,
      if (wisdom != null) 'wisdom': wisdom,
      if (charisma != null) 'charisma': charisma,
      if (maxHitPoints != null) 'max_hit_points': maxHitPoints,
      if (currentHitPoints != null) 'current_hit_points': currentHitPoints,
      if (armorClass != null) 'armor_class': armorClass,
      if (speed != null) 'speed': speed,
      if (alignment != null) 'alignment': alignment,
      if (background != null) 'background': background,
      if (savingThrowProficiencies != null)
        'saving_throw_proficiencies': savingThrowProficiencies,
      if (skillProficiencies != null) 'skill_proficiencies': skillProficiencies,
      if (features != null) 'features': features,
      if (equipment != null) 'equipment': equipment,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterSheetsCompanion copyWith({
    Value<String>? characterId,
    Value<String?>? className,
    Value<int?>? level,
    Value<int?>? strength,
    Value<int?>? dexterity,
    Value<int?>? constitution,
    Value<int?>? intelligence,
    Value<int?>? wisdom,
    Value<int?>? charisma,
    Value<int?>? maxHitPoints,
    Value<int?>? currentHitPoints,
    Value<int?>? armorClass,
    Value<int?>? speed,
    Value<String?>? alignment,
    Value<String?>? background,
    Value<String?>? savingThrowProficiencies,
    Value<String?>? skillProficiencies,
    Value<String?>? features,
    Value<String?>? equipment,
    Value<int>? rowid,
  }) {
    return CharacterSheetsCompanion(
      characterId: characterId ?? this.characterId,
      className: className ?? this.className,
      level: level ?? this.level,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      maxHitPoints: maxHitPoints ?? this.maxHitPoints,
      currentHitPoints: currentHitPoints ?? this.currentHitPoints,
      armorClass: armorClass ?? this.armorClass,
      speed: speed ?? this.speed,
      alignment: alignment ?? this.alignment,
      background: background ?? this.background,
      savingThrowProficiencies:
          savingThrowProficiencies ?? this.savingThrowProficiencies,
      skillProficiencies: skillProficiencies ?? this.skillProficiencies,
      features: features ?? this.features,
      equipment: equipment ?? this.equipment,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (maxHitPoints.present) {
      map['max_hit_points'] = Variable<int>(maxHitPoints.value);
    }
    if (currentHitPoints.present) {
      map['current_hit_points'] = Variable<int>(currentHitPoints.value);
    }
    if (armorClass.present) {
      map['armor_class'] = Variable<int>(armorClass.value);
    }
    if (speed.present) {
      map['speed'] = Variable<int>(speed.value);
    }
    if (alignment.present) {
      map['alignment'] = Variable<String>(alignment.value);
    }
    if (background.present) {
      map['background'] = Variable<String>(background.value);
    }
    if (savingThrowProficiencies.present) {
      map['saving_throw_proficiencies'] = Variable<String>(
        savingThrowProficiencies.value,
      );
    }
    if (skillProficiencies.present) {
      map['skill_proficiencies'] = Variable<String>(skillProficiencies.value);
    }
    if (features.present) {
      map['features'] = Variable<String>(features.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterSheetsCompanion(')
          ..write('characterId: $characterId, ')
          ..write('className: $className, ')
          ..write('level: $level, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('maxHitPoints: $maxHitPoints, ')
          ..write('currentHitPoints: $currentHitPoints, ')
          ..write('armorClass: $armorClass, ')
          ..write('speed: $speed, ')
          ..write('alignment: $alignment, ')
          ..write('background: $background, ')
          ..write('savingThrowProficiencies: $savingThrowProficiencies, ')
          ..write('skillProficiencies: $skillProficiencies, ')
          ..write('features: $features, ')
          ..write('equipment: $equipment, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FamilyLinksTable extends FamilyLinks
    with TableInfo<$FamilyLinksTable, FamilyLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [parentId, childId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<FamilyLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {parentId, childId};
  @override
  FamilyLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyLink(
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
    );
  }

  @override
  $FamilyLinksTable createAlias(String alias) {
    return $FamilyLinksTable(attachedDatabase, alias);
  }
}

class FamilyLink extends DataClass implements Insertable<FamilyLink> {
  final String parentId;
  final String childId;
  const FamilyLink({required this.parentId, required this.childId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parent_id'] = Variable<String>(parentId);
    map['child_id'] = Variable<String>(childId);
    return map;
  }

  FamilyLinksCompanion toCompanion(bool nullToAbsent) {
    return FamilyLinksCompanion(
      parentId: Value(parentId),
      childId: Value(childId),
    );
  }

  factory FamilyLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyLink(
      parentId: serializer.fromJson<String>(json['parentId']),
      childId: serializer.fromJson<String>(json['childId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentId': serializer.toJson<String>(parentId),
      'childId': serializer.toJson<String>(childId),
    };
  }

  FamilyLink copyWith({String? parentId, String? childId}) => FamilyLink(
    parentId: parentId ?? this.parentId,
    childId: childId ?? this.childId,
  );
  FamilyLink copyWithCompanion(FamilyLinksCompanion data) {
    return FamilyLink(
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      childId: data.childId.present ? data.childId.value : this.childId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyLink(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(parentId, childId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyLink &&
          other.parentId == this.parentId &&
          other.childId == this.childId);
}

class FamilyLinksCompanion extends UpdateCompanion<FamilyLink> {
  final Value<String> parentId;
  final Value<String> childId;
  final Value<int> rowid;
  const FamilyLinksCompanion({
    this.parentId = const Value.absent(),
    this.childId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FamilyLinksCompanion.insert({
    required String parentId,
    required String childId,
    this.rowid = const Value.absent(),
  }) : parentId = Value(parentId),
       childId = Value(childId);
  static Insertable<FamilyLink> custom({
    Expression<String>? parentId,
    Expression<String>? childId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentId != null) 'parent_id': parentId,
      if (childId != null) 'child_id': childId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FamilyLinksCompanion copyWith({
    Value<String>? parentId,
    Value<String>? childId,
    Value<int>? rowid,
  }) {
    return FamilyLinksCompanion(
      parentId: parentId ?? this.parentId,
      childId: childId ?? this.childId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyLinksCompanion(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SecretsTable extends Secrets with TableInfo<$SecretsTable, Secret> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SecretsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerCharacterIdMeta = const VerificationMeta(
    'ownerCharacterId',
  );
  @override
  late final GeneratedColumn<String> ownerCharacterId = GeneratedColumn<String>(
    'owner_character_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    title,
    description,
    ownerCharacterId,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'secrets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Secret> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('owner_character_id')) {
      context.handle(
        _ownerCharacterIdMeta,
        ownerCharacterId.isAcceptableOrUnknown(
          data['owner_character_id']!,
          _ownerCharacterIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Secret map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Secret(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      ownerCharacterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_character_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SecretsTable createAlias(String alias) {
    return $SecretsTable(attachedDatabase, alias);
  }
}

class Secret extends DataClass implements Insertable<Secret> {
  final String id;
  final String projectId;
  final String title;
  final String? description;

  /// Whose secret it is (the subject), if any.
  final String? ownerCharacterId;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Secret({
    required this.id,
    required this.projectId,
    required this.title,
    this.description,
    this.ownerCharacterId,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || ownerCharacterId != null) {
      map['owner_character_id'] = Variable<String>(ownerCharacterId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SecretsCompanion toCompanion(bool nullToAbsent) {
    return SecretsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ownerCharacterId: ownerCharacterId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerCharacterId),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Secret.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Secret(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      ownerCharacterId: serializer.fromJson<String?>(json['ownerCharacterId']),
      status: serializer.fromJson<String?>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'ownerCharacterId': serializer.toJson<String?>(ownerCharacterId),
      'status': serializer.toJson<String?>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Secret copyWith({
    String? id,
    String? projectId,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> ownerCharacterId = const Value.absent(),
    Value<String?> status = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Secret(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    ownerCharacterId: ownerCharacterId.present
        ? ownerCharacterId.value
        : this.ownerCharacterId,
    status: status.present ? status.value : this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Secret copyWithCompanion(SecretsCompanion data) {
    return Secret(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      ownerCharacterId: data.ownerCharacterId.present
          ? data.ownerCharacterId.value
          : this.ownerCharacterId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Secret(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ownerCharacterId: $ownerCharacterId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    title,
    description,
    ownerCharacterId,
    status,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Secret &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.title == this.title &&
          other.description == this.description &&
          other.ownerCharacterId == this.ownerCharacterId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SecretsCompanion extends UpdateCompanion<Secret> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> ownerCharacterId;
  final Value<String?> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SecretsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.ownerCharacterId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SecretsCompanion.insert({
    required String id,
    required String projectId,
    required String title,
    this.description = const Value.absent(),
    this.ownerCharacterId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       title = Value(title);
  static Insertable<Secret> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? ownerCharacterId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (ownerCharacterId != null) 'owner_character_id': ownerCharacterId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SecretsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? ownerCharacterId,
    Value<String?>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SecretsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      description: description ?? this.description,
      ownerCharacterId: ownerCharacterId ?? this.ownerCharacterId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ownerCharacterId.present) {
      map['owner_character_id'] = Variable<String>(ownerCharacterId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecretsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ownerCharacterId: $ownerCharacterId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SecretKnowersTable extends SecretKnowers
    with TableInfo<$SecretKnowersTable, SecretKnower> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SecretKnowersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _secretIdMeta = const VerificationMeta(
    'secretId',
  );
  @override
  late final GeneratedColumn<String> secretId = GeneratedColumn<String>(
    'secret_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES secrets (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _howTheyKnowMeta = const VerificationMeta(
    'howTheyKnow',
  );
  @override
  late final GeneratedColumn<String> howTheyKnow = GeneratedColumn<String>(
    'how_they_know',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _knownSinceMeta = const VerificationMeta(
    'knownSince',
  );
  @override
  late final GeneratedColumn<String> knownSince = GeneratedColumn<String>(
    'known_since',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    secretId,
    characterId,
    howTheyKnow,
    knownSince,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'secret_knowers';
  @override
  VerificationContext validateIntegrity(
    Insertable<SecretKnower> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('secret_id')) {
      context.handle(
        _secretIdMeta,
        secretId.isAcceptableOrUnknown(data['secret_id']!, _secretIdMeta),
      );
    } else if (isInserting) {
      context.missing(_secretIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('how_they_know')) {
      context.handle(
        _howTheyKnowMeta,
        howTheyKnow.isAcceptableOrUnknown(
          data['how_they_know']!,
          _howTheyKnowMeta,
        ),
      );
    }
    if (data.containsKey('known_since')) {
      context.handle(
        _knownSinceMeta,
        knownSince.isAcceptableOrUnknown(data['known_since']!, _knownSinceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {secretId, characterId};
  @override
  SecretKnower map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SecretKnower(
      secretId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secret_id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      howTheyKnow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}how_they_know'],
      ),
      knownSince: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}known_since'],
      ),
    );
  }

  @override
  $SecretKnowersTable createAlias(String alias) {
    return $SecretKnowersTable(attachedDatabase, alias);
  }
}

class SecretKnower extends DataClass implements Insertable<SecretKnower> {
  final String secretId;
  final String characterId;

  /// How they found out, and when in story time.
  final String? howTheyKnow;
  final String? knownSince;
  const SecretKnower({
    required this.secretId,
    required this.characterId,
    this.howTheyKnow,
    this.knownSince,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['secret_id'] = Variable<String>(secretId);
    map['character_id'] = Variable<String>(characterId);
    if (!nullToAbsent || howTheyKnow != null) {
      map['how_they_know'] = Variable<String>(howTheyKnow);
    }
    if (!nullToAbsent || knownSince != null) {
      map['known_since'] = Variable<String>(knownSince);
    }
    return map;
  }

  SecretKnowersCompanion toCompanion(bool nullToAbsent) {
    return SecretKnowersCompanion(
      secretId: Value(secretId),
      characterId: Value(characterId),
      howTheyKnow: howTheyKnow == null && nullToAbsent
          ? const Value.absent()
          : Value(howTheyKnow),
      knownSince: knownSince == null && nullToAbsent
          ? const Value.absent()
          : Value(knownSince),
    );
  }

  factory SecretKnower.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SecretKnower(
      secretId: serializer.fromJson<String>(json['secretId']),
      characterId: serializer.fromJson<String>(json['characterId']),
      howTheyKnow: serializer.fromJson<String?>(json['howTheyKnow']),
      knownSince: serializer.fromJson<String?>(json['knownSince']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'secretId': serializer.toJson<String>(secretId),
      'characterId': serializer.toJson<String>(characterId),
      'howTheyKnow': serializer.toJson<String?>(howTheyKnow),
      'knownSince': serializer.toJson<String?>(knownSince),
    };
  }

  SecretKnower copyWith({
    String? secretId,
    String? characterId,
    Value<String?> howTheyKnow = const Value.absent(),
    Value<String?> knownSince = const Value.absent(),
  }) => SecretKnower(
    secretId: secretId ?? this.secretId,
    characterId: characterId ?? this.characterId,
    howTheyKnow: howTheyKnow.present ? howTheyKnow.value : this.howTheyKnow,
    knownSince: knownSince.present ? knownSince.value : this.knownSince,
  );
  SecretKnower copyWithCompanion(SecretKnowersCompanion data) {
    return SecretKnower(
      secretId: data.secretId.present ? data.secretId.value : this.secretId,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      howTheyKnow: data.howTheyKnow.present
          ? data.howTheyKnow.value
          : this.howTheyKnow,
      knownSince: data.knownSince.present
          ? data.knownSince.value
          : this.knownSince,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SecretKnower(')
          ..write('secretId: $secretId, ')
          ..write('characterId: $characterId, ')
          ..write('howTheyKnow: $howTheyKnow, ')
          ..write('knownSince: $knownSince')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(secretId, characterId, howTheyKnow, knownSince);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecretKnower &&
          other.secretId == this.secretId &&
          other.characterId == this.characterId &&
          other.howTheyKnow == this.howTheyKnow &&
          other.knownSince == this.knownSince);
}

class SecretKnowersCompanion extends UpdateCompanion<SecretKnower> {
  final Value<String> secretId;
  final Value<String> characterId;
  final Value<String?> howTheyKnow;
  final Value<String?> knownSince;
  final Value<int> rowid;
  const SecretKnowersCompanion({
    this.secretId = const Value.absent(),
    this.characterId = const Value.absent(),
    this.howTheyKnow = const Value.absent(),
    this.knownSince = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SecretKnowersCompanion.insert({
    required String secretId,
    required String characterId,
    this.howTheyKnow = const Value.absent(),
    this.knownSince = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : secretId = Value(secretId),
       characterId = Value(characterId);
  static Insertable<SecretKnower> custom({
    Expression<String>? secretId,
    Expression<String>? characterId,
    Expression<String>? howTheyKnow,
    Expression<String>? knownSince,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (secretId != null) 'secret_id': secretId,
      if (characterId != null) 'character_id': characterId,
      if (howTheyKnow != null) 'how_they_know': howTheyKnow,
      if (knownSince != null) 'known_since': knownSince,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SecretKnowersCompanion copyWith({
    Value<String>? secretId,
    Value<String>? characterId,
    Value<String?>? howTheyKnow,
    Value<String?>? knownSince,
    Value<int>? rowid,
  }) {
    return SecretKnowersCompanion(
      secretId: secretId ?? this.secretId,
      characterId: characterId ?? this.characterId,
      howTheyKnow: howTheyKnow ?? this.howTheyKnow,
      knownSince: knownSince ?? this.knownSince,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (secretId.present) {
      map['secret_id'] = Variable<String>(secretId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (howTheyKnow.present) {
      map['how_they_know'] = Variable<String>(howTheyKnow.value);
    }
    if (knownSince.present) {
      map['known_since'] = Variable<String>(knownSince.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecretKnowersCompanion(')
          ..write('secretId: $secretId, ')
          ..write('characterId: $characterId, ')
          ..write('howTheyKnow: $howTheyKnow, ')
          ..write('knownSince: $knownSince, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomFieldsTable extends CustomFields
    with TableInfo<$CustomFieldsTable, CustomField> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortIndexMeta = const VerificationMeta(
    'sortIndex',
  );
  @override
  late final GeneratedColumn<int> sortIndex = GeneratedColumn<int>(
    'sort_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    entityType,
    entityId,
    label,
    value,
    sortIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_fields';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomField> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('sort_index')) {
      context.handle(
        _sortIndexMeta,
        sortIndex.isAcceptableOrUnknown(data['sort_index']!, _sortIndexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomField map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomField(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
      sortIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_index'],
      )!,
    );
  }

  @override
  $CustomFieldsTable createAlias(String alias) {
    return $CustomFieldsTable(attachedDatabase, alias);
  }
}

class CustomField extends DataClass implements Insertable<CustomField> {
  final String id;
  final String projectId;
  final String entityType;
  final String entityId;
  final String label;
  final String? value;
  final int sortIndex;
  const CustomField({
    required this.id,
    required this.projectId,
    required this.entityType,
    required this.entityId,
    required this.label,
    this.value,
    required this.sortIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    map['sort_index'] = Variable<int>(sortIndex);
    return map;
  }

  CustomFieldsCompanion toCompanion(bool nullToAbsent) {
    return CustomFieldsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      label: Value(label),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      sortIndex: Value(sortIndex),
    );
  }

  factory CustomField.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomField(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<String?>(json['value']),
      sortIndex: serializer.fromJson<int>(json['sortIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<String?>(value),
      'sortIndex': serializer.toJson<int>(sortIndex),
    };
  }

  CustomField copyWith({
    String? id,
    String? projectId,
    String? entityType,
    String? entityId,
    String? label,
    Value<String?> value = const Value.absent(),
    int? sortIndex,
  }) => CustomField(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    label: label ?? this.label,
    value: value.present ? value.value : this.value,
    sortIndex: sortIndex ?? this.sortIndex,
  );
  CustomField copyWithCompanion(CustomFieldsCompanion data) {
    return CustomField(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
      sortIndex: data.sortIndex.present ? data.sortIndex.value : this.sortIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomField(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('sortIndex: $sortIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, entityType, entityId, label, value, sortIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomField &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.label == this.label &&
          other.value == this.value &&
          other.sortIndex == this.sortIndex);
}

class CustomFieldsCompanion extends UpdateCompanion<CustomField> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> label;
  final Value<String?> value;
  final Value<int> sortIndex;
  final Value<int> rowid;
  const CustomFieldsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomFieldsCompanion.insert({
    required String id,
    required String projectId,
    required String entityType,
    required String entityId,
    required String label,
    this.value = const Value.absent(),
    this.sortIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       entityType = Value(entityType),
       entityId = Value(entityId),
       label = Value(label);
  static Insertable<CustomField> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? label,
    Expression<String>? value,
    Expression<int>? sortIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      if (sortIndex != null) 'sort_index': sortIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomFieldsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? label,
    Value<String?>? value,
    Value<int>? sortIndex,
    Value<int>? rowid,
  }) {
    return CustomFieldsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      label: label ?? this.label,
      value: value ?? this.value,
      sortIndex: sortIndex ?? this.sortIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (sortIndex.present) {
      map['sort_index'] = Variable<int>(sortIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFieldsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('sortIndex: $sortIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiceRollsTable extends DiceRolls
    with TableInfo<$DiceRollsTable, DiceRoll> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiceRollsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _expressionMeta = const VerificationMeta(
    'expression',
  );
  @override
  late final GeneratedColumn<String> expression = GeneratedColumn<String>(
    'expression',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    expression,
    total,
    detail,
    label,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dice_rolls';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiceRoll> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('expression')) {
      context.handle(
        _expressionMeta,
        expression.isAcceptableOrUnknown(data['expression']!, _expressionMeta),
      );
    } else if (isInserting) {
      context.missing(_expressionMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiceRoll map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiceRoll(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      expression: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expression'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      detail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detail'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DiceRollsTable createAlias(String alias) {
    return $DiceRollsTable(attachedDatabase, alias);
  }
}

class DiceRoll extends DataClass implements Insertable<DiceRoll> {
  final String id;
  final String projectId;
  final String expression;
  final int total;

  /// Human-readable breakdown, e.g. "2d6 (4, 5) + 3".
  final String detail;
  final String? label;
  final DateTime createdAt;
  const DiceRoll({
    required this.id,
    required this.projectId,
    required this.expression,
    required this.total,
    required this.detail,
    this.label,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['expression'] = Variable<String>(expression);
    map['total'] = Variable<int>(total);
    map['detail'] = Variable<String>(detail);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiceRollsCompanion toCompanion(bool nullToAbsent) {
    return DiceRollsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      expression: Value(expression),
      total: Value(total),
      detail: Value(detail),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
      createdAt: Value(createdAt),
    );
  }

  factory DiceRoll.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiceRoll(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      expression: serializer.fromJson<String>(json['expression']),
      total: serializer.fromJson<int>(json['total']),
      detail: serializer.fromJson<String>(json['detail']),
      label: serializer.fromJson<String?>(json['label']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'expression': serializer.toJson<String>(expression),
      'total': serializer.toJson<int>(total),
      'detail': serializer.toJson<String>(detail),
      'label': serializer.toJson<String?>(label),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DiceRoll copyWith({
    String? id,
    String? projectId,
    String? expression,
    int? total,
    String? detail,
    Value<String?> label = const Value.absent(),
    DateTime? createdAt,
  }) => DiceRoll(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    expression: expression ?? this.expression,
    total: total ?? this.total,
    detail: detail ?? this.detail,
    label: label.present ? label.value : this.label,
    createdAt: createdAt ?? this.createdAt,
  );
  DiceRoll copyWithCompanion(DiceRollsCompanion data) {
    return DiceRoll(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      expression: data.expression.present
          ? data.expression.value
          : this.expression,
      total: data.total.present ? data.total.value : this.total,
      detail: data.detail.present ? data.detail.value : this.detail,
      label: data.label.present ? data.label.value : this.label,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiceRoll(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('expression: $expression, ')
          ..write('total: $total, ')
          ..write('detail: $detail, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, expression, total, detail, label, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiceRoll &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.expression == this.expression &&
          other.total == this.total &&
          other.detail == this.detail &&
          other.label == this.label &&
          other.createdAt == this.createdAt);
}

class DiceRollsCompanion extends UpdateCompanion<DiceRoll> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> expression;
  final Value<int> total;
  final Value<String> detail;
  final Value<String?> label;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DiceRollsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.expression = const Value.absent(),
    this.total = const Value.absent(),
    this.detail = const Value.absent(),
    this.label = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiceRollsCompanion.insert({
    required String id,
    required String projectId,
    required String expression,
    required int total,
    required String detail,
    this.label = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       expression = Value(expression),
       total = Value(total),
       detail = Value(detail);
  static Insertable<DiceRoll> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? expression,
    Expression<int>? total,
    Expression<String>? detail,
    Expression<String>? label,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (expression != null) 'expression': expression,
      if (total != null) 'total': total,
      if (detail != null) 'detail': detail,
      if (label != null) 'label': label,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiceRollsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? expression,
    Value<int>? total,
    Value<String>? detail,
    Value<String?>? label,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DiceRollsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      expression: expression ?? this.expression,
      total: total ?? this.total,
      detail: detail ?? this.detail,
      label: label ?? this.label,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (expression.present) {
      map['expression'] = Variable<String>(expression.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiceRollsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('expression: $expression, ')
          ..write('total: $total, ')
          ..write('detail: $detail, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MapPinsTable extends MapPins with TableInfo<$MapPinsTable, MapPin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapPinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _mapLocationIdMeta = const VerificationMeta(
    'mapLocationId',
  );
  @override
  late final GeneratedColumn<String> mapLocationId = GeneratedColumn<String>(
    'map_location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _targetTypeMeta = const VerificationMeta(
    'targetType',
  );
  @override
  late final GeneratedColumn<String> targetType = GeneratedColumn<String>(
    'target_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<String> targetId = GeneratedColumn<String>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
    'x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
    'y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    mapLocationId,
    targetType,
    targetId,
    x,
    y,
    label,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_pins';
  @override
  VerificationContext validateIntegrity(
    Insertable<MapPin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('map_location_id')) {
      context.handle(
        _mapLocationIdMeta,
        mapLocationId.isAcceptableOrUnknown(
          data['map_location_id']!,
          _mapLocationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mapLocationIdMeta);
    }
    if (data.containsKey('target_type')) {
      context.handle(
        _targetTypeMeta,
        targetType.isAcceptableOrUnknown(data['target_type']!, _targetTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTypeMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MapPin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapPin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      mapLocationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}map_location_id'],
      )!,
      targetType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_type'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_id'],
      )!,
      x: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}x'],
      )!,
      y: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}y'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MapPinsTable createAlias(String alias) {
    return $MapPinsTable(attachedDatabase, alias);
  }
}

class MapPin extends DataClass implements Insertable<MapPin> {
  final String id;
  final String projectId;

  /// The location whose map this pin sits on.
  final String mapLocationId;

  /// What the pin points to: 'location', 'character', 'item', 'event'.
  final String targetType;
  final String targetId;
  final double x;
  final double y;
  final String? label;
  final DateTime createdAt;
  const MapPin({
    required this.id,
    required this.projectId,
    required this.mapLocationId,
    required this.targetType,
    required this.targetId,
    required this.x,
    required this.y,
    this.label,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['map_location_id'] = Variable<String>(mapLocationId);
    map['target_type'] = Variable<String>(targetType);
    map['target_id'] = Variable<String>(targetId);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MapPinsCompanion toCompanion(bool nullToAbsent) {
    return MapPinsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      mapLocationId: Value(mapLocationId),
      targetType: Value(targetType),
      targetId: Value(targetId),
      x: Value(x),
      y: Value(y),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
      createdAt: Value(createdAt),
    );
  }

  factory MapPin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapPin(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      mapLocationId: serializer.fromJson<String>(json['mapLocationId']),
      targetType: serializer.fromJson<String>(json['targetType']),
      targetId: serializer.fromJson<String>(json['targetId']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      label: serializer.fromJson<String?>(json['label']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'mapLocationId': serializer.toJson<String>(mapLocationId),
      'targetType': serializer.toJson<String>(targetType),
      'targetId': serializer.toJson<String>(targetId),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'label': serializer.toJson<String?>(label),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MapPin copyWith({
    String? id,
    String? projectId,
    String? mapLocationId,
    String? targetType,
    String? targetId,
    double? x,
    double? y,
    Value<String?> label = const Value.absent(),
    DateTime? createdAt,
  }) => MapPin(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    mapLocationId: mapLocationId ?? this.mapLocationId,
    targetType: targetType ?? this.targetType,
    targetId: targetId ?? this.targetId,
    x: x ?? this.x,
    y: y ?? this.y,
    label: label.present ? label.value : this.label,
    createdAt: createdAt ?? this.createdAt,
  );
  MapPin copyWithCompanion(MapPinsCompanion data) {
    return MapPin(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      mapLocationId: data.mapLocationId.present
          ? data.mapLocationId.value
          : this.mapLocationId,
      targetType: data.targetType.present
          ? data.targetType.value
          : this.targetType,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      label: data.label.present ? data.label.value : this.label,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MapPin(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('mapLocationId: $mapLocationId, ')
          ..write('targetType: $targetType, ')
          ..write('targetId: $targetId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    mapLocationId,
    targetType,
    targetId,
    x,
    y,
    label,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapPin &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.mapLocationId == this.mapLocationId &&
          other.targetType == this.targetType &&
          other.targetId == this.targetId &&
          other.x == this.x &&
          other.y == this.y &&
          other.label == this.label &&
          other.createdAt == this.createdAt);
}

class MapPinsCompanion extends UpdateCompanion<MapPin> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> mapLocationId;
  final Value<String> targetType;
  final Value<String> targetId;
  final Value<double> x;
  final Value<double> y;
  final Value<String?> label;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MapPinsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.mapLocationId = const Value.absent(),
    this.targetType = const Value.absent(),
    this.targetId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.label = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MapPinsCompanion.insert({
    required String id,
    required String projectId,
    required String mapLocationId,
    required String targetType,
    required String targetId,
    required double x,
    required double y,
    this.label = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       mapLocationId = Value(mapLocationId),
       targetType = Value(targetType),
       targetId = Value(targetId),
       x = Value(x),
       y = Value(y);
  static Insertable<MapPin> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? mapLocationId,
    Expression<String>? targetType,
    Expression<String>? targetId,
    Expression<double>? x,
    Expression<double>? y,
    Expression<String>? label,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (mapLocationId != null) 'map_location_id': mapLocationId,
      if (targetType != null) 'target_type': targetType,
      if (targetId != null) 'target_id': targetId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (label != null) 'label': label,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MapPinsCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? mapLocationId,
    Value<String>? targetType,
    Value<String>? targetId,
    Value<double>? x,
    Value<double>? y,
    Value<String?>? label,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MapPinsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      mapLocationId: mapLocationId ?? this.mapLocationId,
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
      x: x ?? this.x,
      y: y ?? this.y,
      label: label ?? this.label,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (mapLocationId.present) {
      map['map_location_id'] = Variable<String>(mapLocationId.value);
    }
    if (targetType.present) {
      map['target_type'] = Variable<String>(targetType.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<String>(targetId.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapPinsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('mapLocationId: $mapLocationId, ')
          ..write('targetType: $targetType, ')
          ..write('targetId: $targetId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PartnerLinksTable extends PartnerLinks
    with TableInfo<$PartnerLinksTable, PartnerLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnerLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _aIdMeta = const VerificationMeta('aId');
  @override
  late final GeneratedColumn<String> aId = GeneratedColumn<String>(
    'a_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _bIdMeta = const VerificationMeta('bId');
  @override
  late final GeneratedColumn<String> bId = GeneratedColumn<String>(
    'b_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [aId, bId, type, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partner_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartnerLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('a_id')) {
      context.handle(
        _aIdMeta,
        aId.isAcceptableOrUnknown(data['a_id']!, _aIdMeta),
      );
    } else if (isInserting) {
      context.missing(_aIdMeta);
    }
    if (data.containsKey('b_id')) {
      context.handle(
        _bIdMeta,
        bId.isAcceptableOrUnknown(data['b_id']!, _bIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {aId, bId};
  @override
  PartnerLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartnerLink(
      aId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}a_id'],
      )!,
      bId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $PartnerLinksTable createAlias(String alias) {
    return $PartnerLinksTable(attachedDatabase, alias);
  }
}

class PartnerLink extends DataClass implements Insertable<PartnerLink> {
  final String aId;
  final String bId;

  /// 'Matrimonio', 'Pareja', 'Prometidos', 'Amantes'...
  final String? type;

  /// 'Actual', 'Separados', 'Viudo', 'Anulado'...
  final String? status;
  const PartnerLink({
    required this.aId,
    required this.bId,
    this.type,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['a_id'] = Variable<String>(aId);
    map['b_id'] = Variable<String>(bId);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  PartnerLinksCompanion toCompanion(bool nullToAbsent) {
    return PartnerLinksCompanion(
      aId: Value(aId),
      bId: Value(bId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory PartnerLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartnerLink(
      aId: serializer.fromJson<String>(json['aId']),
      bId: serializer.fromJson<String>(json['bId']),
      type: serializer.fromJson<String?>(json['type']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'aId': serializer.toJson<String>(aId),
      'bId': serializer.toJson<String>(bId),
      'type': serializer.toJson<String?>(type),
      'status': serializer.toJson<String?>(status),
    };
  }

  PartnerLink copyWith({
    String? aId,
    String? bId,
    Value<String?> type = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => PartnerLink(
    aId: aId ?? this.aId,
    bId: bId ?? this.bId,
    type: type.present ? type.value : this.type,
    status: status.present ? status.value : this.status,
  );
  PartnerLink copyWithCompanion(PartnerLinksCompanion data) {
    return PartnerLink(
      aId: data.aId.present ? data.aId.value : this.aId,
      bId: data.bId.present ? data.bId.value : this.bId,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartnerLink(')
          ..write('aId: $aId, ')
          ..write('bId: $bId, ')
          ..write('type: $type, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(aId, bId, type, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartnerLink &&
          other.aId == this.aId &&
          other.bId == this.bId &&
          other.type == this.type &&
          other.status == this.status);
}

class PartnerLinksCompanion extends UpdateCompanion<PartnerLink> {
  final Value<String> aId;
  final Value<String> bId;
  final Value<String?> type;
  final Value<String?> status;
  final Value<int> rowid;
  const PartnerLinksCompanion({
    this.aId = const Value.absent(),
    this.bId = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PartnerLinksCompanion.insert({
    required String aId,
    required String bId,
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : aId = Value(aId),
       bId = Value(bId);
  static Insertable<PartnerLink> custom({
    Expression<String>? aId,
    Expression<String>? bId,
    Expression<String>? type,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (aId != null) 'a_id': aId,
      if (bId != null) 'b_id': bId,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PartnerLinksCompanion copyWith({
    Value<String>? aId,
    Value<String>? bId,
    Value<String?>? type,
    Value<String?>? status,
    Value<int>? rowid,
  }) {
    return PartnerLinksCompanion(
      aId: aId ?? this.aId,
      bId: bId ?? this.bId,
      type: type ?? this.type,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (aId.present) {
      map['a_id'] = Variable<String>(aId.value);
    }
    if (bId.present) {
      map['b_id'] = Variable<String>(bId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnerLinksCompanion(')
          ..write('aId: $aId, ')
          ..write('bId: $bId, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $FactionsTable factions = $FactionsTable(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $ChaptersTable chapters = $ChaptersTable(this);
  late final $TimelineEventsTable timelineEvents = $TimelineEventsTable(this);
  late final $CharacterRelationshipsTable characterRelationships =
      $CharacterRelationshipsTable(this);
  late final $RelationshipMembersTable relationshipMembers =
      $RelationshipMembersTable(this);
  late final $EventCharactersTable eventCharacters = $EventCharactersTable(
    this,
  );
  late final $ChapterCharactersTable chapterCharacters =
      $ChapterCharactersTable(this);
  late final $ChapterLocationsTable chapterLocations = $ChapterLocationsTable(
    this,
  );
  late final $NotesTable notes = $NotesTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $MagicSystemsTable magicSystems = $MagicSystemsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $TagLinksTable tagLinks = $TagLinksTable(this);
  late final $CharacterSheetsTable characterSheets = $CharacterSheetsTable(
    this,
  );
  late final $FamilyLinksTable familyLinks = $FamilyLinksTable(this);
  late final $SecretsTable secrets = $SecretsTable(this);
  late final $SecretKnowersTable secretKnowers = $SecretKnowersTable(this);
  late final $CustomFieldsTable customFields = $CustomFieldsTable(this);
  late final $DiceRollsTable diceRolls = $DiceRollsTable(this);
  late final $MapPinsTable mapPins = $MapPinsTable(this);
  late final $PartnerLinksTable partnerLinks = $PartnerLinksTable(this);
  late final ProjectDao projectDao = ProjectDao(this as AppDatabase);
  late final CharacterDao characterDao = CharacterDao(this as AppDatabase);
  late final FactionDao factionDao = FactionDao(this as AppDatabase);
  late final LocationDao locationDao = LocationDao(this as AppDatabase);
  late final TimelineDao timelineDao = TimelineDao(this as AppDatabase);
  late final RelationshipDao relationshipDao = RelationshipDao(
    this as AppDatabase,
  );
  late final ChapterDao chapterDao = ChapterDao(this as AppDatabase);
  late final NoteDao noteDao = NoteDao(this as AppDatabase);
  late final ItemDao itemDao = ItemDao(this as AppDatabase);
  late final MagicDao magicDao = MagicDao(this as AppDatabase);
  late final TagDao tagDao = TagDao(this as AppDatabase);
  late final SearchDao searchDao = SearchDao(this as AppDatabase);
  late final SheetDao sheetDao = SheetDao(this as AppDatabase);
  late final FamilyDao familyDao = FamilyDao(this as AppDatabase);
  late final SecretDao secretDao = SecretDao(this as AppDatabase);
  late final CustomFieldDao customFieldDao = CustomFieldDao(
    this as AppDatabase,
  );
  late final DiceDao diceDao = DiceDao(this as AppDatabase);
  late final MapPinDao mapPinDao = MapPinDao(this as AppDatabase);
  late final PartnerDao partnerDao = PartnerDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    projects,
    factions,
    locations,
    characters,
    chapters,
    timelineEvents,
    characterRelationships,
    relationshipMembers,
    eventCharacters,
    chapterCharacters,
    chapterLocations,
    notes,
    items,
    magicSystems,
    tags,
    tagLinks,
    characterSheets,
    familyLinks,
    secrets,
    secretKnowers,
    customFields,
    diceRolls,
    mapPins,
    partnerLinks,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('factions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('locations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'locations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('locations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('characters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'factions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('characters', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('timeline_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'locations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('timeline_events', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'chapters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('timeline_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('character_relationships', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'character_relationships',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('relationship_members', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('relationship_members', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'timeline_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_characters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_characters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'chapters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapter_characters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapter_characters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'chapters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapter_locations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'locations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapter_locations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('notes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('items', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'locations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('items', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('magic_systems', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tags', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tag_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('character_sheets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('family_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('family_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('secrets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('secrets', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'secrets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('secret_knowers', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('secret_knowers', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('custom_fields', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('dice_rolls', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('map_pins', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'locations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('map_pins', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('partner_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('partner_links', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> coverImagePath,
      Value<String> kind,
      Value<String> themeId,
      Value<bool> autoChapterTimeline,
      Value<bool> timelineSortByYear,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> coverImagePath,
      Value<String> kind,
      Value<String> themeId,
      Value<bool> autoChapterTimeline,
      Value<bool> timelineSortByYear,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FactionsTable, List<Faction>> _factionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.factions,
    aliasName: 'projects__id__factions__project_id',
  );

  $$FactionsTableProcessedTableManager get factionsRefs {
    final manager = $$FactionsTableTableManager(
      $_db,
      $_db.factions,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_factionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LocationsTable, List<Location>>
  _locationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.locations,
    aliasName: 'projects__id__locations__project_id',
  );

  $$LocationsTableProcessedTableManager get locationsRefs {
    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_locationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<Character>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: 'projects__id__characters__project_id',
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChaptersTable, List<Chapter>> _chaptersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chapters,
    aliasName: 'projects__id__chapters__project_id',
  );

  $$ChaptersTableProcessedTableManager get chaptersRefs {
    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_chaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TimelineEventsTable, List<TimelineEvent>>
  _timelineEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timelineEvents,
    aliasName: 'projects__id__timeline_events__project_id',
  );

  $$TimelineEventsTableProcessedTableManager get timelineEventsRefs {
    final manager = $$TimelineEventsTableTableManager(
      $_db,
      $_db.timelineEvents,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_timelineEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CharacterRelationshipsTable,
    List<CharacterRelationship>
  >
  _characterRelationshipsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterRelationships,
        aliasName: 'projects__id__character_relationships__project_id',
      );

  $$CharacterRelationshipsTableProcessedTableManager
  get characterRelationshipsRefs {
    final manager = $$CharacterRelationshipsTableTableManager(
      $_db,
      $_db.characterRelationships,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterRelationshipsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotesTable, List<Note>> _notesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.notes,
    aliasName: 'projects__id__notes__project_id',
  );

  $$NotesTableProcessedTableManager get notesRefs {
    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ItemsTable, List<Item>> _itemsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.items,
    aliasName: 'projects__id__items__project_id',
  );

  $$ItemsTableProcessedTableManager get itemsRefs {
    final manager = $$ItemsTableTableManager(
      $_db,
      $_db.items,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MagicSystemsTable, List<MagicSystem>>
  _magicSystemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.magicSystems,
    aliasName: 'projects__id__magic_systems__project_id',
  );

  $$MagicSystemsTableProcessedTableManager get magicSystemsRefs {
    final manager = $$MagicSystemsTableTableManager(
      $_db,
      $_db.magicSystems,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_magicSystemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TagsTable, List<Tag>> _tagsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tags,
    aliasName: 'projects__id__tags__project_id',
  );

  $$TagsTableProcessedTableManager get tagsRefs {
    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SecretsTable, List<Secret>> _secretsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.secrets,
    aliasName: 'projects__id__secrets__project_id',
  );

  $$SecretsTableProcessedTableManager get secretsRefs {
    final manager = $$SecretsTableTableManager(
      $_db,
      $_db.secrets,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_secretsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CustomFieldsTable, List<CustomField>>
  _customFieldsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customFields,
    aliasName: 'projects__id__custom_fields__project_id',
  );

  $$CustomFieldsTableProcessedTableManager get customFieldsRefs {
    final manager = $$CustomFieldsTableTableManager(
      $_db,
      $_db.customFields,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_customFieldsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiceRollsTable, List<DiceRoll>>
  _diceRollsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diceRolls,
    aliasName: 'projects__id__dice_rolls__project_id',
  );

  $$DiceRollsTableProcessedTableManager get diceRollsRefs {
    final manager = $$DiceRollsTableTableManager(
      $_db,
      $_db.diceRolls,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_diceRollsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MapPinsTable, List<MapPin>> _mapPinsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.mapPins,
    aliasName: 'projects__id__map_pins__project_id',
  );

  $$MapPinsTableProcessedTableManager get mapPinsRefs {
    final manager = $$MapPinsTableTableManager(
      $_db,
      $_db.mapPins,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mapPinsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeId => $composableBuilder(
    column: $table.themeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoChapterTimeline => $composableBuilder(
    column: $table.autoChapterTimeline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get timelineSortByYear => $composableBuilder(
    column: $table.timelineSortByYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> factionsRefs(
    Expression<bool> Function($$FactionsTableFilterComposer f) f,
  ) {
    final $$FactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableFilterComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> locationsRefs(
    Expression<bool> Function($$LocationsTableFilterComposer f) f,
  ) {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chaptersRefs(
    Expression<bool> Function($$ChaptersTableFilterComposer f) f,
  ) {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> timelineEventsRefs(
    Expression<bool> Function($$TimelineEventsTableFilterComposer f) f,
  ) {
    final $$TimelineEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableFilterComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterRelationshipsRefs(
    Expression<bool> Function($$CharacterRelationshipsTableFilterComposer f) f,
  ) {
    final $$CharacterRelationshipsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterRelationships,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterRelationshipsTableFilterComposer(
                $db: $db,
                $table: $db.characterRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> notesRefs(
    Expression<bool> Function($$NotesTableFilterComposer f) f,
  ) {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itemsRefs(
    Expression<bool> Function($$ItemsTableFilterComposer f) f,
  ) {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> magicSystemsRefs(
    Expression<bool> Function($$MagicSystemsTableFilterComposer f) f,
  ) {
    final $$MagicSystemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.magicSystems,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MagicSystemsTableFilterComposer(
            $db: $db,
            $table: $db.magicSystems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tagsRefs(
    Expression<bool> Function($$TagsTableFilterComposer f) f,
  ) {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> secretsRefs(
    Expression<bool> Function($$SecretsTableFilterComposer f) f,
  ) {
    final $$SecretsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableFilterComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> customFieldsRefs(
    Expression<bool> Function($$CustomFieldsTableFilterComposer f) f,
  ) {
    final $$CustomFieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customFields,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomFieldsTableFilterComposer(
            $db: $db,
            $table: $db.customFields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diceRollsRefs(
    Expression<bool> Function($$DiceRollsTableFilterComposer f) f,
  ) {
    final $$DiceRollsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diceRolls,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiceRollsTableFilterComposer(
            $db: $db,
            $table: $db.diceRolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mapPinsRefs(
    Expression<bool> Function($$MapPinsTableFilterComposer f) f,
  ) {
    final $$MapPinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mapPins,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MapPinsTableFilterComposer(
            $db: $db,
            $table: $db.mapPins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeId => $composableBuilder(
    column: $table.themeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoChapterTimeline => $composableBuilder(
    column: $table.autoChapterTimeline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get timelineSortByYear => $composableBuilder(
    column: $table.timelineSortByYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverImagePath => $composableBuilder(
    column: $table.coverImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get themeId =>
      $composableBuilder(column: $table.themeId, builder: (column) => column);

  GeneratedColumn<bool> get autoChapterTimeline => $composableBuilder(
    column: $table.autoChapterTimeline,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get timelineSortByYear => $composableBuilder(
    column: $table.timelineSortByYear,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> factionsRefs<T extends Object>(
    Expression<T> Function($$FactionsTableAnnotationComposer a) f,
  ) {
    final $$FactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> locationsRefs<T extends Object>(
    Expression<T> Function($$LocationsTableAnnotationComposer a) f,
  ) {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> chaptersRefs<T extends Object>(
    Expression<T> Function($$ChaptersTableAnnotationComposer a) f,
  ) {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> timelineEventsRefs<T extends Object>(
    Expression<T> Function($$TimelineEventsTableAnnotationComposer a) f,
  ) {
    final $$TimelineEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> characterRelationshipsRefs<T extends Object>(
    Expression<T> Function($$CharacterRelationshipsTableAnnotationComposer a) f,
  ) {
    final $$CharacterRelationshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterRelationships,
          getReferencedColumn: (t) => t.projectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterRelationshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.characterRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> notesRefs<T extends Object>(
    Expression<T> Function($$NotesTableAnnotationComposer a) f,
  ) {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> itemsRefs<T extends Object>(
    Expression<T> Function($$ItemsTableAnnotationComposer a) f,
  ) {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> magicSystemsRefs<T extends Object>(
    Expression<T> Function($$MagicSystemsTableAnnotationComposer a) f,
  ) {
    final $$MagicSystemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.magicSystems,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MagicSystemsTableAnnotationComposer(
            $db: $db,
            $table: $db.magicSystems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tagsRefs<T extends Object>(
    Expression<T> Function($$TagsTableAnnotationComposer a) f,
  ) {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> secretsRefs<T extends Object>(
    Expression<T> Function($$SecretsTableAnnotationComposer a) f,
  ) {
    final $$SecretsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableAnnotationComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> customFieldsRefs<T extends Object>(
    Expression<T> Function($$CustomFieldsTableAnnotationComposer a) f,
  ) {
    final $$CustomFieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customFields,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomFieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.customFields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diceRollsRefs<T extends Object>(
    Expression<T> Function($$DiceRollsTableAnnotationComposer a) f,
  ) {
    final $$DiceRollsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diceRolls,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiceRollsTableAnnotationComposer(
            $db: $db,
            $table: $db.diceRolls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mapPinsRefs<T extends Object>(
    Expression<T> Function($$MapPinsTableAnnotationComposer a) f,
  ) {
    final $$MapPinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mapPins,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MapPinsTableAnnotationComposer(
            $db: $db,
            $table: $db.mapPins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, $$ProjectsTableReferences),
          Project,
          PrefetchHooks Function({
            bool factionsRefs,
            bool locationsRefs,
            bool charactersRefs,
            bool chaptersRefs,
            bool timelineEventsRefs,
            bool characterRelationshipsRefs,
            bool notesRefs,
            bool itemsRefs,
            bool magicSystemsRefs,
            bool tagsRefs,
            bool secretsRefs,
            bool customFieldsRefs,
            bool diceRollsRefs,
            bool mapPinsRefs,
          })
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> coverImagePath = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> themeId = const Value.absent(),
                Value<bool> autoChapterTimeline = const Value.absent(),
                Value<bool> timelineSortByYear = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                name: name,
                description: description,
                coverImagePath: coverImagePath,
                kind: kind,
                themeId: themeId,
                autoChapterTimeline: autoChapterTimeline,
                timelineSortByYear: timelineSortByYear,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> coverImagePath = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> themeId = const Value.absent(),
                Value<bool> autoChapterTimeline = const Value.absent(),
                Value<bool> timelineSortByYear = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                name: name,
                description: description,
                coverImagePath: coverImagePath,
                kind: kind,
                themeId: themeId,
                autoChapterTimeline: autoChapterTimeline,
                timelineSortByYear: timelineSortByYear,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                factionsRefs = false,
                locationsRefs = false,
                charactersRefs = false,
                chaptersRefs = false,
                timelineEventsRefs = false,
                characterRelationshipsRefs = false,
                notesRefs = false,
                itemsRefs = false,
                magicSystemsRefs = false,
                tagsRefs = false,
                secretsRefs = false,
                customFieldsRefs = false,
                diceRollsRefs = false,
                mapPinsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (factionsRefs) db.factions,
                    if (locationsRefs) db.locations,
                    if (charactersRefs) db.characters,
                    if (chaptersRefs) db.chapters,
                    if (timelineEventsRefs) db.timelineEvents,
                    if (characterRelationshipsRefs) db.characterRelationships,
                    if (notesRefs) db.notes,
                    if (itemsRefs) db.items,
                    if (magicSystemsRefs) db.magicSystems,
                    if (tagsRefs) db.tags,
                    if (secretsRefs) db.secrets,
                    if (customFieldsRefs) db.customFields,
                    if (diceRollsRefs) db.diceRolls,
                    if (mapPinsRefs) db.mapPins,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (factionsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Faction
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._factionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).factionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (locationsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Location
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._locationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).locationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (charactersRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Character
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._charactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chaptersRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Chapter
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._chaptersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).chaptersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (timelineEventsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          TimelineEvent
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._timelineEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).timelineEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (characterRelationshipsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          CharacterRelationship
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._characterRelationshipsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).characterRelationshipsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notesRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Note
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._notesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).notesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (itemsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Item
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._itemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).itemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (magicSystemsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          MagicSystem
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._magicSystemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).magicSystemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tagsRefs)
                        await $_getPrefetchedData<Project, $ProjectsTable, Tag>(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._tagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(db, table, p0).tagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (secretsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Secret
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._secretsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).secretsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (customFieldsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          CustomField
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._customFieldsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).customFieldsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (diceRollsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          DiceRoll
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._diceRollsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).diceRollsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mapPinsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          MapPin
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._mapPinsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).mapPinsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, $$ProjectsTableReferences),
      Project,
      PrefetchHooks Function({
        bool factionsRefs,
        bool locationsRefs,
        bool charactersRefs,
        bool chaptersRefs,
        bool timelineEventsRefs,
        bool characterRelationshipsRefs,
        bool notesRefs,
        bool itemsRefs,
        bool magicSystemsRefs,
        bool tagsRefs,
        bool secretsRefs,
        bool customFieldsRefs,
        bool diceRollsRefs,
        bool mapPinsRefs,
      })
    >;
typedef $$FactionsTableCreateCompanionBuilder =
    FactionsCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> symbolImagePath,
      Value<bool> symbolIsDrawing,
      Value<String?> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$FactionsTableUpdateCompanionBuilder =
    FactionsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> symbolImagePath,
      Value<bool> symbolIsDrawing,
      Value<String?> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$FactionsTableReferences
    extends BaseReferences<_$AppDatabase, $FactionsTable, Faction> {
  $$FactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('factions__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<Character>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: 'factions__id__characters__faction_id',
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FactionsTableFilterComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbolImagePath => $composableBuilder(
    column: $table.symbolImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get symbolIsDrawing => $composableBuilder(
    column: $table.symbolIsDrawing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbolImagePath => $composableBuilder(
    column: $table.symbolImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get symbolIsDrawing => $composableBuilder(
    column: $table.symbolIsDrawing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get symbolImagePath => $composableBuilder(
    column: $table.symbolImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get symbolIsDrawing => $composableBuilder(
    column: $table.symbolIsDrawing,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FactionsTable,
          Faction,
          $$FactionsTableFilterComposer,
          $$FactionsTableOrderingComposer,
          $$FactionsTableAnnotationComposer,
          $$FactionsTableCreateCompanionBuilder,
          $$FactionsTableUpdateCompanionBuilder,
          (Faction, $$FactionsTableReferences),
          Faction,
          PrefetchHooks Function({bool projectId, bool charactersRefs})
        > {
  $$FactionsTableTableManager(_$AppDatabase db, $FactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> symbolImagePath = const Value.absent(),
                Value<bool> symbolIsDrawing = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FactionsCompanion(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                description: description,
                symbolImagePath: symbolImagePath,
                symbolIsDrawing: symbolIsDrawing,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> symbolImagePath = const Value.absent(),
                Value<bool> symbolIsDrawing = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FactionsCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                description: description,
                symbolImagePath: symbolImagePath,
                symbolIsDrawing: symbolIsDrawing,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false, charactersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (charactersRefs) db.characters],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$FactionsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$FactionsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (charactersRefs)
                    await $_getPrefetchedData<
                      Faction,
                      $FactionsTable,
                      Character
                    >(
                      currentTable: table,
                      referencedTable: $$FactionsTableReferences
                          ._charactersRefsTable(db),
                      managerFromTypedResult: (p0) => $$FactionsTableReferences(
                        db,
                        table,
                        p0,
                      ).charactersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.factionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FactionsTable,
      Faction,
      $$FactionsTableFilterComposer,
      $$FactionsTableOrderingComposer,
      $$FactionsTableAnnotationComposer,
      $$FactionsTableCreateCompanionBuilder,
      $$FactionsTableUpdateCompanionBuilder,
      (Faction, $$FactionsTableReferences),
      Faction,
      PrefetchHooks Function({bool projectId, bool charactersRefs})
    >;
typedef $$LocationsTableCreateCompanionBuilder =
    LocationsCompanion Function({
      required String id,
      required String projectId,
      Value<String?> parentLocationId,
      required String name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> climate,
      Value<String?> population,
      Value<String?> government,
      Value<String?> status,
      Value<String?> mapImagePath,
      Value<bool> mapIsDrawing,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$LocationsTableUpdateCompanionBuilder =
    LocationsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String?> parentLocationId,
      Value<String> name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> climate,
      Value<String?> population,
      Value<String?> government,
      Value<String?> status,
      Value<String?> mapImagePath,
      Value<bool> mapIsDrawing,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$LocationsTableReferences
    extends BaseReferences<_$AppDatabase, $LocationsTable, Location> {
  $$LocationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('locations__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsTable _parentLocationIdTable(_$AppDatabase db) =>
      db.locations.createAlias('locations__parent_location_id__locations__id');

  $$LocationsTableProcessedTableManager? get parentLocationId {
    final $_column = $_itemColumn<String>('parent_location_id');
    if ($_column == null) return null;
    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentLocationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TimelineEventsTable, List<TimelineEvent>>
  _timelineEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timelineEvents,
    aliasName: 'locations__id__timeline_events__location_id',
  );

  $$TimelineEventsTableProcessedTableManager get timelineEventsRefs {
    final manager = $$TimelineEventsTableTableManager(
      $_db,
      $_db.timelineEvents,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_timelineEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChapterLocationsTable, List<ChapterLocation>>
  _chapterLocationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.chapterLocations,
    aliasName: 'locations__id__chapter_locations__location_id',
  );

  $$ChapterLocationsTableProcessedTableManager get chapterLocationsRefs {
    final manager = $$ChapterLocationsTableTableManager(
      $_db,
      $_db.chapterLocations,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chapterLocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ItemsTable, List<Item>> _itemsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.items,
    aliasName: 'locations__id__items__location_id',
  );

  $$ItemsTableProcessedTableManager get itemsRefs {
    final manager = $$ItemsTableTableManager(
      $_db,
      $_db.items,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MapPinsTable, List<MapPin>> _mapPinsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.mapPins,
    aliasName: 'locations__id__map_pins__map_location_id',
  );

  $$MapPinsTableProcessedTableManager get mapPinsRefs {
    final manager = $$MapPinsTableTableManager(
      $_db,
      $_db.mapPins,
    ).filter((f) => f.mapLocationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mapPinsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get climate => $composableBuilder(
    column: $table.climate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get government => $composableBuilder(
    column: $table.government,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mapImagePath => $composableBuilder(
    column: $table.mapImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mapIsDrawing => $composableBuilder(
    column: $table.mapIsDrawing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableFilterComposer get parentLocationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> timelineEventsRefs(
    Expression<bool> Function($$TimelineEventsTableFilterComposer f) f,
  ) {
    final $$TimelineEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableFilterComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chapterLocationsRefs(
    Expression<bool> Function($$ChapterLocationsTableFilterComposer f) f,
  ) {
    final $$ChapterLocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterLocations,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterLocationsTableFilterComposer(
            $db: $db,
            $table: $db.chapterLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itemsRefs(
    Expression<bool> Function($$ItemsTableFilterComposer f) f,
  ) {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mapPinsRefs(
    Expression<bool> Function($$MapPinsTableFilterComposer f) f,
  ) {
    final $$MapPinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mapPins,
      getReferencedColumn: (t) => t.mapLocationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MapPinsTableFilterComposer(
            $db: $db,
            $table: $db.mapPins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get climate => $composableBuilder(
    column: $table.climate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get government => $composableBuilder(
    column: $table.government,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mapImagePath => $composableBuilder(
    column: $table.mapImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mapIsDrawing => $composableBuilder(
    column: $table.mapIsDrawing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableOrderingComposer get parentLocationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get climate =>
      $composableBuilder(column: $table.climate, builder: (column) => column);

  GeneratedColumn<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );

  GeneratedColumn<String> get government => $composableBuilder(
    column: $table.government,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get mapImagePath => $composableBuilder(
    column: $table.mapImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get mapIsDrawing => $composableBuilder(
    column: $table.mapIsDrawing,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableAnnotationComposer get parentLocationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> timelineEventsRefs<T extends Object>(
    Expression<T> Function($$TimelineEventsTableAnnotationComposer a) f,
  ) {
    final $$TimelineEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> chapterLocationsRefs<T extends Object>(
    Expression<T> Function($$ChapterLocationsTableAnnotationComposer a) f,
  ) {
    final $$ChapterLocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterLocations,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterLocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.chapterLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> itemsRefs<T extends Object>(
    Expression<T> Function($$ItemsTableAnnotationComposer a) f,
  ) {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mapPinsRefs<T extends Object>(
    Expression<T> Function($$MapPinsTableAnnotationComposer a) f,
  ) {
    final $$MapPinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mapPins,
      getReferencedColumn: (t) => t.mapLocationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MapPinsTableAnnotationComposer(
            $db: $db,
            $table: $db.mapPins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationsTable,
          Location,
          $$LocationsTableFilterComposer,
          $$LocationsTableOrderingComposer,
          $$LocationsTableAnnotationComposer,
          $$LocationsTableCreateCompanionBuilder,
          $$LocationsTableUpdateCompanionBuilder,
          (Location, $$LocationsTableReferences),
          Location,
          PrefetchHooks Function({
            bool projectId,
            bool parentLocationId,
            bool timelineEventsRefs,
            bool chapterLocationsRefs,
            bool itemsRefs,
            bool mapPinsRefs,
          })
        > {
  $$LocationsTableTableManager(_$AppDatabase db, $LocationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String?> parentLocationId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> climate = const Value.absent(),
                Value<String?> population = const Value.absent(),
                Value<String?> government = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> mapImagePath = const Value.absent(),
                Value<bool> mapIsDrawing = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationsCompanion(
                id: id,
                projectId: projectId,
                parentLocationId: parentLocationId,
                name: name,
                type: type,
                description: description,
                climate: climate,
                population: population,
                government: government,
                status: status,
                mapImagePath: mapImagePath,
                mapIsDrawing: mapIsDrawing,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                Value<String?> parentLocationId = const Value.absent(),
                required String name,
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> climate = const Value.absent(),
                Value<String?> population = const Value.absent(),
                Value<String?> government = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> mapImagePath = const Value.absent(),
                Value<bool> mapIsDrawing = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationsCompanion.insert(
                id: id,
                projectId: projectId,
                parentLocationId: parentLocationId,
                name: name,
                type: type,
                description: description,
                climate: climate,
                population: population,
                government: government,
                status: status,
                mapImagePath: mapImagePath,
                mapIsDrawing: mapIsDrawing,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                parentLocationId = false,
                timelineEventsRefs = false,
                chapterLocationsRefs = false,
                itemsRefs = false,
                mapPinsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timelineEventsRefs) db.timelineEvents,
                    if (chapterLocationsRefs) db.chapterLocations,
                    if (itemsRefs) db.items,
                    if (mapPinsRefs) db.mapPins,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$LocationsTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn: $$LocationsTableReferences
                                        ._projectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (parentLocationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parentLocationId,
                                    referencedTable: $$LocationsTableReferences
                                        ._parentLocationIdTable(db),
                                    referencedColumn: $$LocationsTableReferences
                                        ._parentLocationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timelineEventsRefs)
                        await $_getPrefetchedData<
                          Location,
                          $LocationsTable,
                          TimelineEvent
                        >(
                          currentTable: table,
                          referencedTable: $$LocationsTableReferences
                              ._timelineEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LocationsTableReferences(
                                db,
                                table,
                                p0,
                              ).timelineEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.locationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chapterLocationsRefs)
                        await $_getPrefetchedData<
                          Location,
                          $LocationsTable,
                          ChapterLocation
                        >(
                          currentTable: table,
                          referencedTable: $$LocationsTableReferences
                              ._chapterLocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LocationsTableReferences(
                                db,
                                table,
                                p0,
                              ).chapterLocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.locationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (itemsRefs)
                        await $_getPrefetchedData<
                          Location,
                          $LocationsTable,
                          Item
                        >(
                          currentTable: table,
                          referencedTable: $$LocationsTableReferences
                              ._itemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LocationsTableReferences(
                                db,
                                table,
                                p0,
                              ).itemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.locationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mapPinsRefs)
                        await $_getPrefetchedData<
                          Location,
                          $LocationsTable,
                          MapPin
                        >(
                          currentTable: table,
                          referencedTable: $$LocationsTableReferences
                              ._mapPinsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LocationsTableReferences(
                                db,
                                table,
                                p0,
                              ).mapPinsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.mapLocationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationsTable,
      Location,
      $$LocationsTableFilterComposer,
      $$LocationsTableOrderingComposer,
      $$LocationsTableAnnotationComposer,
      $$LocationsTableCreateCompanionBuilder,
      $$LocationsTableUpdateCompanionBuilder,
      (Location, $$LocationsTableReferences),
      Location,
      PrefetchHooks Function({
        bool projectId,
        bool parentLocationId,
        bool timelineEventsRefs,
        bool chapterLocationsRefs,
        bool itemsRefs,
        bool mapPinsRefs,
      })
    >;
typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      required String id,
      required String projectId,
      required String firstName,
      Value<String?> lastName,
      Value<String?> aliasNickname,
      Value<String?> race,
      Value<String?> gender,
      Value<String?> age,
      Value<String?> occupation,
      Value<String?> factionId,
      Value<String?> status,
      Value<String?> physicalDescription,
      Value<String?> personality,
      Value<String?> backstory,
      Value<String?> abilities,
      Value<String?> notes,
      Value<String?> portraitImagePath,
      Value<bool> portraitIsDrawing,
      Value<String?> role,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> firstName,
      Value<String?> lastName,
      Value<String?> aliasNickname,
      Value<String?> race,
      Value<String?> gender,
      Value<String?> age,
      Value<String?> occupation,
      Value<String?> factionId,
      Value<String?> status,
      Value<String?> physicalDescription,
      Value<String?> personality,
      Value<String?> backstory,
      Value<String?> abilities,
      Value<String?> notes,
      Value<String?> portraitImagePath,
      Value<bool> portraitIsDrawing,
      Value<String?> role,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CharactersTableReferences
    extends BaseReferences<_$AppDatabase, $CharactersTable, Character> {
  $$CharactersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('characters__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FactionsTable _factionIdTable(_$AppDatabase db) =>
      db.factions.createAlias('characters__faction_id__factions__id');

  $$FactionsTableProcessedTableManager? get factionId {
    final $_column = $_itemColumn<String>('faction_id');
    if ($_column == null) return null;
    final manager = $$FactionsTableTableManager(
      $_db,
      $_db.factions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RelationshipMembersTable,
    List<RelationshipMember>
  >
  _relationshipMembersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.relationshipMembers,
        aliasName: 'characters__id__relationship_members__character_id',
      );

  $$RelationshipMembersTableProcessedTableManager get relationshipMembersRefs {
    final manager = $$RelationshipMembersTableTableManager(
      $_db,
      $_db.relationshipMembers,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventCharactersTable, List<EventCharacter>>
  _eventCharactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventCharacters,
    aliasName: 'characters__id__event_characters__character_id',
  );

  $$EventCharactersTableProcessedTableManager get eventCharactersRefs {
    final manager = $$EventCharactersTableTableManager(
      $_db,
      $_db.eventCharacters,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChapterCharactersTable, List<ChapterCharacter>>
  _chapterCharactersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.chapterCharacters,
        aliasName: 'characters__id__chapter_characters__character_id',
      );

  $$ChapterCharactersTableProcessedTableManager get chapterCharactersRefs {
    final manager = $$ChapterCharactersTableTableManager(
      $_db,
      $_db.chapterCharacters,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chapterCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ItemsTable, List<Item>> _itemsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.items,
    aliasName: 'characters__id__items__owner_character_id',
  );

  $$ItemsTableProcessedTableManager get itemsRefs {
    final manager = $$ItemsTableTableManager($_db, $_db.items).filter(
      (f) => f.ownerCharacterId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_itemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharacterSheetsTable, List<CharacterSheet>>
  _characterSheetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterSheets,
    aliasName: 'characters__id__character_sheets__character_id',
  );

  $$CharacterSheetsTableProcessedTableManager get characterSheetsRefs {
    final manager = $$CharacterSheetsTableTableManager(
      $_db,
      $_db.characterSheets,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterSheetsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SecretsTable, List<Secret>> _secretsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.secrets,
    aliasName: 'characters__id__secrets__owner_character_id',
  );

  $$SecretsTableProcessedTableManager get secretsRefs {
    final manager = $$SecretsTableTableManager($_db, $_db.secrets).filter(
      (f) => f.ownerCharacterId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_secretsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SecretKnowersTable, List<SecretKnower>>
  _secretKnowersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.secretKnowers,
    aliasName: 'characters__id__secret_knowers__character_id',
  );

  $$SecretKnowersTableProcessedTableManager get secretKnowersRefs {
    final manager = $$SecretKnowersTableTableManager(
      $_db,
      $_db.secretKnowers,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_secretKnowersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliasNickname => $composableBuilder(
    column: $table.aliasNickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get physicalDescription => $composableBuilder(
    column: $table.physicalDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abilities => $composableBuilder(
    column: $table.abilities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get portraitImagePath => $composableBuilder(
    column: $table.portraitImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get portraitIsDrawing => $composableBuilder(
    column: $table.portraitIsDrawing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FactionsTableFilterComposer get factionId {
    final $$FactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableFilterComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> relationshipMembersRefs(
    Expression<bool> Function($$RelationshipMembersTableFilterComposer f) f,
  ) {
    final $$RelationshipMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationshipMembers,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipMembersTableFilterComposer(
            $db: $db,
            $table: $db.relationshipMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventCharactersRefs(
    Expression<bool> Function($$EventCharactersTableFilterComposer f) f,
  ) {
    final $$EventCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventCharacters,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventCharactersTableFilterComposer(
            $db: $db,
            $table: $db.eventCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chapterCharactersRefs(
    Expression<bool> Function($$ChapterCharactersTableFilterComposer f) f,
  ) {
    final $$ChapterCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterCharacters,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterCharactersTableFilterComposer(
            $db: $db,
            $table: $db.chapterCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itemsRefs(
    Expression<bool> Function($$ItemsTableFilterComposer f) f,
  ) {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.ownerCharacterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> characterSheetsRefs(
    Expression<bool> Function($$CharacterSheetsTableFilterComposer f) f,
  ) {
    final $$CharacterSheetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSheets,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSheetsTableFilterComposer(
            $db: $db,
            $table: $db.characterSheets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> secretsRefs(
    Expression<bool> Function($$SecretsTableFilterComposer f) f,
  ) {
    final $$SecretsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.ownerCharacterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableFilterComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> secretKnowersRefs(
    Expression<bool> Function($$SecretKnowersTableFilterComposer f) f,
  ) {
    final $$SecretKnowersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secretKnowers,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretKnowersTableFilterComposer(
            $db: $db,
            $table: $db.secretKnowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliasNickname => $composableBuilder(
    column: $table.aliasNickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get physicalDescription => $composableBuilder(
    column: $table.physicalDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abilities => $composableBuilder(
    column: $table.abilities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get portraitImagePath => $composableBuilder(
    column: $table.portraitImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get portraitIsDrawing => $composableBuilder(
    column: $table.portraitIsDrawing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FactionsTableOrderingComposer get factionId {
    final $$FactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableOrderingComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get aliasNickname => $composableBuilder(
    column: $table.aliasNickname,
    builder: (column) => column,
  );

  GeneratedColumn<String> get race =>
      $composableBuilder(column: $table.race, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get physicalDescription => $composableBuilder(
    column: $table.physicalDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backstory =>
      $composableBuilder(column: $table.backstory, builder: (column) => column);

  GeneratedColumn<String> get abilities =>
      $composableBuilder(column: $table.abilities, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get portraitImagePath => $composableBuilder(
    column: $table.portraitImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get portraitIsDrawing => $composableBuilder(
    column: $table.portraitIsDrawing,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FactionsTableAnnotationComposer get factionId {
    final $$FactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> relationshipMembersRefs<T extends Object>(
    Expression<T> Function($$RelationshipMembersTableAnnotationComposer a) f,
  ) {
    final $$RelationshipMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipMembers,
          getReferencedColumn: (t) => t.characterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> eventCharactersRefs<T extends Object>(
    Expression<T> Function($$EventCharactersTableAnnotationComposer a) f,
  ) {
    final $$EventCharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventCharacters,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventCharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.eventCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> chapterCharactersRefs<T extends Object>(
    Expression<T> Function($$ChapterCharactersTableAnnotationComposer a) f,
  ) {
    final $$ChapterCharactersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.chapterCharacters,
          getReferencedColumn: (t) => t.characterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ChapterCharactersTableAnnotationComposer(
                $db: $db,
                $table: $db.chapterCharacters,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> itemsRefs<T extends Object>(
    Expression<T> Function($$ItemsTableAnnotationComposer a) f,
  ) {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.ownerCharacterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> characterSheetsRefs<T extends Object>(
    Expression<T> Function($$CharacterSheetsTableAnnotationComposer a) f,
  ) {
    final $$CharacterSheetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterSheets,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterSheetsTableAnnotationComposer(
            $db: $db,
            $table: $db.characterSheets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> secretsRefs<T extends Object>(
    Expression<T> Function($$SecretsTableAnnotationComposer a) f,
  ) {
    final $$SecretsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.ownerCharacterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableAnnotationComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> secretKnowersRefs<T extends Object>(
    Expression<T> Function($$SecretKnowersTableAnnotationComposer a) f,
  ) {
    final $$SecretKnowersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secretKnowers,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretKnowersTableAnnotationComposer(
            $db: $db,
            $table: $db.secretKnowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (Character, $$CharactersTableReferences),
          Character,
          PrefetchHooks Function({
            bool projectId,
            bool factionId,
            bool relationshipMembersRefs,
            bool eventCharactersRefs,
            bool chapterCharactersRefs,
            bool itemsRefs,
            bool characterSheetsRefs,
            bool secretsRefs,
            bool secretKnowersRefs,
          })
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> aliasNickname = const Value.absent(),
                Value<String?> race = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> factionId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> physicalDescription = const Value.absent(),
                Value<String?> personality = const Value.absent(),
                Value<String?> backstory = const Value.absent(),
                Value<String?> abilities = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> portraitImagePath = const Value.absent(),
                Value<bool> portraitIsDrawing = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                projectId: projectId,
                firstName: firstName,
                lastName: lastName,
                aliasNickname: aliasNickname,
                race: race,
                gender: gender,
                age: age,
                occupation: occupation,
                factionId: factionId,
                status: status,
                physicalDescription: physicalDescription,
                personality: personality,
                backstory: backstory,
                abilities: abilities,
                notes: notes,
                portraitImagePath: portraitImagePath,
                portraitIsDrawing: portraitIsDrawing,
                role: role,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String firstName,
                Value<String?> lastName = const Value.absent(),
                Value<String?> aliasNickname = const Value.absent(),
                Value<String?> race = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> factionId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> physicalDescription = const Value.absent(),
                Value<String?> personality = const Value.absent(),
                Value<String?> backstory = const Value.absent(),
                Value<String?> abilities = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> portraitImagePath = const Value.absent(),
                Value<bool> portraitIsDrawing = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                projectId: projectId,
                firstName: firstName,
                lastName: lastName,
                aliasNickname: aliasNickname,
                race: race,
                gender: gender,
                age: age,
                occupation: occupation,
                factionId: factionId,
                status: status,
                physicalDescription: physicalDescription,
                personality: personality,
                backstory: backstory,
                abilities: abilities,
                notes: notes,
                portraitImagePath: portraitImagePath,
                portraitIsDrawing: portraitIsDrawing,
                role: role,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                factionId = false,
                relationshipMembersRefs = false,
                eventCharactersRefs = false,
                chapterCharactersRefs = false,
                itemsRefs = false,
                characterSheetsRefs = false,
                secretsRefs = false,
                secretKnowersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationshipMembersRefs) db.relationshipMembers,
                    if (eventCharactersRefs) db.eventCharacters,
                    if (chapterCharactersRefs) db.chapterCharacters,
                    if (itemsRefs) db.items,
                    if (characterSheetsRefs) db.characterSheets,
                    if (secretsRefs) db.secrets,
                    if (secretKnowersRefs) db.secretKnowers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$CharactersTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn:
                                        $$CharactersTableReferences
                                            ._projectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (factionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.factionId,
                                    referencedTable: $$CharactersTableReferences
                                        ._factionIdTable(db),
                                    referencedColumn:
                                        $$CharactersTableReferences
                                            ._factionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationshipMembersRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          RelationshipMember
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._relationshipMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventCharactersRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          EventCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._eventCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).eventCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chapterCharactersRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          ChapterCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._chapterCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).chapterCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (itemsRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          Item
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._itemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).itemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerCharacterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (characterSheetsRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          CharacterSheet
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._characterSheetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterSheetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (secretsRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          Secret
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._secretsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).secretsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerCharacterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (secretKnowersRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          SecretKnower
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._secretKnowersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).secretKnowersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, $$CharactersTableReferences),
      Character,
      PrefetchHooks Function({
        bool projectId,
        bool factionId,
        bool relationshipMembersRefs,
        bool eventCharactersRefs,
        bool chapterCharactersRefs,
        bool itemsRefs,
        bool characterSheetsRefs,
        bool secretsRefs,
        bool secretKnowersRefs,
      })
    >;
typedef $$ChaptersTableCreateCompanionBuilder =
    ChaptersCompanion Function({
      required String id,
      required String projectId,
      required String title,
      Value<String?> summary,
      Value<String?> content,
      Value<String?> status,
      Value<DateTime?> sessionDate,
      Value<int?> wordGoal,
      Value<int?> storyYear,
      Value<int> sortIndex,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ChaptersTableUpdateCompanionBuilder =
    ChaptersCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> title,
      Value<String?> summary,
      Value<String?> content,
      Value<String?> status,
      Value<DateTime?> sessionDate,
      Value<int?> wordGoal,
      Value<int?> storyYear,
      Value<int> sortIndex,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ChaptersTableReferences
    extends BaseReferences<_$AppDatabase, $ChaptersTable, Chapter> {
  $$ChaptersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('chapters__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TimelineEventsTable, List<TimelineEvent>>
  _timelineEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timelineEvents,
    aliasName: 'chapters__id__timeline_events__source_chapter_id',
  );

  $$TimelineEventsTableProcessedTableManager get timelineEventsRefs {
    final manager = $$TimelineEventsTableTableManager($_db, $_db.timelineEvents)
        .filter(
          (f) => f.sourceChapterId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_timelineEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChapterCharactersTable, List<ChapterCharacter>>
  _chapterCharactersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.chapterCharacters,
        aliasName: 'chapters__id__chapter_characters__chapter_id',
      );

  $$ChapterCharactersTableProcessedTableManager get chapterCharactersRefs {
    final manager = $$ChapterCharactersTableTableManager(
      $_db,
      $_db.chapterCharacters,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chapterCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ChapterLocationsTable, List<ChapterLocation>>
  _chapterLocationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.chapterLocations,
    aliasName: 'chapters__id__chapter_locations__chapter_id',
  );

  $$ChapterLocationsTableProcessedTableManager get chapterLocationsRefs {
    final manager = $$ChapterLocationsTableTableManager(
      $_db,
      $_db.chapterLocations,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chapterLocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wordGoal => $composableBuilder(
    column: $table.wordGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get storyYear => $composableBuilder(
    column: $table.storyYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> timelineEventsRefs(
    Expression<bool> Function($$TimelineEventsTableFilterComposer f) f,
  ) {
    final $$TimelineEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.sourceChapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableFilterComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chapterCharactersRefs(
    Expression<bool> Function($$ChapterCharactersTableFilterComposer f) f,
  ) {
    final $$ChapterCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterCharacters,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterCharactersTableFilterComposer(
            $db: $db,
            $table: $db.chapterCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> chapterLocationsRefs(
    Expression<bool> Function($$ChapterLocationsTableFilterComposer f) f,
  ) {
    final $$ChapterLocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterLocations,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterLocationsTableFilterComposer(
            $db: $db,
            $table: $db.chapterLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wordGoal => $composableBuilder(
    column: $table.wordGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get storyYear => $composableBuilder(
    column: $table.storyYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wordGoal =>
      $composableBuilder(column: $table.wordGoal, builder: (column) => column);

  GeneratedColumn<int> get storyYear =>
      $composableBuilder(column: $table.storyYear, builder: (column) => column);

  GeneratedColumn<int> get sortIndex =>
      $composableBuilder(column: $table.sortIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> timelineEventsRefs<T extends Object>(
    Expression<T> Function($$TimelineEventsTableAnnotationComposer a) f,
  ) {
    final $$TimelineEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.sourceChapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> chapterCharactersRefs<T extends Object>(
    Expression<T> Function($$ChapterCharactersTableAnnotationComposer a) f,
  ) {
    final $$ChapterCharactersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.chapterCharacters,
          getReferencedColumn: (t) => t.chapterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ChapterCharactersTableAnnotationComposer(
                $db: $db,
                $table: $db.chapterCharacters,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> chapterLocationsRefs<T extends Object>(
    Expression<T> Function($$ChapterLocationsTableAnnotationComposer a) f,
  ) {
    final $$ChapterLocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapterLocations,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChapterLocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.chapterLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChaptersTable,
          Chapter,
          $$ChaptersTableFilterComposer,
          $$ChaptersTableOrderingComposer,
          $$ChaptersTableAnnotationComposer,
          $$ChaptersTableCreateCompanionBuilder,
          $$ChaptersTableUpdateCompanionBuilder,
          (Chapter, $$ChaptersTableReferences),
          Chapter,
          PrefetchHooks Function({
            bool projectId,
            bool timelineEventsRefs,
            bool chapterCharactersRefs,
            bool chapterLocationsRefs,
          })
        > {
  $$ChaptersTableTableManager(_$AppDatabase db, $ChaptersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime?> sessionDate = const Value.absent(),
                Value<int?> wordGoal = const Value.absent(),
                Value<int?> storyYear = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion(
                id: id,
                projectId: projectId,
                title: title,
                summary: summary,
                content: content,
                status: status,
                sessionDate: sessionDate,
                wordGoal: wordGoal,
                storyYear: storyYear,
                sortIndex: sortIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String title,
                Value<String?> summary = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime?> sessionDate = const Value.absent(),
                Value<int?> wordGoal = const Value.absent(),
                Value<int?> storyYear = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion.insert(
                id: id,
                projectId: projectId,
                title: title,
                summary: summary,
                content: content,
                status: status,
                sessionDate: sessionDate,
                wordGoal: wordGoal,
                storyYear: storyYear,
                sortIndex: sortIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChaptersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                timelineEventsRefs = false,
                chapterCharactersRefs = false,
                chapterLocationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timelineEventsRefs) db.timelineEvents,
                    if (chapterCharactersRefs) db.chapterCharacters,
                    if (chapterLocationsRefs) db.chapterLocations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$ChaptersTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn: $$ChaptersTableReferences
                                        ._projectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timelineEventsRefs)
                        await $_getPrefetchedData<
                          Chapter,
                          $ChaptersTable,
                          TimelineEvent
                        >(
                          currentTable: table,
                          referencedTable: $$ChaptersTableReferences
                              ._timelineEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChaptersTableReferences(
                                db,
                                table,
                                p0,
                              ).timelineEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceChapterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chapterCharactersRefs)
                        await $_getPrefetchedData<
                          Chapter,
                          $ChaptersTable,
                          ChapterCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$ChaptersTableReferences
                              ._chapterCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChaptersTableReferences(
                                db,
                                table,
                                p0,
                              ).chapterCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chapterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (chapterLocationsRefs)
                        await $_getPrefetchedData<
                          Chapter,
                          $ChaptersTable,
                          ChapterLocation
                        >(
                          currentTable: table,
                          referencedTable: $$ChaptersTableReferences
                              ._chapterLocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChaptersTableReferences(
                                db,
                                table,
                                p0,
                              ).chapterLocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.chapterId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ChaptersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChaptersTable,
      Chapter,
      $$ChaptersTableFilterComposer,
      $$ChaptersTableOrderingComposer,
      $$ChaptersTableAnnotationComposer,
      $$ChaptersTableCreateCompanionBuilder,
      $$ChaptersTableUpdateCompanionBuilder,
      (Chapter, $$ChaptersTableReferences),
      Chapter,
      PrefetchHooks Function({
        bool projectId,
        bool timelineEventsRefs,
        bool chapterCharactersRefs,
        bool chapterLocationsRefs,
      })
    >;
typedef $$TimelineEventsTableCreateCompanionBuilder =
    TimelineEventsCompanion Function({
      required String id,
      required String projectId,
      required String title,
      Value<String?> fictionalDate,
      Value<String?> description,
      Value<String?> locationId,
      Value<int?> year,
      Value<String?> sourceChapterId,
      Value<int> sortIndex,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$TimelineEventsTableUpdateCompanionBuilder =
    TimelineEventsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> title,
      Value<String?> fictionalDate,
      Value<String?> description,
      Value<String?> locationId,
      Value<int?> year,
      Value<String?> sourceChapterId,
      Value<int> sortIndex,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TimelineEventsTableReferences
    extends BaseReferences<_$AppDatabase, $TimelineEventsTable, TimelineEvent> {
  $$TimelineEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('timeline_events__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsTable _locationIdTable(_$AppDatabase db) =>
      db.locations.createAlias('timeline_events__location_id__locations__id');

  $$LocationsTableProcessedTableManager? get locationId {
    final $_column = $_itemColumn<String>('location_id');
    if ($_column == null) return null;
    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChaptersTable _sourceChapterIdTable(_$AppDatabase db) => db.chapters
      .createAlias('timeline_events__source_chapter_id__chapters__id');

  $$ChaptersTableProcessedTableManager? get sourceChapterId {
    final $_column = $_itemColumn<String>('source_chapter_id');
    if ($_column == null) return null;
    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceChapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EventCharactersTable, List<EventCharacter>>
  _eventCharactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventCharacters,
    aliasName: 'timeline_events__id__event_characters__event_id',
  );

  $$EventCharactersTableProcessedTableManager get eventCharactersRefs {
    final manager = $$EventCharactersTableTableManager(
      $_db,
      $_db.eventCharacters,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventCharactersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TimelineEventsTableFilterComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fictionalDate => $composableBuilder(
    column: $table.fictionalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableFilterComposer get locationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableFilterComposer get sourceChapterId {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> eventCharactersRefs(
    Expression<bool> Function($$EventCharactersTableFilterComposer f) f,
  ) {
    final $$EventCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventCharacters,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventCharactersTableFilterComposer(
            $db: $db,
            $table: $db.eventCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimelineEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fictionalDate => $composableBuilder(
    column: $table.fictionalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableOrderingComposer get locationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableOrderingComposer get sourceChapterId {
    final $$ChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimelineEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimelineEventsTable> {
  $$TimelineEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get fictionalDate => $composableBuilder(
    column: $table.fictionalDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get sortIndex =>
      $composableBuilder(column: $table.sortIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableAnnotationComposer get locationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChaptersTableAnnotationComposer get sourceChapterId {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceChapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> eventCharactersRefs<T extends Object>(
    Expression<T> Function($$EventCharactersTableAnnotationComposer a) f,
  ) {
    final $$EventCharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventCharacters,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventCharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.eventCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimelineEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimelineEventsTable,
          TimelineEvent,
          $$TimelineEventsTableFilterComposer,
          $$TimelineEventsTableOrderingComposer,
          $$TimelineEventsTableAnnotationComposer,
          $$TimelineEventsTableCreateCompanionBuilder,
          $$TimelineEventsTableUpdateCompanionBuilder,
          (TimelineEvent, $$TimelineEventsTableReferences),
          TimelineEvent,
          PrefetchHooks Function({
            bool projectId,
            bool locationId,
            bool sourceChapterId,
            bool eventCharactersRefs,
          })
        > {
  $$TimelineEventsTableTableManager(
    _$AppDatabase db,
    $TimelineEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> fictionalDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> sourceChapterId = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineEventsCompanion(
                id: id,
                projectId: projectId,
                title: title,
                fictionalDate: fictionalDate,
                description: description,
                locationId: locationId,
                year: year,
                sourceChapterId: sourceChapterId,
                sortIndex: sortIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String title,
                Value<String?> fictionalDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> sourceChapterId = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineEventsCompanion.insert(
                id: id,
                projectId: projectId,
                title: title,
                fictionalDate: fictionalDate,
                description: description,
                locationId: locationId,
                year: year,
                sourceChapterId: sourceChapterId,
                sortIndex: sortIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimelineEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                locationId = false,
                sourceChapterId = false,
                eventCharactersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventCharactersRefs) db.eventCharacters,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable:
                                        $$TimelineEventsTableReferences
                                            ._projectIdTable(db),
                                    referencedColumn:
                                        $$TimelineEventsTableReferences
                                            ._projectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (locationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.locationId,
                                    referencedTable:
                                        $$TimelineEventsTableReferences
                                            ._locationIdTable(db),
                                    referencedColumn:
                                        $$TimelineEventsTableReferences
                                            ._locationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sourceChapterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceChapterId,
                                    referencedTable:
                                        $$TimelineEventsTableReferences
                                            ._sourceChapterIdTable(db),
                                    referencedColumn:
                                        $$TimelineEventsTableReferences
                                            ._sourceChapterIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventCharactersRefs)
                        await $_getPrefetchedData<
                          TimelineEvent,
                          $TimelineEventsTable,
                          EventCharacter
                        >(
                          currentTable: table,
                          referencedTable: $$TimelineEventsTableReferences
                              ._eventCharactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimelineEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventCharactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TimelineEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimelineEventsTable,
      TimelineEvent,
      $$TimelineEventsTableFilterComposer,
      $$TimelineEventsTableOrderingComposer,
      $$TimelineEventsTableAnnotationComposer,
      $$TimelineEventsTableCreateCompanionBuilder,
      $$TimelineEventsTableUpdateCompanionBuilder,
      (TimelineEvent, $$TimelineEventsTableReferences),
      TimelineEvent,
      PrefetchHooks Function({
        bool projectId,
        bool locationId,
        bool sourceChapterId,
        bool eventCharactersRefs,
      })
    >;
typedef $$CharacterRelationshipsTableCreateCompanionBuilder =
    CharacterRelationshipsCompanion Function({
      required String id,
      required String projectId,
      required String relationshipType,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$CharacterRelationshipsTableUpdateCompanionBuilder =
    CharacterRelationshipsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> relationshipType,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CharacterRelationshipsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterRelationshipsTable,
          CharacterRelationship
        > {
  $$CharacterRelationshipsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectsTable _projectIdTable(_$AppDatabase db) => db.projects
      .createAlias('character_relationships__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RelationshipMembersTable,
    List<RelationshipMember>
  >
  _relationshipMembersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.relationshipMembers,
    aliasName:
        'character_relationships__id__relationship_members__relationship_id',
  );

  $$RelationshipMembersTableProcessedTableManager get relationshipMembersRefs {
    final manager = $$RelationshipMembersTableTableManager(
      $_db,
      $_db.relationshipMembers,
    ).filter((f) => f.relationshipId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relationshipMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharacterRelationshipsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterRelationshipsTable> {
  $$CharacterRelationshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> relationshipMembersRefs(
    Expression<bool> Function($$RelationshipMembersTableFilterComposer f) f,
  ) {
    final $$RelationshipMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relationshipMembers,
      getReferencedColumn: (t) => t.relationshipId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelationshipMembersTableFilterComposer(
            $db: $db,
            $table: $db.relationshipMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharacterRelationshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterRelationshipsTable> {
  $$CharacterRelationshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterRelationshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterRelationshipsTable> {
  $$CharacterRelationshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get relationshipType => $composableBuilder(
    column: $table.relationshipType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> relationshipMembersRefs<T extends Object>(
    Expression<T> Function($$RelationshipMembersTableAnnotationComposer a) f,
  ) {
    final $$RelationshipMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.relationshipMembers,
          getReferencedColumn: (t) => t.relationshipId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RelationshipMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.relationshipMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CharacterRelationshipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterRelationshipsTable,
          CharacterRelationship,
          $$CharacterRelationshipsTableFilterComposer,
          $$CharacterRelationshipsTableOrderingComposer,
          $$CharacterRelationshipsTableAnnotationComposer,
          $$CharacterRelationshipsTableCreateCompanionBuilder,
          $$CharacterRelationshipsTableUpdateCompanionBuilder,
          (CharacterRelationship, $$CharacterRelationshipsTableReferences),
          CharacterRelationship,
          PrefetchHooks Function({bool projectId, bool relationshipMembersRefs})
        > {
  $$CharacterRelationshipsTableTableManager(
    _$AppDatabase db,
    $CharacterRelationshipsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterRelationshipsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CharacterRelationshipsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CharacterRelationshipsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> relationshipType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterRelationshipsCompanion(
                id: id,
                projectId: projectId,
                relationshipType: relationshipType,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String relationshipType,
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterRelationshipsCompanion.insert(
                id: id,
                projectId: projectId,
                relationshipType: relationshipType,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterRelationshipsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({projectId = false, relationshipMembersRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (relationshipMembersRefs) db.relationshipMembers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable:
                                        $$CharacterRelationshipsTableReferences
                                            ._projectIdTable(db),
                                    referencedColumn:
                                        $$CharacterRelationshipsTableReferences
                                            ._projectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (relationshipMembersRefs)
                        await $_getPrefetchedData<
                          CharacterRelationship,
                          $CharacterRelationshipsTable,
                          RelationshipMember
                        >(
                          currentTable: table,
                          referencedTable:
                              $$CharacterRelationshipsTableReferences
                                  ._relationshipMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharacterRelationshipsTableReferences(
                                db,
                                table,
                                p0,
                              ).relationshipMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relationshipId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CharacterRelationshipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterRelationshipsTable,
      CharacterRelationship,
      $$CharacterRelationshipsTableFilterComposer,
      $$CharacterRelationshipsTableOrderingComposer,
      $$CharacterRelationshipsTableAnnotationComposer,
      $$CharacterRelationshipsTableCreateCompanionBuilder,
      $$CharacterRelationshipsTableUpdateCompanionBuilder,
      (CharacterRelationship, $$CharacterRelationshipsTableReferences),
      CharacterRelationship,
      PrefetchHooks Function({bool projectId, bool relationshipMembersRefs})
    >;
typedef $$RelationshipMembersTableCreateCompanionBuilder =
    RelationshipMembersCompanion Function({
      required String relationshipId,
      required String characterId,
      Value<String?> role,
      Value<int> rowid,
    });
typedef $$RelationshipMembersTableUpdateCompanionBuilder =
    RelationshipMembersCompanion Function({
      Value<String> relationshipId,
      Value<String> characterId,
      Value<String?> role,
      Value<int> rowid,
    });

final class $$RelationshipMembersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RelationshipMembersTable,
          RelationshipMember
        > {
  $$RelationshipMembersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharacterRelationshipsTable _relationshipIdTable(_$AppDatabase db) =>
      db.characterRelationships.createAlias(
        'relationship_members__relationship_id__character_relationships__id',
      );

  $$CharacterRelationshipsTableProcessedTableManager get relationshipId {
    final $_column = $_itemColumn<String>('relationship_id')!;

    final manager = $$CharacterRelationshipsTableTableManager(
      $_db,
      $_db.characterRelationships,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relationshipIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _characterIdTable(_$AppDatabase db) => db.characters
      .createAlias('relationship_members__character_id__characters__id');

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelationshipMembersTableFilterComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  $$CharacterRelationshipsTableFilterComposer get relationshipId {
    final $$CharacterRelationshipsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relationshipId,
          referencedTable: $db.characterRelationships,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterRelationshipsTableFilterComposer(
                $db: $db,
                $table: $db.characterRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharacterRelationshipsTableOrderingComposer get relationshipId {
    final $$CharacterRelationshipsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relationshipId,
          referencedTable: $db.characterRelationships,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterRelationshipsTableOrderingComposer(
                $db: $db,
                $table: $db.characterRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationshipMembersTable> {
  $$RelationshipMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  $$CharacterRelationshipsTableAnnotationComposer get relationshipId {
    final $$CharacterRelationshipsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.relationshipId,
          referencedTable: $db.characterRelationships,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterRelationshipsTableAnnotationComposer(
                $db: $db,
                $table: $db.characterRelationships,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelationshipMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationshipMembersTable,
          RelationshipMember,
          $$RelationshipMembersTableFilterComposer,
          $$RelationshipMembersTableOrderingComposer,
          $$RelationshipMembersTableAnnotationComposer,
          $$RelationshipMembersTableCreateCompanionBuilder,
          $$RelationshipMembersTableUpdateCompanionBuilder,
          (RelationshipMember, $$RelationshipMembersTableReferences),
          RelationshipMember,
          PrefetchHooks Function({bool relationshipId, bool characterId})
        > {
  $$RelationshipMembersTableTableManager(
    _$AppDatabase db,
    $RelationshipMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationshipMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationshipMembersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RelationshipMembersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> relationshipId = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationshipMembersCompanion(
                relationshipId: relationshipId,
                characterId: characterId,
                role: role,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String relationshipId,
                required String characterId,
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationshipMembersCompanion.insert(
                relationshipId: relationshipId,
                characterId: characterId,
                role: role,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelationshipMembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({relationshipId = false, characterId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (relationshipId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.relationshipId,
                                    referencedTable:
                                        $$RelationshipMembersTableReferences
                                            ._relationshipIdTable(db),
                                    referencedColumn:
                                        $$RelationshipMembersTableReferences
                                            ._relationshipIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (characterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.characterId,
                                    referencedTable:
                                        $$RelationshipMembersTableReferences
                                            ._characterIdTable(db),
                                    referencedColumn:
                                        $$RelationshipMembersTableReferences
                                            ._characterIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$RelationshipMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationshipMembersTable,
      RelationshipMember,
      $$RelationshipMembersTableFilterComposer,
      $$RelationshipMembersTableOrderingComposer,
      $$RelationshipMembersTableAnnotationComposer,
      $$RelationshipMembersTableCreateCompanionBuilder,
      $$RelationshipMembersTableUpdateCompanionBuilder,
      (RelationshipMember, $$RelationshipMembersTableReferences),
      RelationshipMember,
      PrefetchHooks Function({bool relationshipId, bool characterId})
    >;
typedef $$EventCharactersTableCreateCompanionBuilder =
    EventCharactersCompanion Function({
      required String eventId,
      required String characterId,
      Value<int> rowid,
    });
typedef $$EventCharactersTableUpdateCompanionBuilder =
    EventCharactersCompanion Function({
      Value<String> eventId,
      Value<String> characterId,
      Value<int> rowid,
    });

final class $$EventCharactersTableReferences
    extends
        BaseReferences<_$AppDatabase, $EventCharactersTable, EventCharacter> {
  $$EventCharactersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TimelineEventsTable _eventIdTable(_$AppDatabase db) => db
      .timelineEvents
      .createAlias('event_characters__event_id__timeline_events__id');

  $$TimelineEventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$TimelineEventsTableTableManager(
      $_db,
      $_db.timelineEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _characterIdTable(_$AppDatabase db) => db.characters
      .createAlias('event_characters__character_id__characters__id');

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $EventCharactersTable> {
  $$EventCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TimelineEventsTableFilterComposer get eventId {
    final $$TimelineEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableFilterComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $EventCharactersTable> {
  $$EventCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TimelineEventsTableOrderingComposer get eventId {
    final $$TimelineEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableOrderingComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventCharactersTable> {
  $$EventCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TimelineEventsTableAnnotationComposer get eventId {
    final $$TimelineEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.timelineEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimelineEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.timelineEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventCharactersTable,
          EventCharacter,
          $$EventCharactersTableFilterComposer,
          $$EventCharactersTableOrderingComposer,
          $$EventCharactersTableAnnotationComposer,
          $$EventCharactersTableCreateCompanionBuilder,
          $$EventCharactersTableUpdateCompanionBuilder,
          (EventCharacter, $$EventCharactersTableReferences),
          EventCharacter,
          PrefetchHooks Function({bool eventId, bool characterId})
        > {
  $$EventCharactersTableTableManager(
    _$AppDatabase db,
    $EventCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventCharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventCharactersCompanion(
                eventId: eventId,
                characterId: characterId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String characterId,
                Value<int> rowid = const Value.absent(),
              }) => EventCharactersCompanion.insert(
                eventId: eventId,
                characterId: characterId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventCharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false, characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$EventCharactersTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventCharactersTableReferences
                                        ._eventIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable:
                                    $$EventCharactersTableReferences
                                        ._characterIdTable(db),
                                referencedColumn:
                                    $$EventCharactersTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventCharactersTable,
      EventCharacter,
      $$EventCharactersTableFilterComposer,
      $$EventCharactersTableOrderingComposer,
      $$EventCharactersTableAnnotationComposer,
      $$EventCharactersTableCreateCompanionBuilder,
      $$EventCharactersTableUpdateCompanionBuilder,
      (EventCharacter, $$EventCharactersTableReferences),
      EventCharacter,
      PrefetchHooks Function({bool eventId, bool characterId})
    >;
typedef $$ChapterCharactersTableCreateCompanionBuilder =
    ChapterCharactersCompanion Function({
      required String chapterId,
      required String characterId,
      Value<int> rowid,
    });
typedef $$ChapterCharactersTableUpdateCompanionBuilder =
    ChapterCharactersCompanion Function({
      Value<String> chapterId,
      Value<String> characterId,
      Value<int> rowid,
    });

final class $$ChapterCharactersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChapterCharactersTable,
          ChapterCharacter
        > {
  $$ChapterCharactersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChaptersTable _chapterIdTable(_$AppDatabase db) =>
      db.chapters.createAlias('chapter_characters__chapter_id__chapters__id');

  $$ChaptersTableProcessedTableManager get chapterId {
    final $_column = $_itemColumn<String>('chapter_id')!;

    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _characterIdTable(_$AppDatabase db) => db.characters
      .createAlias('chapter_characters__character_id__characters__id');

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChapterCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $ChapterCharactersTable> {
  $$ChapterCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableFilterComposer get chapterId {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $ChapterCharactersTable> {
  $$ChapterCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableOrderingComposer get chapterId {
    final $$ChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChapterCharactersTable> {
  $$ChapterCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableAnnotationComposer get chapterId {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChapterCharactersTable,
          ChapterCharacter,
          $$ChapterCharactersTableFilterComposer,
          $$ChapterCharactersTableOrderingComposer,
          $$ChapterCharactersTableAnnotationComposer,
          $$ChapterCharactersTableCreateCompanionBuilder,
          $$ChapterCharactersTableUpdateCompanionBuilder,
          (ChapterCharacter, $$ChapterCharactersTableReferences),
          ChapterCharacter,
          PrefetchHooks Function({bool chapterId, bool characterId})
        > {
  $$ChapterCharactersTableTableManager(
    _$AppDatabase db,
    $ChapterCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChapterCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChapterCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChapterCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> chapterId = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChapterCharactersCompanion(
                chapterId: chapterId,
                characterId: characterId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String chapterId,
                required String characterId,
                Value<int> rowid = const Value.absent(),
              }) => ChapterCharactersCompanion.insert(
                chapterId: chapterId,
                characterId: characterId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChapterCharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chapterId = false, characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (chapterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.chapterId,
                                referencedTable:
                                    $$ChapterCharactersTableReferences
                                        ._chapterIdTable(db),
                                referencedColumn:
                                    $$ChapterCharactersTableReferences
                                        ._chapterIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable:
                                    $$ChapterCharactersTableReferences
                                        ._characterIdTable(db),
                                referencedColumn:
                                    $$ChapterCharactersTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChapterCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChapterCharactersTable,
      ChapterCharacter,
      $$ChapterCharactersTableFilterComposer,
      $$ChapterCharactersTableOrderingComposer,
      $$ChapterCharactersTableAnnotationComposer,
      $$ChapterCharactersTableCreateCompanionBuilder,
      $$ChapterCharactersTableUpdateCompanionBuilder,
      (ChapterCharacter, $$ChapterCharactersTableReferences),
      ChapterCharacter,
      PrefetchHooks Function({bool chapterId, bool characterId})
    >;
typedef $$ChapterLocationsTableCreateCompanionBuilder =
    ChapterLocationsCompanion Function({
      required String chapterId,
      required String locationId,
      Value<int> rowid,
    });
typedef $$ChapterLocationsTableUpdateCompanionBuilder =
    ChapterLocationsCompanion Function({
      Value<String> chapterId,
      Value<String> locationId,
      Value<int> rowid,
    });

final class $$ChapterLocationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ChapterLocationsTable, ChapterLocation> {
  $$ChapterLocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChaptersTable _chapterIdTable(_$AppDatabase db) =>
      db.chapters.createAlias('chapter_locations__chapter_id__chapters__id');

  $$ChaptersTableProcessedTableManager get chapterId {
    final $_column = $_itemColumn<String>('chapter_id')!;

    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsTable _locationIdTable(_$AppDatabase db) =>
      db.locations.createAlias('chapter_locations__location_id__locations__id');

  $$LocationsTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<String>('location_id')!;

    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChapterLocationsTableFilterComposer
    extends Composer<_$AppDatabase, $ChapterLocationsTable> {
  $$ChapterLocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableFilterComposer get chapterId {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableFilterComposer get locationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterLocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChapterLocationsTable> {
  $$ChapterLocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableOrderingComposer get chapterId {
    final $$ChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableOrderingComposer get locationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterLocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChapterLocationsTable> {
  $$ChapterLocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChaptersTableAnnotationComposer get chapterId {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableAnnotationComposer get locationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChapterLocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChapterLocationsTable,
          ChapterLocation,
          $$ChapterLocationsTableFilterComposer,
          $$ChapterLocationsTableOrderingComposer,
          $$ChapterLocationsTableAnnotationComposer,
          $$ChapterLocationsTableCreateCompanionBuilder,
          $$ChapterLocationsTableUpdateCompanionBuilder,
          (ChapterLocation, $$ChapterLocationsTableReferences),
          ChapterLocation,
          PrefetchHooks Function({bool chapterId, bool locationId})
        > {
  $$ChapterLocationsTableTableManager(
    _$AppDatabase db,
    $ChapterLocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChapterLocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChapterLocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChapterLocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> chapterId = const Value.absent(),
                Value<String> locationId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChapterLocationsCompanion(
                chapterId: chapterId,
                locationId: locationId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String chapterId,
                required String locationId,
                Value<int> rowid = const Value.absent(),
              }) => ChapterLocationsCompanion.insert(
                chapterId: chapterId,
                locationId: locationId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChapterLocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chapterId = false, locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (chapterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.chapterId,
                                referencedTable:
                                    $$ChapterLocationsTableReferences
                                        ._chapterIdTable(db),
                                referencedColumn:
                                    $$ChapterLocationsTableReferences
                                        ._chapterIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (locationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.locationId,
                                referencedTable:
                                    $$ChapterLocationsTableReferences
                                        ._locationIdTable(db),
                                referencedColumn:
                                    $$ChapterLocationsTableReferences
                                        ._locationIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChapterLocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChapterLocationsTable,
      ChapterLocation,
      $$ChapterLocationsTableFilterComposer,
      $$ChapterLocationsTableOrderingComposer,
      $$ChapterLocationsTableAnnotationComposer,
      $$ChapterLocationsTableCreateCompanionBuilder,
      $$ChapterLocationsTableUpdateCompanionBuilder,
      (ChapterLocation, $$ChapterLocationsTableReferences),
      ChapterLocation,
      PrefetchHooks Function({bool chapterId, bool locationId})
    >;
typedef $$NotesTableCreateCompanionBuilder =
    NotesCompanion Function({
      required String id,
      required String projectId,
      required String title,
      Value<String?> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$NotesTableUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> title,
      Value<String?> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$NotesTableReferences
    extends BaseReferences<_$AppDatabase, $NotesTable, Note> {
  $$NotesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('notes__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          Note,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (Note, $$NotesTableReferences),
          Note,
          PrefetchHooks Function({bool projectId})
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                projectId: projectId,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String title,
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                projectId: projectId,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$NotesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$NotesTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$NotesTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      Note,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (Note, $$NotesTableReferences),
      Note,
      PrefetchHooks Function({bool projectId})
    >;
typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> powers,
      Value<String?> origin,
      Value<String?> ownerCharacterId,
      Value<String?> locationId,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> type,
      Value<String?> description,
      Value<String?> powers,
      Value<String?> origin,
      Value<String?> ownerCharacterId,
      Value<String?> locationId,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ItemsTable, Item> {
  $$ItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('items__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _ownerCharacterIdTable(_$AppDatabase db) =>
      db.characters.createAlias('items__owner_character_id__characters__id');

  $$CharactersTableProcessedTableManager? get ownerCharacterId {
    final $_column = $_itemColumn<String>('owner_character_id');
    if ($_column == null) return null;
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerCharacterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsTable _locationIdTable(_$AppDatabase db) =>
      db.locations.createAlias('items__location_id__locations__id');

  $$LocationsTableProcessedTableManager? get locationId {
    final $_column = $_itemColumn<String>('location_id');
    if ($_column == null) return null;
    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get powers => $composableBuilder(
    column: $table.powers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get ownerCharacterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableFilterComposer get locationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get powers => $composableBuilder(
    column: $table.powers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get ownerCharacterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableOrderingComposer get locationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get powers =>
      $composableBuilder(column: $table.powers, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get ownerCharacterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableAnnotationComposer get locationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          Item,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (Item, $$ItemsTableReferences),
          Item,
          PrefetchHooks Function({
            bool projectId,
            bool ownerCharacterId,
            bool locationId,
          })
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> powers = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> ownerCharacterId = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                description: description,
                powers: powers,
                origin: origin,
                ownerCharacterId: ownerCharacterId,
                locationId: locationId,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> powers = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> ownerCharacterId = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                description: description,
                powers: powers,
                origin: origin,
                ownerCharacterId: ownerCharacterId,
                locationId: locationId,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ItemsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                ownerCharacterId = false,
                locationId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$ItemsTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn: $$ItemsTableReferences
                                        ._projectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (ownerCharacterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerCharacterId,
                                    referencedTable: $$ItemsTableReferences
                                        ._ownerCharacterIdTable(db),
                                    referencedColumn: $$ItemsTableReferences
                                        ._ownerCharacterIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (locationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.locationId,
                                    referencedTable: $$ItemsTableReferences
                                        ._locationIdTable(db),
                                    referencedColumn: $$ItemsTableReferences
                                        ._locationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      Item,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (Item, $$ItemsTableReferences),
      Item,
      PrefetchHooks Function({
        bool projectId,
        bool ownerCharacterId,
        bool locationId,
      })
    >;
typedef $$MagicSystemsTableCreateCompanionBuilder =
    MagicSystemsCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> description,
      Value<String?> source,
      Value<String?> rules,
      Value<String?> limitations,
      Value<String?> cost,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$MagicSystemsTableUpdateCompanionBuilder =
    MagicSystemsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> description,
      Value<String?> source,
      Value<String?> rules,
      Value<String?> limitations,
      Value<String?> cost,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MagicSystemsTableReferences
    extends BaseReferences<_$AppDatabase, $MagicSystemsTable, MagicSystem> {
  $$MagicSystemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('magic_systems__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MagicSystemsTableFilterComposer
    extends Composer<_$AppDatabase, $MagicSystemsTable> {
  $$MagicSystemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rules => $composableBuilder(
    column: $table.rules,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get limitations => $composableBuilder(
    column: $table.limitations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MagicSystemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MagicSystemsTable> {
  $$MagicSystemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rules => $composableBuilder(
    column: $table.rules,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get limitations => $composableBuilder(
    column: $table.limitations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MagicSystemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MagicSystemsTable> {
  $$MagicSystemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get rules =>
      $composableBuilder(column: $table.rules, builder: (column) => column);

  GeneratedColumn<String> get limitations => $composableBuilder(
    column: $table.limitations,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MagicSystemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MagicSystemsTable,
          MagicSystem,
          $$MagicSystemsTableFilterComposer,
          $$MagicSystemsTableOrderingComposer,
          $$MagicSystemsTableAnnotationComposer,
          $$MagicSystemsTableCreateCompanionBuilder,
          $$MagicSystemsTableUpdateCompanionBuilder,
          (MagicSystem, $$MagicSystemsTableReferences),
          MagicSystem,
          PrefetchHooks Function({bool projectId})
        > {
  $$MagicSystemsTableTableManager(_$AppDatabase db, $MagicSystemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MagicSystemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MagicSystemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MagicSystemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String?> rules = const Value.absent(),
                Value<String?> limitations = const Value.absent(),
                Value<String?> cost = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MagicSystemsCompanion(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                source: source,
                rules: rules,
                limitations: limitations,
                cost: cost,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String?> rules = const Value.absent(),
                Value<String?> limitations = const Value.absent(),
                Value<String?> cost = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MagicSystemsCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                source: source,
                rules: rules,
                limitations: limitations,
                cost: cost,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MagicSystemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$MagicSystemsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$MagicSystemsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MagicSystemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MagicSystemsTable,
      MagicSystem,
      $$MagicSystemsTableFilterComposer,
      $$MagicSystemsTableOrderingComposer,
      $$MagicSystemsTableAnnotationComposer,
      $$MagicSystemsTableCreateCompanionBuilder,
      $$MagicSystemsTableUpdateCompanionBuilder,
      (MagicSystem, $$MagicSystemsTableReferences),
      MagicSystem,
      PrefetchHooks Function({bool projectId})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<int?> color,
      Value<int> rowid,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<int?> color,
      Value<int> rowid,
    });

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('tags__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TagLinksTable, List<TagLink>> _tagLinksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tagLinks,
    aliasName: 'tags__id__tag_links__tag_id',
  );

  $$TagLinksTableProcessedTableManager get tagLinksRefs {
    final manager = $$TagLinksTableTableManager(
      $_db,
      $_db.tagLinks,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tagLinksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tagLinksRefs(
    Expression<bool> Function($$TagLinksTableFilterComposer f) f,
  ) {
    final $$TagLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagLinks,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagLinksTableFilterComposer(
            $db: $db,
            $table: $db.tagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tagLinksRefs<T extends Object>(
    Expression<T> Function($$TagLinksTableAnnotationComposer a) f,
  ) {
    final $$TagLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tagLinks,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.tagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool projectId, bool tagLinksRefs})
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                projectId: projectId,
                name: name,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<int?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false, tagLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tagLinksRefs) db.tagLinks],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$TagsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$TagsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tagLinksRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, TagLink>(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences._tagLinksRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).tagLinksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool projectId, bool tagLinksRefs})
    >;
typedef $$TagLinksTableCreateCompanionBuilder =
    TagLinksCompanion Function({
      required String tagId,
      required String entityType,
      required String entityId,
      Value<int> rowid,
    });
typedef $$TagLinksTableUpdateCompanionBuilder =
    TagLinksCompanion Function({
      Value<String> tagId,
      Value<String> entityType,
      Value<String> entityId,
      Value<int> rowid,
    });

final class $$TagLinksTableReferences
    extends BaseReferences<_$AppDatabase, $TagLinksTable, TagLink> {
  $$TagLinksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TagsTable _tagIdTable(_$AppDatabase db) =>
      db.tags.createAlias('tag_links__tag_id__tags__id');

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TagLinksTableFilterComposer
    extends Composer<_$AppDatabase, $TagLinksTable> {
  $$TagLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $TagLinksTable> {
  $$TagLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagLinksTable> {
  $$TagLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TagLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagLinksTable,
          TagLink,
          $$TagLinksTableFilterComposer,
          $$TagLinksTableOrderingComposer,
          $$TagLinksTableAnnotationComposer,
          $$TagLinksTableCreateCompanionBuilder,
          $$TagLinksTableUpdateCompanionBuilder,
          (TagLink, $$TagLinksTableReferences),
          TagLink,
          PrefetchHooks Function({bool tagId})
        > {
  $$TagLinksTableTableManager(_$AppDatabase db, $TagLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> tagId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagLinksCompanion(
                tagId: tagId,
                entityType: entityType,
                entityId: entityId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tagId,
                required String entityType,
                required String entityId,
                Value<int> rowid = const Value.absent(),
              }) => TagLinksCompanion.insert(
                tagId: tagId,
                entityType: entityType,
                entityId: entityId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TagLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$TagLinksTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$TagLinksTableReferences
                                    ._tagIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TagLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagLinksTable,
      TagLink,
      $$TagLinksTableFilterComposer,
      $$TagLinksTableOrderingComposer,
      $$TagLinksTableAnnotationComposer,
      $$TagLinksTableCreateCompanionBuilder,
      $$TagLinksTableUpdateCompanionBuilder,
      (TagLink, $$TagLinksTableReferences),
      TagLink,
      PrefetchHooks Function({bool tagId})
    >;
typedef $$CharacterSheetsTableCreateCompanionBuilder =
    CharacterSheetsCompanion Function({
      required String characterId,
      Value<String?> className,
      Value<int?> level,
      Value<int?> strength,
      Value<int?> dexterity,
      Value<int?> constitution,
      Value<int?> intelligence,
      Value<int?> wisdom,
      Value<int?> charisma,
      Value<int?> maxHitPoints,
      Value<int?> currentHitPoints,
      Value<int?> armorClass,
      Value<int?> speed,
      Value<String?> alignment,
      Value<String?> background,
      Value<String?> savingThrowProficiencies,
      Value<String?> skillProficiencies,
      Value<String?> features,
      Value<String?> equipment,
      Value<int> rowid,
    });
typedef $$CharacterSheetsTableUpdateCompanionBuilder =
    CharacterSheetsCompanion Function({
      Value<String> characterId,
      Value<String?> className,
      Value<int?> level,
      Value<int?> strength,
      Value<int?> dexterity,
      Value<int?> constitution,
      Value<int?> intelligence,
      Value<int?> wisdom,
      Value<int?> charisma,
      Value<int?> maxHitPoints,
      Value<int?> currentHitPoints,
      Value<int?> armorClass,
      Value<int?> speed,
      Value<String?> alignment,
      Value<String?> background,
      Value<String?> savingThrowProficiencies,
      Value<String?> skillProficiencies,
      Value<String?> features,
      Value<String?> equipment,
      Value<int> rowid,
    });

final class $$CharacterSheetsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CharacterSheetsTable, CharacterSheet> {
  $$CharacterSheetsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) => db.characters
      .createAlias('character_sheets__character_id__characters__id');

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterSheetsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterSheetsTable> {
  $$CharacterSheetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dexterity => $composableBuilder(
    column: $table.dexterity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get constitution => $composableBuilder(
    column: $table.constitution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get charisma => $composableBuilder(
    column: $table.charisma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHitPoints => $composableBuilder(
    column: $table.maxHitPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentHitPoints => $composableBuilder(
    column: $table.currentHitPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alignment => $composableBuilder(
    column: $table.alignment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savingThrowProficiencies => $composableBuilder(
    column: $table.savingThrowProficiencies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skillProficiencies => $composableBuilder(
    column: $table.skillProficiencies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get features => $composableBuilder(
    column: $table.features,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSheetsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterSheetsTable> {
  $$CharacterSheetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dexterity => $composableBuilder(
    column: $table.dexterity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get constitution => $composableBuilder(
    column: $table.constitution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get charisma => $composableBuilder(
    column: $table.charisma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHitPoints => $composableBuilder(
    column: $table.maxHitPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentHitPoints => $composableBuilder(
    column: $table.currentHitPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alignment => $composableBuilder(
    column: $table.alignment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savingThrowProficiencies => $composableBuilder(
    column: $table.savingThrowProficiencies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skillProficiencies => $composableBuilder(
    column: $table.skillProficiencies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get features => $composableBuilder(
    column: $table.features,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSheetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterSheetsTable> {
  $$CharacterSheetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get className =>
      $composableBuilder(column: $table.className, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<int> get dexterity =>
      $composableBuilder(column: $table.dexterity, builder: (column) => column);

  GeneratedColumn<int> get constitution => $composableBuilder(
    column: $table.constitution,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wisdom =>
      $composableBuilder(column: $table.wisdom, builder: (column) => column);

  GeneratedColumn<int> get charisma =>
      $composableBuilder(column: $table.charisma, builder: (column) => column);

  GeneratedColumn<int> get maxHitPoints => $composableBuilder(
    column: $table.maxHitPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentHitPoints => $composableBuilder(
    column: $table.currentHitPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get armorClass => $composableBuilder(
    column: $table.armorClass,
    builder: (column) => column,
  );

  GeneratedColumn<int> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<String> get alignment =>
      $composableBuilder(column: $table.alignment, builder: (column) => column);

  GeneratedColumn<String> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => column,
  );

  GeneratedColumn<String> get savingThrowProficiencies => $composableBuilder(
    column: $table.savingThrowProficiencies,
    builder: (column) => column,
  );

  GeneratedColumn<String> get skillProficiencies => $composableBuilder(
    column: $table.skillProficiencies,
    builder: (column) => column,
  );

  GeneratedColumn<String> get features =>
      $composableBuilder(column: $table.features, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterSheetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterSheetsTable,
          CharacterSheet,
          $$CharacterSheetsTableFilterComposer,
          $$CharacterSheetsTableOrderingComposer,
          $$CharacterSheetsTableAnnotationComposer,
          $$CharacterSheetsTableCreateCompanionBuilder,
          $$CharacterSheetsTableUpdateCompanionBuilder,
          (CharacterSheet, $$CharacterSheetsTableReferences),
          CharacterSheet,
          PrefetchHooks Function({bool characterId})
        > {
  $$CharacterSheetsTableTableManager(
    _$AppDatabase db,
    $CharacterSheetsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterSheetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterSheetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterSheetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String?> className = const Value.absent(),
                Value<int?> level = const Value.absent(),
                Value<int?> strength = const Value.absent(),
                Value<int?> dexterity = const Value.absent(),
                Value<int?> constitution = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> wisdom = const Value.absent(),
                Value<int?> charisma = const Value.absent(),
                Value<int?> maxHitPoints = const Value.absent(),
                Value<int?> currentHitPoints = const Value.absent(),
                Value<int?> armorClass = const Value.absent(),
                Value<int?> speed = const Value.absent(),
                Value<String?> alignment = const Value.absent(),
                Value<String?> background = const Value.absent(),
                Value<String?> savingThrowProficiencies = const Value.absent(),
                Value<String?> skillProficiencies = const Value.absent(),
                Value<String?> features = const Value.absent(),
                Value<String?> equipment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterSheetsCompanion(
                characterId: characterId,
                className: className,
                level: level,
                strength: strength,
                dexterity: dexterity,
                constitution: constitution,
                intelligence: intelligence,
                wisdom: wisdom,
                charisma: charisma,
                maxHitPoints: maxHitPoints,
                currentHitPoints: currentHitPoints,
                armorClass: armorClass,
                speed: speed,
                alignment: alignment,
                background: background,
                savingThrowProficiencies: savingThrowProficiencies,
                skillProficiencies: skillProficiencies,
                features: features,
                equipment: equipment,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                Value<String?> className = const Value.absent(),
                Value<int?> level = const Value.absent(),
                Value<int?> strength = const Value.absent(),
                Value<int?> dexterity = const Value.absent(),
                Value<int?> constitution = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> wisdom = const Value.absent(),
                Value<int?> charisma = const Value.absent(),
                Value<int?> maxHitPoints = const Value.absent(),
                Value<int?> currentHitPoints = const Value.absent(),
                Value<int?> armorClass = const Value.absent(),
                Value<int?> speed = const Value.absent(),
                Value<String?> alignment = const Value.absent(),
                Value<String?> background = const Value.absent(),
                Value<String?> savingThrowProficiencies = const Value.absent(),
                Value<String?> skillProficiencies = const Value.absent(),
                Value<String?> features = const Value.absent(),
                Value<String?> equipment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterSheetsCompanion.insert(
                characterId: characterId,
                className: className,
                level: level,
                strength: strength,
                dexterity: dexterity,
                constitution: constitution,
                intelligence: intelligence,
                wisdom: wisdom,
                charisma: charisma,
                maxHitPoints: maxHitPoints,
                currentHitPoints: currentHitPoints,
                armorClass: armorClass,
                speed: speed,
                alignment: alignment,
                background: background,
                savingThrowProficiencies: savingThrowProficiencies,
                skillProficiencies: skillProficiencies,
                features: features,
                equipment: equipment,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterSheetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable:
                                    $$CharacterSheetsTableReferences
                                        ._characterIdTable(db),
                                referencedColumn:
                                    $$CharacterSheetsTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CharacterSheetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterSheetsTable,
      CharacterSheet,
      $$CharacterSheetsTableFilterComposer,
      $$CharacterSheetsTableOrderingComposer,
      $$CharacterSheetsTableAnnotationComposer,
      $$CharacterSheetsTableCreateCompanionBuilder,
      $$CharacterSheetsTableUpdateCompanionBuilder,
      (CharacterSheet, $$CharacterSheetsTableReferences),
      CharacterSheet,
      PrefetchHooks Function({bool characterId})
    >;
typedef $$FamilyLinksTableCreateCompanionBuilder =
    FamilyLinksCompanion Function({
      required String parentId,
      required String childId,
      Value<int> rowid,
    });
typedef $$FamilyLinksTableUpdateCompanionBuilder =
    FamilyLinksCompanion Function({
      Value<String> parentId,
      Value<String> childId,
      Value<int> rowid,
    });

final class $$FamilyLinksTableReferences
    extends BaseReferences<_$AppDatabase, $FamilyLinksTable, FamilyLink> {
  $$FamilyLinksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _parentIdTable(_$AppDatabase db) =>
      db.characters.createAlias('family_links__parent_id__characters__id');

  $$CharactersTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<String>('parent_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _childIdTable(_$AppDatabase db) =>
      db.characters.createAlias('family_links__child_id__characters__id');

  $$CharactersTableProcessedTableManager get childId {
    final $_column = $_itemColumn<String>('child_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FamilyLinksTableFilterComposer
    extends Composer<_$AppDatabase, $FamilyLinksTable> {
  $$FamilyLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableFilterComposer get parentId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get childId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FamilyLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $FamilyLinksTable> {
  $$FamilyLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableOrderingComposer get parentId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get childId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FamilyLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $FamilyLinksTable> {
  $$FamilyLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CharactersTableAnnotationComposer get parentId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get childId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FamilyLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FamilyLinksTable,
          FamilyLink,
          $$FamilyLinksTableFilterComposer,
          $$FamilyLinksTableOrderingComposer,
          $$FamilyLinksTableAnnotationComposer,
          $$FamilyLinksTableCreateCompanionBuilder,
          $$FamilyLinksTableUpdateCompanionBuilder,
          (FamilyLink, $$FamilyLinksTableReferences),
          FamilyLink,
          PrefetchHooks Function({bool parentId, bool childId})
        > {
  $$FamilyLinksTableTableManager(_$AppDatabase db, $FamilyLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FamilyLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FamilyLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FamilyLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> parentId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamilyLinksCompanion(
                parentId: parentId,
                childId: childId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String parentId,
                required String childId,
                Value<int> rowid = const Value.absent(),
              }) => FamilyLinksCompanion.insert(
                parentId: parentId,
                childId: childId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FamilyLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parentId = false, childId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parentId,
                                referencedTable: $$FamilyLinksTableReferences
                                    ._parentIdTable(db),
                                referencedColumn: $$FamilyLinksTableReferences
                                    ._parentIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (childId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.childId,
                                referencedTable: $$FamilyLinksTableReferences
                                    ._childIdTable(db),
                                referencedColumn: $$FamilyLinksTableReferences
                                    ._childIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FamilyLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FamilyLinksTable,
      FamilyLink,
      $$FamilyLinksTableFilterComposer,
      $$FamilyLinksTableOrderingComposer,
      $$FamilyLinksTableAnnotationComposer,
      $$FamilyLinksTableCreateCompanionBuilder,
      $$FamilyLinksTableUpdateCompanionBuilder,
      (FamilyLink, $$FamilyLinksTableReferences),
      FamilyLink,
      PrefetchHooks Function({bool parentId, bool childId})
    >;
typedef $$SecretsTableCreateCompanionBuilder =
    SecretsCompanion Function({
      required String id,
      required String projectId,
      required String title,
      Value<String?> description,
      Value<String?> ownerCharacterId,
      Value<String?> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SecretsTableUpdateCompanionBuilder =
    SecretsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> title,
      Value<String?> description,
      Value<String?> ownerCharacterId,
      Value<String?> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SecretsTableReferences
    extends BaseReferences<_$AppDatabase, $SecretsTable, Secret> {
  $$SecretsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('secrets__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _ownerCharacterIdTable(_$AppDatabase db) =>
      db.characters.createAlias('secrets__owner_character_id__characters__id');

  $$CharactersTableProcessedTableManager? get ownerCharacterId {
    final $_column = $_itemColumn<String>('owner_character_id');
    if ($_column == null) return null;
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerCharacterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SecretKnowersTable, List<SecretKnower>>
  _secretKnowersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.secretKnowers,
    aliasName: 'secrets__id__secret_knowers__secret_id',
  );

  $$SecretKnowersTableProcessedTableManager get secretKnowersRefs {
    final manager = $$SecretKnowersTableTableManager(
      $_db,
      $_db.secretKnowers,
    ).filter((f) => f.secretId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_secretKnowersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SecretsTableFilterComposer
    extends Composer<_$AppDatabase, $SecretsTable> {
  $$SecretsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get ownerCharacterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> secretKnowersRefs(
    Expression<bool> Function($$SecretKnowersTableFilterComposer f) f,
  ) {
    final $$SecretKnowersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secretKnowers,
      getReferencedColumn: (t) => t.secretId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretKnowersTableFilterComposer(
            $db: $db,
            $table: $db.secretKnowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SecretsTableOrderingComposer
    extends Composer<_$AppDatabase, $SecretsTable> {
  $$SecretsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get ownerCharacterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SecretsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SecretsTable> {
  $$SecretsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get ownerCharacterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerCharacterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> secretKnowersRefs<T extends Object>(
    Expression<T> Function($$SecretKnowersTableAnnotationComposer a) f,
  ) {
    final $$SecretKnowersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.secretKnowers,
      getReferencedColumn: (t) => t.secretId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretKnowersTableAnnotationComposer(
            $db: $db,
            $table: $db.secretKnowers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SecretsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SecretsTable,
          Secret,
          $$SecretsTableFilterComposer,
          $$SecretsTableOrderingComposer,
          $$SecretsTableAnnotationComposer,
          $$SecretsTableCreateCompanionBuilder,
          $$SecretsTableUpdateCompanionBuilder,
          (Secret, $$SecretsTableReferences),
          Secret,
          PrefetchHooks Function({
            bool projectId,
            bool ownerCharacterId,
            bool secretKnowersRefs,
          })
        > {
  $$SecretsTableTableManager(_$AppDatabase db, $SecretsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SecretsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SecretsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SecretsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ownerCharacterId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SecretsCompanion(
                id: id,
                projectId: projectId,
                title: title,
                description: description,
                ownerCharacterId: ownerCharacterId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> ownerCharacterId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SecretsCompanion.insert(
                id: id,
                projectId: projectId,
                title: title,
                description: description,
                ownerCharacterId: ownerCharacterId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SecretsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectId = false,
                ownerCharacterId = false,
                secretKnowersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (secretKnowersRefs) db.secretKnowers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$SecretsTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn: $$SecretsTableReferences
                                        ._projectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (ownerCharacterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerCharacterId,
                                    referencedTable: $$SecretsTableReferences
                                        ._ownerCharacterIdTable(db),
                                    referencedColumn: $$SecretsTableReferences
                                        ._ownerCharacterIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (secretKnowersRefs)
                        await $_getPrefetchedData<
                          Secret,
                          $SecretsTable,
                          SecretKnower
                        >(
                          currentTable: table,
                          referencedTable: $$SecretsTableReferences
                              ._secretKnowersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SecretsTableReferences(
                                db,
                                table,
                                p0,
                              ).secretKnowersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.secretId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SecretsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SecretsTable,
      Secret,
      $$SecretsTableFilterComposer,
      $$SecretsTableOrderingComposer,
      $$SecretsTableAnnotationComposer,
      $$SecretsTableCreateCompanionBuilder,
      $$SecretsTableUpdateCompanionBuilder,
      (Secret, $$SecretsTableReferences),
      Secret,
      PrefetchHooks Function({
        bool projectId,
        bool ownerCharacterId,
        bool secretKnowersRefs,
      })
    >;
typedef $$SecretKnowersTableCreateCompanionBuilder =
    SecretKnowersCompanion Function({
      required String secretId,
      required String characterId,
      Value<String?> howTheyKnow,
      Value<String?> knownSince,
      Value<int> rowid,
    });
typedef $$SecretKnowersTableUpdateCompanionBuilder =
    SecretKnowersCompanion Function({
      Value<String> secretId,
      Value<String> characterId,
      Value<String?> howTheyKnow,
      Value<String?> knownSince,
      Value<int> rowid,
    });

final class $$SecretKnowersTableReferences
    extends BaseReferences<_$AppDatabase, $SecretKnowersTable, SecretKnower> {
  $$SecretKnowersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SecretsTable _secretIdTable(_$AppDatabase db) =>
      db.secrets.createAlias('secret_knowers__secret_id__secrets__id');

  $$SecretsTableProcessedTableManager get secretId {
    final $_column = $_itemColumn<String>('secret_id')!;

    final manager = $$SecretsTableTableManager(
      $_db,
      $_db.secrets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secretIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias('secret_knowers__character_id__characters__id');

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SecretKnowersTableFilterComposer
    extends Composer<_$AppDatabase, $SecretKnowersTable> {
  $$SecretKnowersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get howTheyKnow => $composableBuilder(
    column: $table.howTheyKnow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get knownSince => $composableBuilder(
    column: $table.knownSince,
    builder: (column) => ColumnFilters(column),
  );

  $$SecretsTableFilterComposer get secretId {
    final $$SecretsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretId,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableFilterComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SecretKnowersTableOrderingComposer
    extends Composer<_$AppDatabase, $SecretKnowersTable> {
  $$SecretKnowersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get howTheyKnow => $composableBuilder(
    column: $table.howTheyKnow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get knownSince => $composableBuilder(
    column: $table.knownSince,
    builder: (column) => ColumnOrderings(column),
  );

  $$SecretsTableOrderingComposer get secretId {
    final $$SecretsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretId,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableOrderingComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SecretKnowersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SecretKnowersTable> {
  $$SecretKnowersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get howTheyKnow => $composableBuilder(
    column: $table.howTheyKnow,
    builder: (column) => column,
  );

  GeneratedColumn<String> get knownSince => $composableBuilder(
    column: $table.knownSince,
    builder: (column) => column,
  );

  $$SecretsTableAnnotationComposer get secretId {
    final $$SecretsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secretId,
      referencedTable: $db.secrets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SecretsTableAnnotationComposer(
            $db: $db,
            $table: $db.secrets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SecretKnowersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SecretKnowersTable,
          SecretKnower,
          $$SecretKnowersTableFilterComposer,
          $$SecretKnowersTableOrderingComposer,
          $$SecretKnowersTableAnnotationComposer,
          $$SecretKnowersTableCreateCompanionBuilder,
          $$SecretKnowersTableUpdateCompanionBuilder,
          (SecretKnower, $$SecretKnowersTableReferences),
          SecretKnower,
          PrefetchHooks Function({bool secretId, bool characterId})
        > {
  $$SecretKnowersTableTableManager(_$AppDatabase db, $SecretKnowersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SecretKnowersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SecretKnowersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SecretKnowersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> secretId = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String?> howTheyKnow = const Value.absent(),
                Value<String?> knownSince = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SecretKnowersCompanion(
                secretId: secretId,
                characterId: characterId,
                howTheyKnow: howTheyKnow,
                knownSince: knownSince,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String secretId,
                required String characterId,
                Value<String?> howTheyKnow = const Value.absent(),
                Value<String?> knownSince = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SecretKnowersCompanion.insert(
                secretId: secretId,
                characterId: characterId,
                howTheyKnow: howTheyKnow,
                knownSince: knownSince,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SecretKnowersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({secretId = false, characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (secretId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.secretId,
                                referencedTable: $$SecretKnowersTableReferences
                                    ._secretIdTable(db),
                                referencedColumn: $$SecretKnowersTableReferences
                                    ._secretIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable: $$SecretKnowersTableReferences
                                    ._characterIdTable(db),
                                referencedColumn: $$SecretKnowersTableReferences
                                    ._characterIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SecretKnowersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SecretKnowersTable,
      SecretKnower,
      $$SecretKnowersTableFilterComposer,
      $$SecretKnowersTableOrderingComposer,
      $$SecretKnowersTableAnnotationComposer,
      $$SecretKnowersTableCreateCompanionBuilder,
      $$SecretKnowersTableUpdateCompanionBuilder,
      (SecretKnower, $$SecretKnowersTableReferences),
      SecretKnower,
      PrefetchHooks Function({bool secretId, bool characterId})
    >;
typedef $$CustomFieldsTableCreateCompanionBuilder =
    CustomFieldsCompanion Function({
      required String id,
      required String projectId,
      required String entityType,
      required String entityId,
      required String label,
      Value<String?> value,
      Value<int> sortIndex,
      Value<int> rowid,
    });
typedef $$CustomFieldsTableUpdateCompanionBuilder =
    CustomFieldsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> label,
      Value<String?> value,
      Value<int> sortIndex,
      Value<int> rowid,
    });

final class $$CustomFieldsTableReferences
    extends BaseReferences<_$AppDatabase, $CustomFieldsTable, CustomField> {
  $$CustomFieldsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('custom_fields__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CustomFieldsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomFieldsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortIndex => $composableBuilder(
    column: $table.sortIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomFieldsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get sortIndex =>
      $composableBuilder(column: $table.sortIndex, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomFieldsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomFieldsTable,
          CustomField,
          $$CustomFieldsTableFilterComposer,
          $$CustomFieldsTableOrderingComposer,
          $$CustomFieldsTableAnnotationComposer,
          $$CustomFieldsTableCreateCompanionBuilder,
          $$CustomFieldsTableUpdateCompanionBuilder,
          (CustomField, $$CustomFieldsTableReferences),
          CustomField,
          PrefetchHooks Function({bool projectId})
        > {
  $$CustomFieldsTableTableManager(_$AppDatabase db, $CustomFieldsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFieldsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFieldsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFieldsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomFieldsCompanion(
                id: id,
                projectId: projectId,
                entityType: entityType,
                entityId: entityId,
                label: label,
                value: value,
                sortIndex: sortIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String entityType,
                required String entityId,
                required String label,
                Value<String?> value = const Value.absent(),
                Value<int> sortIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomFieldsCompanion.insert(
                id: id,
                projectId: projectId,
                entityType: entityType,
                entityId: entityId,
                label: label,
                value: value,
                sortIndex: sortIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomFieldsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$CustomFieldsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$CustomFieldsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CustomFieldsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomFieldsTable,
      CustomField,
      $$CustomFieldsTableFilterComposer,
      $$CustomFieldsTableOrderingComposer,
      $$CustomFieldsTableAnnotationComposer,
      $$CustomFieldsTableCreateCompanionBuilder,
      $$CustomFieldsTableUpdateCompanionBuilder,
      (CustomField, $$CustomFieldsTableReferences),
      CustomField,
      PrefetchHooks Function({bool projectId})
    >;
typedef $$DiceRollsTableCreateCompanionBuilder =
    DiceRollsCompanion Function({
      required String id,
      required String projectId,
      required String expression,
      required int total,
      required String detail,
      Value<String?> label,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$DiceRollsTableUpdateCompanionBuilder =
    DiceRollsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> expression,
      Value<int> total,
      Value<String> detail,
      Value<String?> label,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$DiceRollsTableReferences
    extends BaseReferences<_$AppDatabase, $DiceRollsTable, DiceRoll> {
  $$DiceRollsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('dice_rolls__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DiceRollsTableFilterComposer
    extends Composer<_$AppDatabase, $DiceRollsTable> {
  $$DiceRollsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiceRollsTableOrderingComposer
    extends Composer<_$AppDatabase, $DiceRollsTable> {
  $$DiceRollsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiceRollsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiceRollsTable> {
  $$DiceRollsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get expression => $composableBuilder(
    column: $table.expression,
    builder: (column) => column,
  );

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiceRollsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiceRollsTable,
          DiceRoll,
          $$DiceRollsTableFilterComposer,
          $$DiceRollsTableOrderingComposer,
          $$DiceRollsTableAnnotationComposer,
          $$DiceRollsTableCreateCompanionBuilder,
          $$DiceRollsTableUpdateCompanionBuilder,
          (DiceRoll, $$DiceRollsTableReferences),
          DiceRoll,
          PrefetchHooks Function({bool projectId})
        > {
  $$DiceRollsTableTableManager(_$AppDatabase db, $DiceRollsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiceRollsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiceRollsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiceRollsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> expression = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiceRollsCompanion(
                id: id,
                projectId: projectId,
                expression: expression,
                total: total,
                detail: detail,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String expression,
                required int total,
                required String detail,
                Value<String?> label = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiceRollsCompanion.insert(
                id: id,
                projectId: projectId,
                expression: expression,
                total: total,
                detail: detail,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DiceRollsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$DiceRollsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$DiceRollsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DiceRollsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiceRollsTable,
      DiceRoll,
      $$DiceRollsTableFilterComposer,
      $$DiceRollsTableOrderingComposer,
      $$DiceRollsTableAnnotationComposer,
      $$DiceRollsTableCreateCompanionBuilder,
      $$DiceRollsTableUpdateCompanionBuilder,
      (DiceRoll, $$DiceRollsTableReferences),
      DiceRoll,
      PrefetchHooks Function({bool projectId})
    >;
typedef $$MapPinsTableCreateCompanionBuilder =
    MapPinsCompanion Function({
      required String id,
      required String projectId,
      required String mapLocationId,
      required String targetType,
      required String targetId,
      required double x,
      required double y,
      Value<String?> label,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$MapPinsTableUpdateCompanionBuilder =
    MapPinsCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> mapLocationId,
      Value<String> targetType,
      Value<String> targetId,
      Value<double> x,
      Value<double> y,
      Value<String?> label,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MapPinsTableReferences
    extends BaseReferences<_$AppDatabase, $MapPinsTable, MapPin> {
  $$MapPinsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias('map_pins__project_id__projects__id');

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<String>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationsTable _mapLocationIdTable(_$AppDatabase db) =>
      db.locations.createAlias('map_pins__map_location_id__locations__id');

  $$LocationsTableProcessedTableManager get mapLocationId {
    final $_column = $_itemColumn<String>('map_location_id')!;

    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mapLocationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MapPinsTableFilterComposer
    extends Composer<_$AppDatabase, $MapPinsTable> {
  $$MapPinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableFilterComposer get mapLocationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mapLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MapPinsTableOrderingComposer
    extends Composer<_$AppDatabase, $MapPinsTable> {
  $$MapPinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableOrderingComposer get mapLocationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mapLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MapPinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MapPinsTable> {
  $$MapPinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationsTableAnnotationComposer get mapLocationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mapLocationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MapPinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MapPinsTable,
          MapPin,
          $$MapPinsTableFilterComposer,
          $$MapPinsTableOrderingComposer,
          $$MapPinsTableAnnotationComposer,
          $$MapPinsTableCreateCompanionBuilder,
          $$MapPinsTableUpdateCompanionBuilder,
          (MapPin, $$MapPinsTableReferences),
          MapPin,
          PrefetchHooks Function({bool projectId, bool mapLocationId})
        > {
  $$MapPinsTableTableManager(_$AppDatabase db, $MapPinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MapPinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MapPinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MapPinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> mapLocationId = const Value.absent(),
                Value<String> targetType = const Value.absent(),
                Value<String> targetId = const Value.absent(),
                Value<double> x = const Value.absent(),
                Value<double> y = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MapPinsCompanion(
                id: id,
                projectId: projectId,
                mapLocationId: mapLocationId,
                targetType: targetType,
                targetId: targetId,
                x: x,
                y: y,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String mapLocationId,
                required String targetType,
                required String targetId,
                required double x,
                required double y,
                Value<String?> label = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MapPinsCompanion.insert(
                id: id,
                projectId: projectId,
                mapLocationId: mapLocationId,
                targetType: targetType,
                targetId: targetId,
                x: x,
                y: y,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MapPinsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false, mapLocationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$MapPinsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$MapPinsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (mapLocationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.mapLocationId,
                                referencedTable: $$MapPinsTableReferences
                                    ._mapLocationIdTable(db),
                                referencedColumn: $$MapPinsTableReferences
                                    ._mapLocationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MapPinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MapPinsTable,
      MapPin,
      $$MapPinsTableFilterComposer,
      $$MapPinsTableOrderingComposer,
      $$MapPinsTableAnnotationComposer,
      $$MapPinsTableCreateCompanionBuilder,
      $$MapPinsTableUpdateCompanionBuilder,
      (MapPin, $$MapPinsTableReferences),
      MapPin,
      PrefetchHooks Function({bool projectId, bool mapLocationId})
    >;
typedef $$PartnerLinksTableCreateCompanionBuilder =
    PartnerLinksCompanion Function({
      required String aId,
      required String bId,
      Value<String?> type,
      Value<String?> status,
      Value<int> rowid,
    });
typedef $$PartnerLinksTableUpdateCompanionBuilder =
    PartnerLinksCompanion Function({
      Value<String> aId,
      Value<String> bId,
      Value<String?> type,
      Value<String?> status,
      Value<int> rowid,
    });

final class $$PartnerLinksTableReferences
    extends BaseReferences<_$AppDatabase, $PartnerLinksTable, PartnerLink> {
  $$PartnerLinksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _aIdTable(_$AppDatabase db) =>
      db.characters.createAlias('partner_links__a_id__characters__id');

  $$CharactersTableProcessedTableManager get aId {
    final $_column = $_itemColumn<String>('a_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CharactersTable _bIdTable(_$AppDatabase db) =>
      db.characters.createAlias('partner_links__b_id__characters__id');

  $$CharactersTableProcessedTableManager get bId {
    final $_column = $_itemColumn<String>('b_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PartnerLinksTableFilterComposer
    extends Composer<_$AppDatabase, $PartnerLinksTable> {
  $$PartnerLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get aId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableFilterComposer get bId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartnerLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $PartnerLinksTable> {
  $$PartnerLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get aId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableOrderingComposer get bId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartnerLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartnerLinksTable> {
  $$PartnerLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$CharactersTableAnnotationComposer get aId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CharactersTableAnnotationComposer get bId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartnerLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartnerLinksTable,
          PartnerLink,
          $$PartnerLinksTableFilterComposer,
          $$PartnerLinksTableOrderingComposer,
          $$PartnerLinksTableAnnotationComposer,
          $$PartnerLinksTableCreateCompanionBuilder,
          $$PartnerLinksTableUpdateCompanionBuilder,
          (PartnerLink, $$PartnerLinksTableReferences),
          PartnerLink,
          PrefetchHooks Function({bool aId, bool bId})
        > {
  $$PartnerLinksTableTableManager(_$AppDatabase db, $PartnerLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartnerLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartnerLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartnerLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> aId = const Value.absent(),
                Value<String> bId = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PartnerLinksCompanion(
                aId: aId,
                bId: bId,
                type: type,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String aId,
                required String bId,
                Value<String?> type = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PartnerLinksCompanion.insert(
                aId: aId,
                bId: bId,
                type: type,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartnerLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({aId = false, bId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (aId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.aId,
                                referencedTable: $$PartnerLinksTableReferences
                                    ._aIdTable(db),
                                referencedColumn: $$PartnerLinksTableReferences
                                    ._aIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (bId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bId,
                                referencedTable: $$PartnerLinksTableReferences
                                    ._bIdTable(db),
                                referencedColumn: $$PartnerLinksTableReferences
                                    ._bIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PartnerLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartnerLinksTable,
      PartnerLink,
      $$PartnerLinksTableFilterComposer,
      $$PartnerLinksTableOrderingComposer,
      $$PartnerLinksTableAnnotationComposer,
      $$PartnerLinksTableCreateCompanionBuilder,
      $$PartnerLinksTableUpdateCompanionBuilder,
      (PartnerLink, $$PartnerLinksTableReferences),
      PartnerLink,
      PrefetchHooks Function({bool aId, bool bId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db, _db.factions);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db, _db.locations);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db, _db.chapters);
  $$TimelineEventsTableTableManager get timelineEvents =>
      $$TimelineEventsTableTableManager(_db, _db.timelineEvents);
  $$CharacterRelationshipsTableTableManager get characterRelationships =>
      $$CharacterRelationshipsTableTableManager(
        _db,
        _db.characterRelationships,
      );
  $$RelationshipMembersTableTableManager get relationshipMembers =>
      $$RelationshipMembersTableTableManager(_db, _db.relationshipMembers);
  $$EventCharactersTableTableManager get eventCharacters =>
      $$EventCharactersTableTableManager(_db, _db.eventCharacters);
  $$ChapterCharactersTableTableManager get chapterCharacters =>
      $$ChapterCharactersTableTableManager(_db, _db.chapterCharacters);
  $$ChapterLocationsTableTableManager get chapterLocations =>
      $$ChapterLocationsTableTableManager(_db, _db.chapterLocations);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$MagicSystemsTableTableManager get magicSystems =>
      $$MagicSystemsTableTableManager(_db, _db.magicSystems);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$TagLinksTableTableManager get tagLinks =>
      $$TagLinksTableTableManager(_db, _db.tagLinks);
  $$CharacterSheetsTableTableManager get characterSheets =>
      $$CharacterSheetsTableTableManager(_db, _db.characterSheets);
  $$FamilyLinksTableTableManager get familyLinks =>
      $$FamilyLinksTableTableManager(_db, _db.familyLinks);
  $$SecretsTableTableManager get secrets =>
      $$SecretsTableTableManager(_db, _db.secrets);
  $$SecretKnowersTableTableManager get secretKnowers =>
      $$SecretKnowersTableTableManager(_db, _db.secretKnowers);
  $$CustomFieldsTableTableManager get customFields =>
      $$CustomFieldsTableTableManager(_db, _db.customFields);
  $$DiceRollsTableTableManager get diceRolls =>
      $$DiceRollsTableTableManager(_db, _db.diceRolls);
  $$MapPinsTableTableManager get mapPins =>
      $$MapPinsTableTableManager(_db, _db.mapPins);
  $$PartnerLinksTableTableManager get partnerLinks =>
      $$PartnerLinksTableTableManager(_db, _db.partnerLinks);
}
