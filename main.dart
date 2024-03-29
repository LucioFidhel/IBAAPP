// main.dart
import 'package:flutter/material.dart';
import 'package:ibaapp/telas/Meus_Relatorio_Lider.dart';

import 'package:ibaapp/telas/Minha_home_page.dart';
import 'package:ibaapp/telas/tela_de_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Flutter',
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            TelaDeLogin(),
            const MinhaHomePage(),
            const MeusRelatoriosLider(),
          ],
        ),
      ),
    );
  }
}
