import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/coinbase_rest_apis.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Real Time Price Data'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: get_price_from_trading_pair("BTC", "USD"),
            builder: (context, snapshot) {
              var btcToUSDPrice = "0.0";
              if (snapshot.connectionState == ConnectionState.done) {
                btcToUSDPrice = snapshot.data.toString();
                return Text('1 BTC is $btcToUSDPrice USD');
              }
              return Text('1 BTC is $btcToUSDPrice USD');
            },
          ),
        ),
      ),
    );
  }
}
