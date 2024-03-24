import 'package:flutter/cupertino.dart';
import 'package:mapa/data/Models.dart';
import 'package:mapa/data/ObjectBox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectbox = await ObjectBox.create();

  objectbox.store
      .box<Session>()
      .put(Session(id: 0, title: "test 1", distance: 1, date: DateTime(1990)));
  objectbox.store
      .box<Session>()
      .put(Session(id: 0, title: "test 2", distance: 1, date: DateTime(1990)));
  objectbox.store
      .box<Session>()
      .put(Session(id: 0, title: "test 3", distance: 1, date: DateTime(1990)));
}
