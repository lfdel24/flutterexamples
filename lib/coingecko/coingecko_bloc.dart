import 'package:flutter/material.dart';
import 'package:flutterexamples/coingecko/coingecko.dart';
import 'package:flutterexamples/coingecko/coingecko_service.dart';

class CoingeckoBLoC extends ChangeNotifier {
  final _service = CoingeckoService();
  bool isLoading = false;
  String search = "";
  List<Coingecko> coins = [];

  CoingeckoBLoC() {
    this.load();
  }

  bool contains(Coingecko coin) {
    print(search);
    if (search.isEmpty) {
      return false;
    }
    if (search.contains(coin.name)) {
      return true;
    }
    return false;
  }

  Future<void> load() async {
    this.isLoading = true;
    notifyListeners();
    this.coins = await this._service.load();
    print(this.coins.length);
    this.isLoading = false;
    notifyListeners();
  }
}
