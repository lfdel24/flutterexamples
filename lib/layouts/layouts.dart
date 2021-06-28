import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { Increment }

int counterReducer(int state, action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

void main() {
  runApp(FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget {
  final store = Store(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Redux Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: title,
      home: StoreProvider(
        store: store,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You have pushed the button this many times:',
                ),
                _BuildText()
              ],
            ),
          ),
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, int>(
      converter: (store) => store.state,
      builder: (context, count) => Column(
        children: [
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.button,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.overline,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
