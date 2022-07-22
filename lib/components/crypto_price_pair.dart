import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/constants.dart';
import 'package:crypto_price_viewer/coinbase_rest_apis.dart';

class CryptoPricePair extends StatefulWidget {
  const CryptoPricePair({Key? key}) : super(key: key);
  @override
  State<CryptoPricePair> createState() => _CryptoPricePairState();
}

class _CryptoPricePairState extends State<CryptoPricePair> {
  var _baseCurrency = 'BTC';
  var _fiatCurrency = 'USD';
  var baseToFiatPrice = "0.0";

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => setState(() {
              get_price_from_trading_pair("$_baseCurrency", "$_fiatCurrency")
                  .then((newPrice) => baseToFiatPrice = newPrice);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: primaryColorB,
          border: Border.all(
              color: primaryColorA, style: BorderStyle.solid, width: 2.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<List<String>>(
            future: get_all_coins_and_tokens(),
            builder: (context, snapshot) {
                return DropdownButton<String>(
                  value: _baseCurrency,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: primaryColorA, fontWeight: FontWeight.bold),
                  underline: Container(
                    height: 2,
                    color: primaryColorA,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _baseCurrency = newValue!;
                    });
                  },
                  items: snapshot.data
                      ?.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
            },
          ),
          const Text("➡",
              style:
                  TextStyle(color: primaryColorA, fontWeight: FontWeight.bold)),
          FutureBuilder<List<String>>(
            future: get_all_fiat_currencies(),
            builder: (context, snapshot) {
                return DropdownButton<String>(
                  value: _fiatCurrency,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: primaryColorA, fontWeight: FontWeight.bold),
                  underline: Container(
                    height: 2,
                    color: primaryColorA,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fiatCurrency = newValue!;
                    });
                  },
                  items: snapshot.data
                      ?.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
            },
          ),
          const Text(" = [",
              style:
                  TextStyle(color: primaryColorA, fontWeight: FontWeight.bold)),
          FutureBuilder<String>(
            future:
                get_price_from_trading_pair("$_baseCurrency", "$_fiatCurrency"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                baseToFiatPrice = snapshot.data.toString();
                return Text('1 $_baseCurrency is $baseToFiatPrice $_fiatCurrency',
                    style: TextStyle(
                        color: primaryColorA, fontWeight: FontWeight.bold));
              }
              return Text('1 $_baseCurrency is $baseToFiatPrice $_fiatCurrency',
                  style: TextStyle(
                      color: primaryColorA, fontWeight: FontWeight.bold));
            },
          ),
          const Text(" ]",
              style:
                  TextStyle(color: primaryColorA, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
