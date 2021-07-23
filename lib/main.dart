import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_expense/model/transaction.dart';
import 'package:money_expense/views/pages/pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
