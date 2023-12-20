import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 138, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    ),
  ));
}
