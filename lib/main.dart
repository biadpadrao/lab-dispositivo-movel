import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DivideConta()));
}

class DivideConta extends StatefulWidget {
  const DivideConta({super.key});

  @override
  State<DivideConta> createState() => _DivideContaState();
}

class _DivideContaState extends State<DivideConta> {
  TextEditingController valorTotal = TextEditingController();
  TextEditingController numPessoas = TextEditingController();
  String resposta1 = "Taxa de serviço:";
  String resposta2 = "Valor total com taxa:";
  String resposta3 = "Valor por pessoa:";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divide Conta"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: [
            TextField(
              controller: numPessoas,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Número de pessoas",
                  labelStyle: TextStyle(fontSize: 22)),
            ),
            TextField(
              controller: valorTotal,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 22, color: Colors.grey),
              decoration: InputDecoration(
                  labelText: "Valor total da conta",
                  labelStyle: TextStyle(fontSize: 22)),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
              onPressed: calcular,
              child: Text("Calcular"),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(resposta1),
            Text(resposta2),
            Text(resposta3),
          ],
        ));
  }

  calcular() {
    double taxaServico = double.parse(valorTotal.text) * 0.1; // 10% de serviço
    double valorComTaxa =
        taxaServico + double.parse(valorTotal.text); // Valor total com taxa

    double valorPessoa = valorComTaxa /
        (double.parse(numPessoas.text)); // Valor por pessoa + 10%

    setState(() {
      resposta1 = "Taxa de serviço: " + taxaServico.toStringAsFixed(2);
      resposta2 = "Valor total com taxa: " + valorComTaxa.toStringAsFixed(2);
      resposta3 = "Valor por pessoa: " + valorPessoa.toStringAsFixed(2);
    });
  }
}
