import 'package:flutter/material.dart';

final theme = ThemeData(
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
);