import 'package:flutter/material.dart';
import 'package:flutterexamples/coingecko/coingecko_bloc.dart';
import 'package:provider/provider.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CoingeckoBLoC>(
            builder: (_, bloc, ___) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Coingecko US '),
                    Text('${bloc.coins.length} items', style: TextStyle(fontSize: 12)),
                  ],
                )),
      ),
      body: SafeArea(
        child: Consumer<CoingeckoBLoC>(builder: (_, bloc, ___) {
          if (bloc.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return bloc.coins.length == 0
                ? Text('No items')
                : ListView.builder(
                    itemCount: bloc.coins.length,
                    itemBuilder: (_, index) {
                      final coin = bloc.coins[index];
                      return ListTile(
                        leading: Text('${index + 1}'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Image.network(coin.image),
                            ),
                            SizedBox(width: 10),
                            Text(coin.formatName()),
                          ],
                        ),
                        trailing: Text(
                          coin.formatCurrenPrice(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  );
          }
        }),
      ),
    );
  }
}
