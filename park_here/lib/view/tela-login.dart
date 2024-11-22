import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:park_here/bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context); // Fecha o diálogo de carregamento.
            Navigator.pushReplacementNamed(context,
                '/tela-principal'); // Redireciona para a tela principal.
          } else if (state is AuthFailure) {
            Navigator.pop(context); // Fecha o diálogo de carregamento.
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Erro'),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInRequested(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/tela-cadastroPerfil'),
                  child: const Text('Não tem conta? Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
