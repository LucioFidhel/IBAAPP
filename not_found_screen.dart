// not_found_screen.dart
import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página não encontrada'),
      ),
      body: const Center(
        child: Text('A rota solicitada não foi encontrada.'),
      ),
    );
  }
}
