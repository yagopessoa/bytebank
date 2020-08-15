import 'package:bytebank/components/custom_text_field.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _fullNameLabel = 'Nome completo';
const _fullNameHint = 'Ex: João da Silva';

const _accountLabel = 'Número da conta';
const _accountHint = '0000';

const _confirmButtonText = 'Confirmar';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullNameField = TextEditingController();
  final TextEditingController _accountField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomTextField(
                controller: _fullNameField,
                label: _fullNameLabel,
                hint: _fullNameHint,
              ),
              CustomTextField(
                controller: _accountField,
                label: _accountLabel,
                hint: _accountHint,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text(_confirmButtonText),
                    onPressed: () {
                      final String name = _fullNameField.text;
                      final int account = int.tryParse(_accountField.text);

                      final Contact newContact = Contact(name, account);

                      Navigator.pop(context, newContact);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
