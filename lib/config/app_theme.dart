import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.lightGreen,
      cardColor: const Color.fromARGB(
          255, 15, 15, 15), // Define el color de fondo de las tarjetas
      scaffoldBackgroundColor: const Color.fromARGB(255, 8, 35, 39),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        bodyLarge:
            TextStyle(color: Colors.white), // Cambia bodyText1 a bodyLarge
        bodyMedium:
            TextStyle(color: Colors.white), // Cambia bodyText2 a bodyMedium
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
