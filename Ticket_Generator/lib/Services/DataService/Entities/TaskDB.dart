
import 'package:realm/realm.dart';
part 'TaskDB.g.dart';

@RealmModel()
class _TaskDB {
  @PrimaryKey()
  late ObjectId id;

  late String type;
  late int number;
  late String description;
  late String answer;
  late int complexity;
}