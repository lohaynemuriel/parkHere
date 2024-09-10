import 'package:flutter/material.dart';
import 'package:park_here/tela-login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Park Here';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
