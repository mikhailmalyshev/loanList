import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final String name;
  final double price;
  final String iamgeURL;

  const Credit({
    required this.name, 
    required this.price,
    required this.iamgeURL,
    });
    
      @override
      List<Object?> get props => throw [name, price, iamgeURL];
}