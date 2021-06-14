import 'package:flutter/material.dart';
import 'package:flutterexamples/coingecko/coin.dart';
import 'package:flutterexamples/coingecko/cryto_service.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coins = CryptoService().getCoins();
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
            future: coins,
            builder: (_, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Crypto USD'),
                    Text(
                      '${snapshot.data!.length} coins',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: coins,
          builder: (_, AsyncSnapshot<List<Coin>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final coin = snapshot.data![index];
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
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
