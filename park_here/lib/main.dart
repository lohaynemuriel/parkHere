import 'package:flutter/material.dart';
import 'view/tela-login.dart';
import 'view/tela-inicio.dart';
import 'view/tela-cadastroPerfil.dart';
import 'view/tela-cadastroVeiculo.dart';
import 'view/tela-principal.dart';
import 'view/layout/my_bottom_navigation_bar.dart';
import 'view/tela-vagas.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //static const String _title = 'Park Here';

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'ParkHere',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const StartScreen(),
  //     routes: {
  //       '/login': (context) => const Login(),
  //       '/inicio': (context) => const StartScreen(),
  //       '/cadastroPerfil': (context) => const RegisterScreen(),
  //       '/cadastroVeiculo': (context) => const VehicleRegisterScreen(),
  //       '/principal': (context) => const Principal(),
  //     },
  //   );
  // }

  /*@override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Vagas());
  }
}
