// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class VoterLoginPage extends StatefulWidget {
  @override
  State<VoterLoginPage> createState() => _VoterLoginPageState();
}

class _VoterLoginPageState extends State<VoterLoginPage> {

  String? _aadhaar, _name, _password, _pno, _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME VOTER!\n',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            TextField(
              cursorColor: Colors.white,
              style: loginTextStyle,
              obscureText: false,
              decoration: textInputDecoration('Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.white,
              style: loginTextStyle,
              obscureText: false,
              decoration: textInputDecoration('Aadhaar Number'),
              onChanged: (value) {
                setState(() {
                  _aadhaar = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: loginTextStyle,
              obscureText: false,
              decoration: textInputDecoration('Phone Number'),
              onChanged: (value) {
                setState(() {
                  _pno = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.white,
              style: loginTextStyle,
              obscureText: true,
              decoration: textInputDecoration('Password'),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(110, 50),
                primary: appColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: (() async {
                Navigator.pushNamed(context, '/voting');
              }),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textInputDecoration(typeText) {
    return InputDecoration(
      labelText: typeText,
      labelStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Bebas Neue',
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: appColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
