import 'package:credit_list/repositories/loans/models/loan.dart';

abstract class AbstractLoansRepository {
  Future<List<Loan>> getLoansList();
}