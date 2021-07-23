import 'package:hive/hive.dart';
import 'package:money_expense/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');
}
