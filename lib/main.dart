import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const ReceitasApp());
}

class ReceitasApp extends StatelessWidget {
  const ReceitasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas Receitas',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}