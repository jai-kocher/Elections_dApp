// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field

import 'package:elections_dapp/screens/candidate_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import '../provider/metamask.dart';
import '../utilities/constants.dart';

class CandidateLoginPage extends StatefulWidget {
  @override
  State<CandidateLoginPage> createState() => _CandidateLoginPageState();
}

class _CandidateLoginPageState extends State<CandidateLoginPage> {
  String? _aadhaar, _name, _party;

  @override
 

  void addCandidate(String name,String party) async {
    // MetaMaskProvider blockchain= Provider.of<MetaMaskProvider>(context,listen:false);
    // List success=await blockchain.callFunction('addCandidate');
    // final function = blockchain.contract.function('addCandidate');
    // blockchain.ethClient.sendTransaction("",Transaction.callContract(contract: blockchain.contract, function: function, parameters: [name,party]));
  }

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
              'Welcome Candidate!\n',
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
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              style: loginTextStyle,
              obscureText: false,
              decoration: textInputDecoration('Party'),
              onChanged: (value) {
                setState(() {
                  _party = value;
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
                // print(_name);
                // print(_party);
                addCandidate(_name!, _party!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandidateConfirmationPage(
                      name: _name ?? 'John Doe',
                      aadhaar: _aadhaar ?? '123456789012',
                      party: _party ?? 'BJP',
                    ),
                  ),
                );
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
