import 'dart:convert';

import 'package:flutterexamples/coingecko/coin.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  String uri =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";

  Future<List<Coin>> getCoins() async {
    print('get coin');
    var resp = await http.get(Uri.parse(uri));
    if (resp.statusCode == 200) {
      var json = jsonDecode(resp.body) as List;
      var result = json.map((e) => Coin.fromJson(e)).toList();
      return result;
    }
    return [];
  }
}
