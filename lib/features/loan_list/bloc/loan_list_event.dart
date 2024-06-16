part of 'loan_list_bloc.dart';

abstract class LoanListEvent extends Equatable {}

class LoadLoanList extends LoanListEvent {
  final Completer? completer;

  LoadLoanList({
    this.completer
  });
  
  @override
  List<Object?> get props => throw [completer];
}