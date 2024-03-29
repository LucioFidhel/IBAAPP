// ignore: file_names
// tela1.dart
// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:ibaapp/componentes/decoracao.dart';
import 'package:ibaapp/telas/Minha_Home_Page.dart';

class TelaDeLogin extends StatefulWidget {
  TelaDeLogin({super.key});

  @override
  State<TelaDeLogin> createState() => _Tela1State();
}

class _Tela1State extends State<TelaDeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/LOGO ALINÇA OFICIAL.png",
                        height: 100,
                        width: 50,
                      ),
                      const Text(
                        "",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("E-MAIL"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: getAuthenticationInputDecoration("SENHA"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MinhaHomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 15, 2, 46),
                        ),
                        child: const Text(
                          "ENTRA",
                          style: TextStyle(
                              color: Color.fromARGB(255, 252, 250, 250)),
                        ),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {},
                        child: const Text("AINDA NÃO TEM CONTA ? CADASTRAR"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
