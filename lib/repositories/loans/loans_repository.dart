import 'package:credit_list/repositories/loans/models/loan.dart';
import 'package:dio/dio.dart';
import 'package:credit_list/repositories/loans/loans.dart';

class LoansRepository implements AbstractLoansRepository {

  final Dio dio;

  LoansRepository({
    required this.dio
  });

  @override
  Future<List<Loan>> getLoansList() async { 
    dio.options.headers['X-Requested-With'] = 'XMLHttpRequest';

    final response = await dio.get(
      'https://api.banki.ru/1.0/microloans/ajax/search/?catalog_name=zaym_onlayn&page=1&per_page=15&region_ids%5B%5D=4'
    );
    
    List<Loan> items = [];
    for (var item in response.data['items']) {
      final dad = Loan.fromJson(item);
      items.add(dad);
    }

    return items;
  }
}