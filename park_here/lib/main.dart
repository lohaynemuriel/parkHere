import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:park_here/firebase_options.dart';
import 'package:park_here/view/tela-cadastroPerfil.dart';
import 'package:park_here/view/tela-cadastroVeiculo.dart';
import 'package:park_here/view/tela-confirmarVaga.dart';
import 'package:park_here/view/tela-historico.dart';
import 'package:park_here/view/tela-pagamento.dart';
import 'package:park_here/view/tela-perfil.dart';
import 'package:park_here/view/tela-principal.dart';
import 'package:park_here/view/tela-vagas.dart';
import 'package:park_here/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'provider/veiculo_provider.dart';
import 'view/tela-inicio.dart';
import 'view/tela-login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Erro ao inicializar Firebase: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              VeiculoProvider()..loadVeiculo(), // Carregar o veículo ao iniciar
        ),
        BlocProvider(
          create: (_) =>
              AuthBloc(FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
      ],
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
          '/tela-cadastroVeiculo': (context) => VehicleRegisterScreen(),
          '/tela-principal': (context) => MainScreen(),
          '/tela-perfil': (context) => UserProfileScreen(),
          '/tela-historico': (context) => const HistoryScreen(),
          '/tela-vagas': (context) => const Vagas(),
          '/tela-confirmarVaga': (context) => const ConfirmarVagaScreen(
                vaga: 0,
              ),
          '/tela-pagamento': (context) => PagamentoScreen(),
        },
      ),
    );
  }
}
