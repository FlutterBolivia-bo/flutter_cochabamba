import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Widget content;

  CustomCard({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: content,
      ),
    );
  }
}
