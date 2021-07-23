part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionLoading extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionSuccess extends TransactionState {
  final Box<Transaction> transaction;

  TransactionSuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class TransactionError extends TransactionState {
  final String msg;

  TransactionError(this.msg);

  @override
  List<Object> get props => [msg];
}

class SubmitTransactionLoading extends TransactionState {
  @override
  List<Object> get props => [];
}

class SubmitTransactionSuccess extends TransactionState {
  @override
  List<Object> get props => [];
}

class SubmitTransactionError extends TransactionState {
  final String msg;

  SubmitTransactionError(this.msg);

  @override
  List<Object> get props => [msg];
}
