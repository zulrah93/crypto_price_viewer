import 'package:http/http.dart' as http;
import 'dart:convert' as decoder;

//Returns all fiat currencies this excludes coins and tokens like BTC or ADA
Future<List<String>> get_all_fiat_currencies() async {
      var restEndPoint = "https://api.coinbase.com/v2/currencies";
      var response = await http.get(Uri.parse(restEndPoint));
      var jsonResponse =
      decoder.jsonDecode(response.body) as Map<String, dynamic>;
      return List.filled(1, ""); // TODO: Build list of fiat currencies from jsonResponse
}

//Get's the trading pair price for example BTC to USD will return the price of BTC in USD.
Future<String> get_price_from_trading_pair(String baseCurrency, String fiatCurrency) async {
  var tradingPair = "$baseCurrency-$fiatCurrency";
  var restEndpoint = "https://api.coinbase.com/v2/prices/$tradingPair/sell";
  var response = await http.get(Uri.parse(restEndpoint));
  var jsonResponse =
  decoder.jsonDecode(response.body) as Map<String, dynamic>;
  return jsonResponse['data']['amount'];
}