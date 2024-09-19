// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'view/tela-login.dart';
import 'view/tela-inicio.dart';
import 'view/tela-cadastroPerfil.dart';
import 'view/tela-cadastroVeiculo.dart';
import 'view/tela-principal.dart';
import 'view/layout/my_bottom_navigation_bar.dart';
import 'view/tela-vagas.dart';
import 'view/tela-perfil.dart';
import 'view/tela-historico.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HistoryScreen());
  }
}
