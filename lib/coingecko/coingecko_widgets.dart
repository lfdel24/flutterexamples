import 'package:flutter/material.dart';

class CustomNoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No items,',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

class CustomCPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
