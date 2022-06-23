const path=require('path');
const solc=require('solc');
const fs=require("fs-extra");

const buildPath=path.resolve(__dirname,"build");
fs.removeSync(buildPath);

const electionPath=path.resolve(__dirname,'contracts','Elections.sol');
const electionSource=fs.readFileSync(electionPath,"utf8");

const input={
    language:"Solidity",
    sources:{
        "Elections.sol":{
            content:electionSource
        },
    },
    settings:{
        outputSelection:{
            "*":{
                "*":["*"],
            }
        },
    }
}
fs.ensureDirSync(buildPath);
var output=JSON.parse(solc.compile(JSON.stringify(input))).contracts;

for (let contract in output){
    fs.outputJSONSync(
        path.resolve(buildPath,contract.replace('.sol','')+'.json'),
        output[contract]
    );
    console.log(contract);
}
