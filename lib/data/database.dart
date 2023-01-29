import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  IntColumn get distance => integer()();
  IntColumn get time => integer()();
  DateTimeColumn get dateSession => dateTime()();
}

@DriftDatabase(tables: [Sessions])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // Add a bunch of default items in a batch
        await batch((b) {
          b.insertAll(sessions, [
            SessionsCompanion.insert(
                title: 'test 1',
                distance: 2,
                time: 30,
                dateSession: DateTime(2020, 2, 3, 3, 3)),
            SessionsCompanion.insert(
                title: 'test 2',
                distance: 30,
                time: 30,
                dateSession: DateTime(2001, 2, 3, 3, 3))
          ]);
        });
      },
    );
  }

  Future<List<Session>> get allSessions => select(sessions).get();

  Stream<List<Session>> watchSessions() => select(sessions).watch();

  Future insertSession(Session s) => into(sessions).insert(s);
  Future updateSession(Session s) => update(sessions).replace(s);
  Future deleteSession(Session s) => delete(sessions).delete(s);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
