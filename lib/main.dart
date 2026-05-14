import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Expense Tracker',

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          fillColor: Colors.white.withOpacity(0.03),

          hintStyle: const TextStyle(color: Colors.white54),

          labelStyle: const TextStyle(color: Colors.white70),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),

            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),

            borderSide: const BorderSide(color: Colors.green, width: 1.5),
          ),
        ),

        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xFF0D0D0D),

        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),

          elevation: 0,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,

          brightness: Brightness.dark,
        ),
      ),

      home: const DashboardScreen(),
    );
  }
}
