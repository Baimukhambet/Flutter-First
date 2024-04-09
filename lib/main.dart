import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:second/crypto_currencies_app.dart';
import 'package:second/repositories/crypto_coins/crypto_coins.dart';

void main() { 
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() {return CryptoCoinsRepository(dio: Dio());});
  runApp(const CryptoCurrenciesApp());
}




