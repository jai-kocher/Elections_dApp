const HDWalletProvider = require("@truffle/hdwallet-provider");
const Web3 = require("web3");
const compiledElection = require("../ethereum/build/Elections.json");
const { mnemonic, url } = require("./credential");
const provider = new HDWalletProvider(mnemonic, url);

const web3 = new Web3(provider);

const deploy = async () => {

  const accounts = await web3.eth.getAccounts();

  console.log("Attempted to deploy from account", accounts[0]);
  

  const result = await new web3.eth.Contract(compiledElection.Election.abi)

    .deploy({ data: compiledElection.Election.evm.bytecode.object,arguments:[10] })
    .send({ gas: "5000000", from: accounts[0] });

  console.log("Contract deployed to", result.options.address);
  provider.engine.stop();
};
deploy();
