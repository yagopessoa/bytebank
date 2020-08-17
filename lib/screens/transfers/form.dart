import 'package:bytebank/components/custom_text_field.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _appBarTitle = 'Criar transferências';

const _accountLabel = 'Número da conta';
const _accountHint = '0000';

const _valueLabel = 'Valor (R\$)';
const _valueHint = '0.00';

const _confirmButtonText = 'Confirmar';

class NewTransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewTransferFormState();
  }
}

class NewTransferFormState extends State<NewTransferForm> {
  final TextEditingController _accNumberField = TextEditingController();
  final TextEditingController _valueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomTextField(
                controller: _accNumberField,
                label: _accountLabel,
                hint: _accountHint,
              ),
              CustomTextField(
                controller: _valueField,
                label: _valueLabel,
                hint: _valueHint,
                icon: Icons.monetization_on,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text(_confirmButtonText),
                    onPressed: () => _createTransfer(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accNumber = int.tryParse(_accNumberField.text);
    final double value = double.tryParse(_valueField.text);

    if (accNumber != null && value != null) {
      final newTransfer = Transfer(value, accNumber);
      Navigator.pop(context, newTransfer);
    }
  }
}
