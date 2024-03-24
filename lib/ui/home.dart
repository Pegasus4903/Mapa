import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mapa/data/Models.dart';
import 'package:mapa/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildSessionList(context),
      floatingActionButton: Theme(
        data: Theme.of(context)
            .copyWith(splashColor: const Color.fromARGB(255, 22, 78, 62)),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/map");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget _buildSessionList(BuildContext context) {
  return ListView.builder(
    itemCount: objectbox.store.box<Session>().getAll().length,
    itemBuilder: (context, index) {
      Session? itemSession = objectbox.store.box<Session>().getAll()[index];
      return _listCardWidget(context, itemSession);
    },
  );
}

Widget _listCardWidget(BuildContext context, Session session) {
  initializeDateFormatting(Localizations.localeOf(context).languageCode, null);
  return Slidable(
    key: const ValueKey(0),
    endActionPane: const ActionPane(motion: ScrollMotion(), children: [
      SlidableAction(
        // An action can be bigger than the others.d
        onPressed: null,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
      )
    ]),
    child: Card(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(session.title,
                        style: Theme.of(context).textTheme.titleSmall),
                  )),
              Container(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Distance : ${session.distance.toString()} m",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(DateFormat.yMd().format(session.date),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
