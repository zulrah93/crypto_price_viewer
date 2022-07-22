import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/constants.dart';
import 'package:crypto_price_viewer/coinbase_rest_apis.dart';

class CryptoPricePair extends StatefulWidget {
  const CryptoPricePair({Key? key}) : super(key: key);
  @override
  State<CryptoPricePair> createState() => _CryptoPricePairState();
}

class _CryptoPricePairState extends State<CryptoPricePair> {
  String _baseCurrency = 'BTC';
  String _fiatCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width - 20,
        color: primaryColorB,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<String>>(
              future: get_all_coins_and_tokens(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return DropdownButton<String>(
                    value: _baseCurrency,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: primaryColorA, fontWeight: FontWeight.bold),
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
                } else {
                  return const Text("ERROR");
                }
              },
            ),
            const Text("➡", style: TextStyle(color: primaryColorA, fontWeight: FontWeight.bold)),
            FutureBuilder<List<String>>(
              future: get_all_fiat_currencies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return DropdownButton<String>(
                    value: _fiatCurrency,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: primaryColorA, fontWeight: FontWeight.bold),
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
                } else {
                  return const Text("ERROR");
                }
              },
            ),
            const Text(" = [", style: TextStyle(color: primaryColorA, fontWeight: FontWeight.bold)),
            FutureBuilder<String>(
              future: get_price_from_trading_pair(
                  "$_baseCurrency", "$_fiatCurrency"),
              builder: (context, snapshot) {
                var btcToUSDPrice = "0.0";
                if (snapshot.connectionState == ConnectionState.done) {
                  btcToUSDPrice = snapshot.data.toString();
                  return Text(
                      '1 $_baseCurrency is $btcToUSDPrice $_fiatCurrency', style: TextStyle(color: primaryColorA, fontWeight: FontWeight.bold));
                }
                return Text("ERROR");
              },
            ),
            const Text(" ]", style: TextStyle(color: primaryColorA, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
