import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

 static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.light,
    primary: const Color.fromARGB(255, 16, 4, 64),   // Deep midnight purple   
    onPrimary: const Color(0xFFF3F4F6), // Very soft off-white/gray
 );
      // 👈 Paste here  );


  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor:_lightColorScheme.primary,
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: _lightColorScheme.primary,
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    actionsIconTheme: IconThemeData(
      color: Colors.white
      

    ),
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.onPrimary,
       size: 24.0,
    ),textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black)
    )
  );

}