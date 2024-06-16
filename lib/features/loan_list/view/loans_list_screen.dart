import 'dart:async';

import 'package:credit_list/features/loan_list/bloc/loan_list_bloc.dart';
import 'package:credit_list/features/loan_list/widgets/widgets.dart';
import 'package:credit_list/repositories/loans/loans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoanListScreen extends StatefulWidget {
  const LoanListScreen({super.key, required this.title});

  final String title;

  @override
  State<LoanListScreen> createState() => _LoanListScreenState();
}

class _LoanListScreenState extends State<LoanListScreen> {

  final _loanListBloc = LoanListBloc(GetIt.I<AbstractLoansRepository>());

  @override
  void initState() {
    _loanListBloc.add(LoadLoanList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _loanListBloc.add(LoadLoanList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<LoanListBloc, LoanListState>(
          bloc: _loanListBloc,
          builder: (context, state) {
            if (state is LoanListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.loanList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final credit = state.loanList[i];
                  return LoanTile(loan: credit);
                },
              );
            }

            if (state is LoanListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Something went wrong'
                    ),
                    const Text(
                      'Please try againg later'
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _loanListBloc.add(LoadLoanList());
                      },
                      child: const Text('Try againg'),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
      ),
      ),
    );
  }
}