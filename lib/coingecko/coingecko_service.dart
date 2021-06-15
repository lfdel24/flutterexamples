import 'dart:convert';

import 'package:flutterexamples/coingecko/coingecko.dart';
import 'package:http/http.dart' as http;

class CoingeckoService {
  String uri =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";

  Future<List<Coingecko>> load() async {
    print('get coin');
    var resp = await http.get(Uri.parse(uri));
    if (resp.statusCode == 200) {
      var json = jsonDecode(resp.body) as List;
      var result = json.map((e) => Coingecko.fromJson(e)).toList();
      return result;
    }
    return [];
  }
}
