import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfers/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _appBarTitle = 'Transferências';
const _successSnackbarMessage = 'Transferência adicionada com sucesso!';

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
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget._transfers.length,
          itemBuilder: (context, index) {
            final transfer = widget._transfers[index];
            return TransferListItem(transfer, key: UniqueKey());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return NewTransferForm();
            }),
          ).then(
            (transfer) => _addTransfer(context, transfer),
          );
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
          _successSnackbarMessage,
        ),
      ));
    }
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
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            _formatMoney(_transfer.value),
          ),
        ),
        subtitle: Text(
          _formatAccount(_transfer.accountNumber),
        ),
      ),
    );
  }

  String _formatMoney(double value) {
    final formatted = value.toStringAsFixed(2).replaceAll('.', ',');
    return 'R\$ $formatted';
  }

  String _formatAccount(int account) {
    return 'Nº Conta: $account';
  }
}
