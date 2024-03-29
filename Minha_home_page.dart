import 'package:flutter/material.dart';
import 'package:ibaapp/_comum/minhas_cores.dart';

import 'package:ibaapp/drawes/custom_drawer.dart';
import 'package:ibaapp/not_found_screen.dart';
import 'package:ibaapp/telas/LISTAPRESCEN%C3%87A/lista_homens.dart';

import 'package:ibaapp/telas/meus_relatorio_lider.dart';

void main() {
  runApp(const MaterialApp(
    home: MinhaHomePage(),
  ));
}

class MinhaHomePage extends StatefulWidget {
  const MinhaHomePage({Key? key}) : super(key: key);

  @override
  State<MinhaHomePage> createState() => _MinhaHomePageState();
}

class _MinhaHomePageState extends State<MinhaHomePage> {
  final List<String> items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
  ];

  List<Map<String, String>> getMappedItems() {
    return items
        .map((item) =>
            {'text': item, 'image': "assets/download-removebg-preview.png"})
        .toList();
  }

  int totalMembers = 0; // Variável para armazenar o número total de membros

  void updateTotalMembers() {
    // Atualiza o número total de membros
    setState(() {
      totalMembers =
          items.length; // Atualiza o total de membros com o número de itens
    });
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.list),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () => _openDrawer(context),
          ),
        ),
        backgroundColor: MinhasCores.corPrincipal,
        actions: [
          // Mostra o total de membros no AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Total de Membros: $totalMembers',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          List<Map<String, String>> mappedItems = getMappedItems();
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    mappedItems[index]['image']!,
                    height: 80, // ajuste conforme necessário
                  ),
                ),
                const SizedBox(height: 8),
                Text(mappedItems[index]['text']!),
                ElevatedButton(
                  onPressed: () {
                    // Adicione aqui a ação que deseja executar ao clicar no botão
                  },
                  child: Text('Ver Conteúdo'),
                ),
              ],
            ),
          );
        },
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: MinhasCores.corPrincipal,
                title: Text("RELATÓRIO DE MEMBROS ",
                    style: TextStyle(color: TextoCores.textoBranco)),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TextoCores.textoBranco),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotFoundScreen()),
                      );
                      // Adicione aqui o código para lidar com a seleção de membros homens
                    },
                    child: Text("Membros Homens",
                        style: TextStyle(color: MinhasCores.corPrincipal)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TextoCores.textoBranco),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceScreen()),
                      );
                      // Adicione aqui o código para lidar com a seleção de membros mulheres
                    },
                    child: Text(
                      "Membros Mulheres",
                      style: TextStyle(color: MinhasCores.corPrincipal),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.filter_frames, color: Colors.black87),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 6, 1, 20),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MinhaHomePage()),
                    );
                  },
                ),
                const SizedBox(width: 24),
                const SizedBox(width: 24),
                IconButton(
                  icon: const Icon(Icons.person_add_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeusRelatoriosLider()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
