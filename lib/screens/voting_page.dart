import 'package:elections_dapp/screens/voting_confirmation_page.dart';
import 'package:elections_dapp/utilities/candidates.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../utilities/voting_button.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CandidateList candidates = CandidateList();
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              for (Candidate i in candidates.getCandidates())
              VotingButton(name: i.name, party: i.party, onP: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => VotingConfirmationPage(name: i.name, party: i.party))));
              })
            ],
          ),
        ),
      ),
    );
  }
}
