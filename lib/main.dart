import 'package:flutter/material.dart';
import 'package:synapse/synapse.dart';
import 'package:synapse/Login.dart';

class Synapse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synapse',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}

void main() {
  runApp(Synapse());
}
