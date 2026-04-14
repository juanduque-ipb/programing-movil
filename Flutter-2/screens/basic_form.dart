import 'package:flutter/material.dart';

class BasicForm extends StatefulWidget {
  const BasicForm({super.key});
  @override
  State<StatefulWidget> createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  String name = "";
  String email = "";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Formulario básico")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
                decoration: const InputDecoration(labelText: "Nombre"),
                onChanged: ((value) => {setState(() => result = value)})),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () =>
                    {setState(() => result = "Nombre: $name !! Email: $email")},
                child: const Text("Mostrar informaciòn")),
            const SizedBox(height: 10),
            Text(result)
          ]),
        ));
  }
}
