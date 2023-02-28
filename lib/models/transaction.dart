import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  String date;
  @HiveField(1)
  String time;
  @HiveField(2)
  String detail;
  @HiveField(3)
  int quantity;

  Transaction(
      {required this.date,
      required this.time,
      required this.detail,
      required this.quantity});
}
