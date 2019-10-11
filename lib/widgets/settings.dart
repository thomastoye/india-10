import 'package:flutter/material.dart';
class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(hintText: 'Naam'),
      ),
    );
  }
}