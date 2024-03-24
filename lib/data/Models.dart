import 'package:objectbox/objectbox.dart';

@Entity()
class Session {
  @Id()
  int id = 0;
  String title;
  int distance;

  @Property(type: PropertyType.date)
  DateTime date;

  Session(
      {required this.id,
      required this.title,
      required this.distance,
      required this.date});
}
