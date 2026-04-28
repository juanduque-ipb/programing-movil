import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<StatefulWidget> createState() => _ContactForm();
}

class _ContactForm extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // String | Null

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obligatorio";
    }

    if (value.length < 6) {
      return "Mínimo 6 caracteres";
    }

    if (value.length > 30) {
      return "Máximo 30 caracteres";
    }

    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Campo obligatorio";
    if (int.tryParse(value) == null) return "Solo números permitidos";
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Nombre Completo: ${fullNameController.text}");
      print("Teléfono: ${phoneController.text}");
    }
  }

  void _clearForm() {
    fullNameController.clear();
    phoneController.clear();
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                    labelText: "Nombre completa", border: OutlineInputBorder()),
                validator: _validateFullName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                    labelText: "Teléfono", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: _validatePhone,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: _submitForm, child: const Text("Enviar"))),
                  const SizedBox(width: 20),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: _clearForm,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text("Limpiar",
                        style: TextStyle(color: Colors.white)),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
