import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BuilderBody(),
    );
  }
}

class _BuilderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          curve: Curves.bounceIn,
          tween: Tween<double>(begin: 0, end: 200),
          duration: Duration(seconds: 10),
          builder: (_, double value, __) => Container(
            width: value,
            height: 50,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
