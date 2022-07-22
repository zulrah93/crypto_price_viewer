import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/constants.dart';
import 'package:crypto_price_viewer/components/crypto_price_pair.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorA,
          title: const Text('Crypto Real Time Price Data'),
        ),
        body: const CryptoPricePair(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box_rounded),
          backgroundColor: primaryColorA,
          onPressed: () {

          },
        ),
      ),
    );
  }
}
