import 'package:flutter/material.dart';
import 'receita.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({
    super.key,
    required this.receita,
  });

  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.titulo),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receita.titulo,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              receita.descricao,
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 25),

            const Text(
              'Ingredientes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            for (String ingrediente in receita.ingredientes)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '• $ingrediente',
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            const Text(
              'Modo de preparo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              receita.preparo,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}