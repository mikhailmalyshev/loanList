import 'dart:async';

import 'package:credit_list/repositories/loans/loans.dart';
import 'package:credit_list/repositories/loans/models/loan.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loan_list_event.dart';
part 'loan_list_state.dart';

class LoanListBloc extends Bloc<LoanListEvent, LoanListState> {
  LoanListBloc(this.loansRepository) : super(LoanListInitial()) {

    on<LoadLoanList>((event, emit) async {
      try {
        if (state is! LoanListLoaded) {
          emit(LoanListLoading());
        }
        final loanList = await loansRepository.getLoansList();
        emit(LoanListLoaded(loanList: loanList));
      } catch (e) {
        emit(LoanListLoadingFailure(exception: e));
      }

      finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractLoansRepository loansRepository;
}

