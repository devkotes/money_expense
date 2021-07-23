import 'package:money_expense/model/transaction.dart';
import 'package:hive/hive.dart';
import 'package:money_expense/model/transaction.dart';

class Services {
  Box<Transaction> getTransactions() => Hive.box<Transaction>('transactions');

  Future addTransaction(
      String title, String categories, double amount, DateTime date) async {
    final transaction = Transaction()
      ..title = title
      ..categories = categories
      ..amount = amount
      ..createdAt = date;

    final box = getTransactions();
    box.add(transaction);
  }
}
