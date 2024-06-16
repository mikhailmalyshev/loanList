import 'package:credit_list/features/loan/loan.dart';
import 'package:credit_list/features/loan_list/loan_list.dart';

final routes = {
  '/': (context) =>  const LoanListScreen(title: 'Быстрые деньги'),
  '/loan': (context) => const LoanScreen(),
};