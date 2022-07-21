import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/coinbase_rest_apis.dart';
import 'package:crypto_price_viewer/components/crypto_price_pair.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('Crypto Real Time Price Data'),
        ),
        body: const CryptoPricePair(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box_rounded),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
              
          },
        ),
      ),
    );
  }
}
