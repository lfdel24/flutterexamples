import 'package:flutter/material.dart';
import 'package:flutterexamples/animations/animations.dart';
import 'package:flutterexamples/coingecko/coingecko_bloc.dart';
import 'package:flutterexamples/coingecko/coingecko_page.dart';
import 'package:flutterexamples/lista_tareas/lista_tareas_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  void _openPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CustomButton(
              text: 'Example Coingecko',
              onPressed: () => _openPage(
                  context,
                  ChangeNotifierProvider<CoingeckoBLoC>(
                    create: (_) => CoingeckoBLoC(),
                    child: CoingeckoPage(),
                  )),
            ),
            _CustomButton(text: 'Animations', onPressed: () => _openPage(context, AnimationsPage())),
            _CustomButton(text: 'Lista de tareas', onPressed: () => _openPage(context, ListaTareasPage())),
            // _CustomButton(text: 'Material Admin Pro', onPressed: () => _openPage(context, ListaTareasPage())),
          ],
        ),
      )),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        color: Colors.green,
        child: TextButton(
          onPressed: this.onPressed,
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
