import 'package:bytebank/screens/dashboard/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Yagão da Massa',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                subtitle: Text(
                  '7339',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
