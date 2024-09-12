import 'package:flutter/material.dart';
import 'package:park_here/tela-login.dart';
import 'package:park_here/inicio.dart';
import 'package:park_here/cadastroPerfil.dart';
import 'package:park_here/cadastroVeiculo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //static const String _title = 'Park Here';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkHere',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreen(),
      routes: {
        '/login': (context) => const Login(),
        '/inicio': (context) => const StartScreen(),
        '/cadastroPerfil': (context) => const RegisterScreen(),
        '/cadastroVeiculo': (context) => const VehicleRegisterScreen(),
      },
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Inicio());
  }*/
}
