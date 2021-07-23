import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String categories;
  @HiveField(2)
  double amount;
  @HiveField(3)
  DateTime createdAt;
}
