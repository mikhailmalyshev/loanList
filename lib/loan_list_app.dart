import 'package:credit_list/router/router.dart';
import 'package:credit_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CreditListApp extends StatelessWidget {
  const CreditListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darlTheme,
      routes: routes,
    );
  }
}