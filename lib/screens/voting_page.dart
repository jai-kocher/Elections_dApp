import 'package:elections_dapp/screens/voting_confirmation_page.dart';
import 'package:elections_dapp/utilities/candidates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import '../provider/metamask.dart';
import '../utilities/constants.dart';
import '../utilities/voting_button.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  CandidateList candidates = CandidateList();
  @override 
  void initState() {
    getCandidateList();
    super.initState();
  }
  void getCandidateList() async {
    MetaMaskProvider blockchain= Provider.of<MetaMaskProvider>(context,listen:false);
    List candidateAddresses=await blockchain.callFunction('getAllCandidates',[]);

    List<Candidate> tempCan=[];
    for (EthereumAddress candidate in candidateAddresses[0]){
      print('cand - $candidate}' );
      var candidateDetails=await blockchain.callFunction('getCandidateDetails',[candidate]);
      // print(candidateDetails);

     tempCan.add(Candidate(candidateDetails[0], '123456789101112', candidateDetails[1])); 
    }
    setState(() {
      candidates.candidateList=tempCan;
    });
    

  }
  @override
  Widget build(BuildContext context) {
    

    
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
