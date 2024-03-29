import 'package:flutter/material.dart';

class Member {
  String name;
  String lastName;
  String email;
  String gender;
  String maritalStatus;
  DateTime birthDate;
  String phone;
  String cep;
  String street;
  String houseNumber;
  String neighborhood;
  String city;
  String notes;

  Member({
    required this.name,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.maritalStatus,
    required this.birthDate,
    required this.phone,
    required this.cep,
    required this.street,
    required this.houseNumber,
    required this.neighborhood,
    required this.city,
    required this.notes,
  });

  // get isPresent => null; // Remova esta linha
}

class MemberListWidget extends StatefulWidget {
  final List<Member> members;

  const MemberListWidget({Key? key, required this.members}) : super(key: key);

  @override
  _MemberListWidgetState createState() => _MemberListWidgetState();
}

class _MemberListWidgetState extends State<MemberListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          widget.members.length + 1, // +1 para a linha do total de membros
      itemBuilder: (context, index) {
        if (index == widget.members.length) {
          // Última linha para mostrar o total de membros
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 1, 41),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                'Total de Membros: ${widget.members.length}',
                style: TextStyle(color: Color.fromARGB(255, 250, 248, 248)),
              ),
            ),
          );
        }
        Member member = widget.members[index];
        return ListTile(
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 4, 2, 94)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${member.name} ${member.lastName}',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  member.email,
                  style: TextStyle(color: const Color.fromARGB(255, 8, 0, 0)),
                ),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  // editarMember(index);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    widget.members.removeAt(index);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.green),
                onPressed: () {
                  // Ação ao clicar no ícone de visualização
                  print("Conteúdo do membro visualizado: ${member.name}");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MeusRelatoriosLider extends StatefulWidget {
  const MeusRelatoriosLider({Key? key});

  @override
  State<MeusRelatoriosLider> createState() => _MeusRelatoriosLiderState();
}

class _MeusRelatoriosLiderState extends State<MeusRelatoriosLider> {
  List<Member> members = [
    Member(
      name: 'João',
      lastName: 'Silva',
      email: 'joao@example.com',
      gender: 'Masculino',
      maritalStatus: 'Solteiro(a)',
      birthDate: DateTime(1990, 1, 1),
      phone: '999999999',
      cep: '12345-678',
      street: 'Rua Exemplo',
      houseNumber: '123',
      neighborhood: 'Bairro Exemplo',
      city: 'Cidade Exemplo',
      notes: 'Notas sobre o membro...',
    ),
    // Adicione outros membros aqui...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTA DE MEMBROS'),
      ),
      body: MemberListWidget(members: members),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _adicionarMembro(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarMembro(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // Implemente o código do diálogo para adicionar um novo membro aqui
        return AlertDialog(
          title: Text('Adicionar Membro'),
          content: Text('Conteúdo do diálogo para adicionar um novo membro'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Adicionar lógica para adicionar um novo membro aqui
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MeusRelatoriosLider(),
  ));
}
