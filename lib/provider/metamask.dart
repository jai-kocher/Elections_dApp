import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class MetaMaskProvider extends ChangeNotifier {
  int operatorChain = 4; //means rinkeby
  late String abiFile;
  late DeployedContract contract;

  late Client httpClient;
  late Web3Client ethClient;

  String currentAddress = "";
  String contractAddress = "0x939c28340B60AA6Ff61B46027FEB175Dd094E870";
  final String blockchainUrl =
      "https://rinkeby.infura.io/v3/3c82d03da5814e3bae2a7e59b78a356b";

  int currentChain = -1;

  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == operatorChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {

    abiFile =
        await rootBundle.loadString("../../ethereum/build/Elections.json");
    String _abiCode=jsonEncode(jsonDecode(abiFile)["Election"]["abi"]);
    // print(_abiCode);
    contract = DeployedContract(ContractAbi.fromJson(_abiCode, "Elections"),
        EthereumAddress.fromHex(contractAddress));
    // print(contract);
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await ethereum!.getChainId();
      httpClient = Client();
      ethClient = Web3Client(blockchainUrl, httpClient);

      notifyListeners();
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
  }

  init() {
    

    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        clear();
      });
      ethereum!.onAccountsChanged((accounts) {
        clear();
      });
    }
    
  }

  Future<List<dynamic>> callFunction(String name,List params) async {
    final function = contract.function(name);
    final result = await ethClient
        .call(contract: contract, function: function, params: params);
    print(result);
    return result;
  }
}
