// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _distanceMeta =
      const VerificationMeta('distance');
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
      'distance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateSessionMeta =
      const VerificationMeta('dateSession');
  @override
  late final GeneratedColumn<DateTime> dateSession = GeneratedColumn<DateTime>(
      'date_session', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, distance, time, dateSession];
  @override
  String get aliasedName => _alias ?? 'sessions';
  @override
  String get actualTableName => 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta));
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('date_session')) {
      context.handle(
          _dateSessionMeta,
          dateSession.isAcceptableOrUnknown(
              data['date_session']!, _dateSessionMeta));
    } else if (isInserting) {
      context.missing(_dateSessionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      distance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}distance'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
      dateSession: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_session'])!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final String title;
  final int distance;
  final int time;
  final DateTime dateSession;
  const Session(
      {required this.id,
      required this.title,
      required this.distance,
      required this.time,
      required this.dateSession});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['distance'] = Variable<int>(distance);
    map['time'] = Variable<int>(time);
    map['date_session'] = Variable<DateTime>(dateSession);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      title: Value(title),
      distance: Value(distance),
      time: Value(time),
      dateSession: Value(dateSession),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      distance: serializer.fromJson<int>(json['distance']),
      time: serializer.fromJson<int>(json['time']),
      dateSession: serializer.fromJson<DateTime>(json['dateSession']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'distance': serializer.toJson<int>(distance),
      'time': serializer.toJson<int>(time),
      'dateSession': serializer.toJson<DateTime>(dateSession),
    };
  }

  Session copyWith(
          {int? id,
          String? title,
          int? distance,
          int? time,
          DateTime? dateSession}) =>
      Session(
        id: id ?? this.id,
        title: title ?? this.title,
        distance: distance ?? this.distance,
        time: time ?? this.time,
        dateSession: dateSession ?? this.dateSession,
      );
  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('distance: $distance, ')
          ..write('time: $time, ')
          ..write('dateSession: $dateSession')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, distance, time, dateSession);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.title == this.title &&
          other.distance == this.distance &&
          other.time == this.time &&
          other.dateSession == this.dateSession);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> distance;
  final Value<int> time;
  final Value<DateTime> dateSession;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.distance = const Value.absent(),
    this.time = const Value.absent(),
    this.dateSession = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int distance,
    required int time,
    required DateTime dateSession,
  })  : title = Value(title),
        distance = Value(distance),
        time = Value(time),
        dateSession = Value(dateSession);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? distance,
    Expression<int>? time,
    Expression<DateTime>? dateSession,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (distance != null) 'distance': distance,
      if (time != null) 'time': time,
      if (dateSession != null) 'date_session': dateSession,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? distance,
      Value<int>? time,
      Value<DateTime>? dateSession}) {
    return SessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      distance: distance ?? this.distance,
      time: time ?? this.time,
      dateSession: dateSession ?? this.dateSession,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (dateSession.present) {
      map['date_session'] = Variable<DateTime>(dateSession.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('distance: $distance, ')
          ..write('time: $time, ')
          ..write('dateSession: $dateSession')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $SessionsTable sessions = $SessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sessions];
}
