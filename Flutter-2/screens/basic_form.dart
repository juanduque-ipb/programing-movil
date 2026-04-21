import 'package:flutter/material.dart';

class BasicForm extends StatefulWidget {
  const BasicForm({super.key});
  @override
  State<StatefulWidget> createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario completo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ingrese  nombre";
                }

                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Nombre: ${nameController.text.toUpperCase()}");
                  }
                },
                child: const Text("Enviar")),
            ElevatedButton(
                onPressed: () {
                  nameController.clear();
                },
                child: const Text("Limpiar"))
          ]),
        ),
      ),
    );
  }
}
