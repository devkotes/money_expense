import 'package:money_expense/model/transaction.dart';
import 'package:money_expense/service/boxes.dart';

class Services {
  static Future addTransaction(
      String title, String categories, double amount) async {
    final transaction = Transaction()
      ..title = title
      ..categories = categories
      ..amount = amount
      ..createdAt = DateTime.now();

    final box = Boxes.getTransactions();
    box.add(transaction);
  }
}
