import 'package:http/http.dart' as http;
import 'dart:convert' as decoder;

//Returns all fiat currencies this excludes coins and tokens like BTC or ADA
Future<List<String>> get_all_fiat_currencies() async {
  var restEndPoint = "https://api.coinbase.com/v2/currencies";
  var response = await http.get(Uri.parse(restEndPoint));
  var jsonResponse = decoder.jsonDecode(response.body) as Map<String, dynamic>;
  var fiatInfos = jsonResponse['data'];
  var amountOfFiats = fiatInfos.length;
  var fiats = <String>[];
  for (var i = 0; i < amountOfFiats; i++) {
    fiats.add(fiatInfos[i]["id"]);
  }
  return fiats;
}

//Get's the trading pair price for example BTC to USD will return the price of BTC in USD.
Future<String> get_price_from_trading_pair(
    String baseCurrency, String fiatCurrency) async {
  var tradingPair = "$baseCurrency-$fiatCurrency";
  var restEndpoint = "https://api.coinbase.com/v2/prices/$tradingPair/sell";
  var response = await http.get(Uri.parse(restEndpoint));
  var jsonResponse = decoder.jsonDecode(response.body) as Map<String, dynamic>;
  return jsonResponse['data']['amount'];
}

//Returns all coins/tokens that are available to trade on the Coinbase exchange.
Future<List<String>> get_all_coins_and_tokens() async {
  var restEndPoint = "https://api.pro.coinbase.com/currencies";
  var response = await http.get(Uri.parse(restEndPoint));
  var coinInfos = decoder.jsonDecode(response.body) as List<dynamic>;
  var amountOfFiats = coinInfos.length;
  var coins = <String>[];
  for (var i = 0; i < amountOfFiats; i++) {
    coins.add(coinInfos[i]["id"]);
  }
  return coins;
}
