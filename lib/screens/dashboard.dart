import 'package:bytebank/screens/contacts.dart';
import 'package:bytebank/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _FeatureItem(
                    'Transferências',
                    Icons.monetization_on,
                    onTap: () => _showContacts(context),
                  ),
                  _FeatureItem(
                    'Histórico',
                    Icons.description,
                    onTap: () => _showTransactions(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContacts(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Contacts(),
      ),
    );
  }

  void _showTransactions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Transactions(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const _FeatureItem(this.title, this.icon, {@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () => onTap(),
            child: Container(
              width: 150,
              height: 100,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
