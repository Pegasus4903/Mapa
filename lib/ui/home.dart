import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = AppDatabase();
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          children: [Expanded(child: _buildSessionList(context, database))]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushReplacementNamed(context, '/map')},
      ),
    );
  }
}

StreamBuilder<List<Session>> _buildSessionList(
    BuildContext context, AppDatabase database) {
  return StreamBuilder(
    stream: database.watchSessions(),
    builder: (context, AsyncSnapshot<List<Session>> snapshot) {
      final sessions = snapshot.data ?? [];

      return ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (_, index) {
          final itemSession = sessions[index];
          return _listCardWidget(context, itemSession);
        },
      );
    },
  );
}

Widget _listCardWidget(BuildContext context, Session session) {
  initializeDateFormatting(Localizations.localeOf(context).languageCode, null);
  return Card(
    child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(3.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(session.title),
                )),
            Container(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Distance : ${session.distance.toString()} m"),
                  Text(DateFormat.yMd().format(session.dateSession)),
                ],
              ),
            )
          ],
        )),
  );
}
