import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class Notes extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? desc;
}

class NManager {
  static Box<Notes> getAllNotes() => Hive.box<Notes>("notes");
}
