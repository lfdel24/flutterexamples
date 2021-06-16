import 'package:flutter/material.dart';
import 'package:flutterexamples/coingecko/coingecko_bloc.dart';
import 'package:flutterexamples/coingecko/coingecko_widgets.dart';
import 'package:flutterexamples/coingecko/debouncer.dart';
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
                    Text('Coingecko US\$'),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Text('${bloc.coinsWhitFilter.length} items', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 8),
                      ],
                    ),
                  ],
                )),
      ),
      body: SafeArea(
        child: Consumer<CoingeckoBLoC>(builder: (_, bloc, ___) {
          return bloc.isLoading ? CustomCPI() : _ListViewBuilder(bloc: bloc);
        }),
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  final CoingeckoBLoC bloc;

  const _ListViewBuilder({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _CustomTextField(bloc: bloc),
          ListView.builder(
              shrinkWrap: true,
              itemCount: bloc.coinsWhitFilter.length,
              itemBuilder: (_, index) {
                final coin = bloc.coinsWhitFilter[index];
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
              }),
        ],
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({Key? key, required this.bloc}) : super(key: key);

  final CoingeckoBLoC bloc;

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(250);
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.search),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Search'),
              onChanged: (value) {
                debouncer.run(() {
                  bloc.onSearch(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
