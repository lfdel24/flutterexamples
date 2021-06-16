import 'package:flutter/material.dart';
import 'package:flutterexamples/coingecko/coingecko.dart';
import 'package:flutterexamples/coingecko/coingecko_service.dart';

class CoingeckoBLoC extends ChangeNotifier {
  final _service = CoingeckoService();
  bool isLoading = false;
  String _search = "";
  List<Coingecko> _coins = [];
  List<Coingecko> coinsWhitFilter = [];

  CoingeckoBLoC() {
    this.load();
  }

  void onSearch(String value) {
    this._search = value;
    _apliccateFilter();
    notifyListeners();
  }

  void _apliccateFilter() {
    this.coinsWhitFilter = this._coins.where((coin) => _filter(coin)).toList();
  }

  bool _filter(Coingecko coin) {
    return coin.name.toLowerCase().contains(this._search.toLowerCase());
  }

  Future<void> load() async {
    this.isLoading = true;
    notifyListeners();
    this._coins = await this._service.load();
    this.coinsWhitFilter = this._coins;
    print(this._coins.length);
    this.isLoading = false;
    notifyListeners();
  }
}
