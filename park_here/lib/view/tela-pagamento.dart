import 'package:flutter/material.dart';
import 'package:park_here/view/widgets/confirmation_dialog.dart';
import 'package:provider/provider.dart';
import 'package:park_here/provider/pagamento_provider.dart';

class PagamentoScreen extends StatefulWidget {
  final int vagaId; // ID da vaga
  final String tempoPermanencia; // Tempo selecionado
  final String placaVeiculo; // Placa do veículo

  const PagamentoScreen({
    super.key,
    required this.vagaId,
    required this.tempoPermanencia,
    required this.placaVeiculo,
  });

  @override
  _PagamentoScreenState createState() => _PagamentoScreenState();
}

class _PagamentoScreenState extends State<PagamentoScreen> {
  String? _selectedPaymentMethod;
  String _cardNumber = '';
  String _cardHolderName = '';
  String _cardExpiryDate = '';
  String _cardCvv = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Estacione',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pagamento',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text(
                    'Adicionar método de pagamento',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/logotipo-visa.png',
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/logotipo-mastercard.png',
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Modo de pagamento',
                  ),
                  value: _selectedPaymentMethod,
                  items: <String>['Crédito', 'Débito'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPaymentMethod = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Selecione um método de pagamento' : null,
                  hint: const Text('Selecione'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número do Cartão',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _cardNumber = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o número do cartão';
                    }
                    if (value.length < 16) {
                      return 'O número do cartão deve ter 16 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome do Titular',
                  ),
                  onChanged: (value) {
                    _cardHolderName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o nome do titular do cartão';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Validade (MM/AA)',
                        ),
                        keyboardType: TextInputType.datetime,
                        onChanged: (value) {
                          _cardExpiryDate = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite a validade';
                          }
                          if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$')
                              .hasMatch(value)) {
                            return 'Formato inválido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        onChanged: (value) {
                          _cardCvv = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o CVV';
                          }
                          if (value.length != 3) {
                            return 'O CVV deve ter 3 dígitos';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Chama o Provider para salvar o pagamento com todos os dados
                        print('Método de Pagamento: $_selectedPaymentMethod');
                        print(
                            'Tempo de Permanência: ${widget.tempoPermanencia}');
                        print('ID da Vaga: ${widget.vagaId}');
                        print('Placa do Veículo: ${widget.placaVeiculo}');

                        final sucesso = await context
                            .read<PagamentoProvider>()
                            .salvarPagamento(
                              metodoPagamento: _selectedPaymentMethod!,
                              tempoPermanencia:
                                  widget.tempoPermanencia, // Pegando da tela
                              vagaId: widget.vagaId, // Pegando da tela
                              placaVeiculo:
                                  widget.placaVeiculo, // Pegando da tela
                              numeroCartao:
                                  _cardNumber, // Substituir pelos valores reais
                              nomeTitular:
                                  _cardHolderName, // Substituir pelos valores reais
                              validade:
                                  _cardExpiryDate, // Substituir pelos valores reais
                              cvv: _cardCvv, // Substituir pelos valores reais
                            );

                        if (sucesso) {
                          ConfirmationDialog.show(
                            context,
                            'Pagamento confirmado',
                            'Seu pagamento foi concluído com sucesso!',
                            '/tela-principal',
                          );
                        } else {
                          ConfirmationDialog.show(
                            context,
                            'Erro no pagamento',
                            'Houve um erro ao processar seu pagamento. Tente novamente.',
                            '/tela-principal',
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(343, 52),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('CONFIRMAR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
