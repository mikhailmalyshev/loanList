part of 'loan_list_bloc.dart';

abstract class LoanListState extends Equatable {}

class LoanListInitial extends LoanListState {
  @override
  List<Object?> get props => [];
} 

class LoanListLoading extends LoanListState {
  @override
  List<Object?> get props => [];
}

class LoanListLoaded  extends LoanListState {
  final List<Loan> loanList;

  LoanListLoaded({
    required this.loanList
  });
  
  @override
  List<Object?> get props => [loanList];
}

class LoanListLoadingFailure extends LoanListState {

  final Object? exception;

  LoanListLoadingFailure({
    required this.exception
  });
  
  @override
  List<Object?> get props => [exception];
}