import 'package:credit_list/repositories/loans/models/loan.dart';
import 'package:flutter/material.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  Loan? loan;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Loan, 'You must provide String args');
    loan = args as Loan;
    setState(() {});
    super.didChangeDependencies();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(loan?.name ?? '.....'),),
    body: ListView(
      children: [
        Text(
          loan?.mfo.fullName ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        Image.network(
          loan?.mfo.iconUrl ?? '',
          width: 150,
          height: 100,
        ),
        SizedBox(height: 30),
        Text(
          loan?.mfo.previewText ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
                  ...loan!.mfo.phones.map((phone) => ListTile(
            title: Text(
             phone.phone,
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
             ),
            subtitle: phone.description == null 
            ? null 
            : Text(
             phone.description.toString() ,
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
             ),
            onTap: () {
              // TODO: обработать нажатие на телефон
            },
          )).toList()
      ],
    ),
  );
}
}

