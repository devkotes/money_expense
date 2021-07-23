import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:money_expense/model/transaction.dart';
import 'package:money_expense/service/services.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    final service = Services();
    if (event is TransactionInit) {
      yield TransactionLoading();
      try {
        final resp = service.getTransactions();
        yield TransactionSuccess(resp);
      } catch (e) {
        yield TransactionError(e.toString());
      }
    } else if (event is SubmitTransaction) {
      yield SubmitTransactionLoading();

      try {
        service.addTransaction(
            event.title, event.categories, event.amount, event.date);
        yield SubmitTransactionSuccess();
      } catch (e) {
        yield SubmitTransactionError(e.toString());
      }
    }
  }
}
