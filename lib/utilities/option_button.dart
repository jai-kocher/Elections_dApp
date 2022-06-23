// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'constants.dart';

class OptionButton2 extends StatelessWidget {
  const OptionButton2({required this.textData, required this.destination});

  final String textData;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(200, 80),
        primary: appColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: (() {
        Navigator.pushNamed(context, destination);
      }),
      child: Text(
        textData,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
