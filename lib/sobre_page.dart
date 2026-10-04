import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),

      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sobre o aplicativo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Minhas Receitas é um aplicativo desenvolvido '
              'em Flutter para organizar e visualizar receitas '
              'doces, salgadas e bebidas.',
              style: TextStyle(
                fontSize: 17,
                height: 1.5,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Projeto desenvolvido para a disciplina '
              'de Programação Avançada II.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}