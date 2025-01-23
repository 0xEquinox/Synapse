import 'package:flutter/material.dart';

import 'Login.dart';

void main() {
  runApp(Synapse());
}

class Synapse extends StatefulWidget {
  @override
  _SynapseState createState() => _SynapseState();
}

class _SynapseState extends State<Synapse> {
  // Track the current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // Function to toggle between light and dark themes
  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synapse',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode, // Use the current theme mode
      home: LoginPage(
        isDarkMode: _themeMode == ThemeMode.dark,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}
