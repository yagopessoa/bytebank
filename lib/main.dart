import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransfersList(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
        accentColor: Colors.tealAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.tealAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}

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
        title: Text('Criar transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: _accNumberField,
              label: 'Número da conta',
              hint: '0000',
            ),
            CustomTextField(
              controller: _valueField,
              label: 'Valor (R\$)',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text('Confirmar'),
                // color: Colors.blue,
                // textColor: Colors.white,
                onPressed: () => _createTransfer(context),
              ),
            ),
          ],
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

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferListItem(transfer, key: UniqueKey());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return NewTransferForm();
            }),
          );

          future.then((transfer) => _addTransfer(context, transfer));
        },
      ),
    );
  }

  void _addTransfer(context, newTransfer) {
    if (newTransfer != null) {
      setState(() {
        widget._transfers.add(newTransfer);
      });

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'Transferência adicionada com sucesso!',
        ),
      ));
    }
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final String hint;

  const CustomTextField(
      {Key key, this.controller, this.icon, this.label, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferListItem extends StatelessWidget {
  final Transfer _transfer;

  TransferListItem(this._transfer, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transferência: { Conta: $accountNumber, Valor: $value }';
  }
}
