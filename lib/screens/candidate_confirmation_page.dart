import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CandidateConfirmationPage extends StatelessWidget {
  const CandidateConfirmationPage({Key? key, required this.name,required this.aadhaar, required this.party}) : super(key: key);
  final String aadhaar, name, party;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
            width: double.infinity,
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 170,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Congratulations! You Have Successfully Registered!\n\nName: $name\n\nAadhaar Number: $aadhaar\n\nParty: $party',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
            ),
          ),

        ],
      ),
    );
  }
}