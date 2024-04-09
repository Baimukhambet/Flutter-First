import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second/features/crypto_coin/crypto_coin.dart';
import 'features/crypto_list/crypto_list.dart';

void main() => runApp(const CryptoCurrenciesApp());


// Main Widget of App
class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/':(context) => const CryptoListScreen(),
        '/coin':(context) => const CryptoCoinScreen()
      },
      theme: ThemeData(
        textTheme:const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
          labelLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold, color: Colors.white),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold, color: Colors.white
          )
        ),
        scaffoldBackgroundColor: Colors.black54,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black54)
      )
    );
  }
}

