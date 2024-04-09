import 'package:flutter/material.dart';
import 'package:second/router/router.dart';
import 'package:second/theme/theme.dart';

// Main Widget of App
class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: theme
      );
  }
}