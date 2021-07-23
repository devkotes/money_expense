part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionInit extends TransactionEvent {
  @override
  List<Object> get props => [];
}

class SubmitTransaction extends TransactionEvent {
  final String title;
  final String categories;
  final double amount;
  final DateTime date;

  SubmitTransaction(this.title, this.categories, this.amount, this.date);

  @override
  List<Object> get props => [title, categories, amount, date];
}
