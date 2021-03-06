class Coingecko {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final String currentPrice;
  final String lastUpdated;

  Coingecko(this.id, this.symbol, this.name, this.image, this.currentPrice, this.lastUpdated);

  String formatCurrenPrice() {
    if (this.currentPrice.length > 6) {
      return this.currentPrice.substring(0, 6);
    }
    return this.currentPrice;
  }

  String formatName() {
    if (this.name.length > 12) {
      return this.name.substring(0, 12);
    }
    return this.name;
  }

  factory Coingecko.fromJson(dynamic json) {
    return Coingecko(
      json['id'],
      json['symbol'],
      json['name'],
      json['image'],
      '${json['current_price']}',
      json['last_updated'],
    );
  }
}
