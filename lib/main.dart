//import 'package:elections_dapp/provider/metamask.dart';
//import 'package:provider/provider.dart';
import 'package:elections_dapp/provider/metamask.dart';
import 'package:elections_dapp/screens/candidate_registration_page.dart';
import 'package:elections_dapp/screens/voter_login_page.dart';
import 'package:elections_dapp/screens/voting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/all.dart';

void main() {
  runApp(const ElectionsdApp());
}

class ElectionsdApp extends StatelessWidget {
  const ElectionsdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => MetaMaskProvider(),
      child: MaterialApp(
        title: 'Elections dApp',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
          fontFamily: 'Bebas Neue',
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            toolbarHeight: 40,
            color: Colors.black,
          ),
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/voterlogin': (context) => VoterLoginPage(),
          '/candidatelogin': (context) => CandidateLoginPage(),
          '/voting': (context) => VotingPage(),
        },
        initialRoute: '/home',
      ),
    );
  }
}
