import 'package:flutter/material.dart';
import 'layout/my_bottom_navigation_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico - ParkHere',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          final transaction = transactionList[index];
          return ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text(transaction.title),
            subtitle: Text(transaction.details),
            trailing: Text(transaction.date),
          );
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class Transaction {
  final String title;
  final String details;
  final String date;

  Transaction({required this.title, required this.details, required this.date});
}

final List<Transaction> transactionList = [
  Transaction(
    title: 'Pago no cartão final 1234',
    details: 'Avenida Limeira',
    date: '13/09/2024 - Limeira, SP',
  ),
  Transaction(
    title: 'Pago no cartão final 1234',
    details: 'Avenida Limeira',
    date: '14/09/2024 - Limeira, SP',
  ),
  Transaction(
    title: 'Pago no cartão final 1234',
    details: 'Avenida Limeira',
    date: '15/05/2024 - Limeira, SP',
  ),
  Transaction(
    title: 'Pago no cartão final 1234',
    details: 'Avenida Limeira',
    date: '16/05/2024 - Limeira, SP',
  ),
];
