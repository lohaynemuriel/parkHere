import 'package:flutter/material.dart';

class ConfirmationDialog {
  static void show(BuildContext context, String title, String subtitle, String route) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.blue,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subtitle),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity, // Faz o botão ocupar toda a largura
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, route); // Fecha o diálogo
                  },
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
