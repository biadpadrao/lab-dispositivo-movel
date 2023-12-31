import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  final String nome;
  final String numeroCelular;

  Contact({required this.nome, required this.numeroCelular});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(nome: 'João', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Maria', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Laura', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Lucas', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Pedro', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Douglas', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Joana', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Antonio', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Artur', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Felipe', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Luiza', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Sofia', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Maurício', numeroCelular: '+55 31 12345-6789'),
    Contact(nome: 'Alexandre', numeroCelular: '+55 31 98765-4321'),
    Contact(nome: 'Edu', numeroCelular: '+55 31 12345-6789'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('foto.png'),
            ),
            title: Text(contact.nome),
            subtitle: Text(contact.numeroCelular),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.nome),
      ),
      body: Center(
        child: Text(
          'Número de telefone: ${contact.numeroCelular}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
