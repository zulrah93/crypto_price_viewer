import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/constants.dart';
import 'package:crypto_price_viewer/components/crypto_price_pair.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pricePairs = [const CryptoPricePair()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      debugShowCheckedModeBanner:
          false, // Rather not show to user that the build is in debug mode
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColorA,
            title: const Text('Crypto Real Time Price Data')),
        body: ListView.builder(
            itemCount: pricePairs.length,
            itemBuilder: (BuildContext context, int index) {
              return pricePairs[index];
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box_rounded),
          backgroundColor: primaryColorA,
          onPressed: () {
            setState(() {
              pricePairs.add(const CryptoPricePair());
            });
          },
        ),
      ),
    );
  }
}
