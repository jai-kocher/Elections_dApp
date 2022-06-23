import 'package:elections_dapp/utilities/constants.dart';
import 'package:flutter/material.dart';
//import 'package:elections_dapp/provider/metamask.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('gi');
    // final metaMaskProvider = Provider.of<MetaMaskProvider>(context);
    // if (metaMaskProvider.isEnabled && metaMaskProvider.isInOperatingChain) {
    //   print('connected');
    //   print(metaMaskProvider.currentAddress);
    //   print('thats the address');
    // } else if (metaMaskProvider.isConnected &&
    //     !metaMaskProvider.isInOperatingChain) {
    //   print('Wrong chain please connect to ${metaMaskProvider.operatorChain}');
    // } else if (metaMaskProvider.isEnabled) {
    //   print('check your metamask');
    // }

    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 100,
            ),
            Text(
              'WELCOME TO THE ELECTIONS!\n',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            OptionButton(
              textData: 'ENTER AS VOTER!',
              nextPage: '/voterlogin',
            ),
            SizedBox(
              height: 40,
            ),
            OptionButton(
              textData: 'ENTER AS CANDIDATE!',
              nextPage: '/candidatelogin',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({Key? key, required this.textData, required this.nextPage}): super(key: key);

  final String textData;
  final String nextPage;

  @override
  Widget build(BuildContext context) {
    //final metaMaskProvider = Provider.of<MetaMaskProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 50),
        primary: appColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: (() async {
        // await metaMaskProvider.connect();
        Navigator.pushNamed(context, nextPage);
        //print('hi');
      }),
      child: Text(
        textData,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
