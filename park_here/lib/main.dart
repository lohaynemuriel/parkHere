// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:park_here/firebase_options.dart';
import 'bloc/auth_bloc.dart';
import 'view/tela-confirmarVaga.dart';
import 'view/tela-login.dart';
import 'view/tela-inicio.dart';
import 'view/tela-cadastroPerfil.dart';
import 'view/tela-cadastroVeiculo.dart';
import 'view/tela-pagamento.dart';
import 'view/tela-principal.dart';
import 'view/tela-vagas.dart';
import 'view/tela-perfil.dart';
import 'view/tela-historico.dart';
import 'view/layout/my_bottom_navigation_bar.dart';
import 'view/widgets/confirmation_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(FirebaseAuth.instance),
      child: MaterialApp(
        title: 'ParkHere',
        theme: ThemeData(
          fontFamily: 'Comfortaa',
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
              padding:
                  const EdgeInsets.symmetric(horizontal: 137, vertical: 30),
              textStyle: const TextStyle(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding:
                  const EdgeInsets.symmetric(horizontal: 137, vertical: 30),
              textStyle: const TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StartScreen(),
          '/tela-login': (context) => Login(),
          '/tela-cadastroPerfil': (context) => RegisterScreen(),
          '/tela-cadastroVeiculo': (context) => const VehicleRegisterScreen(),
          '/tela-principal': (context) => const MainScreen(),
          '/tela-perfil': (context) => const UserProfileScreen(),
          '/tela-historico': (context) => const HistoryScreen(),
          '/tela-vagas': (context) => Vagas(),
          '/tela-confirmarVaga': (context) => ConfirmarVagaScreen(
                vaga: 0,
              ),
          '/tela-pagamento': (context) => PagamentoScreen(),
        },
      ),
    );
  }
}
