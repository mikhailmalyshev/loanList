import 'package:credit_list/loan_list_app.dart';
import 'package:credit_list/repositories/loans/abstract_loans_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'repositories/loans/loans_repository.dart';
 
void main() {
  GetIt.I.registerLazySingleton<AbstractLoansRepository>( () => LoansRepository(dio: Dio()));

  runApp(const CreditListApp());
}