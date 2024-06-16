import 'package:credit_list/repositories/loans/models/loan.dart';
import 'package:flutter/material.dart';

class LoanTile extends StatelessWidget {
  const LoanTile({
    super.key,
    required this.loan,
  });

  final Loan loan;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(loan.mfo.iconUrl),
      title: Text(loan.name),
      subtitle: Text(
        '${loan.amountString}\$',
        ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/loan',
          arguments: loan);
      },);
  }
}