const {ethers} = require("hardhat");

async function main(){
    const [owner] = await ethers.getSigners();
    const BankFactory = await ethers.getContractFactory("Bank");
    const bank = await BankFactory.deploy("ICICI");
    await bank.deployed();
    console.log(`Contract deployed at ${bank.address}`);
    console.log(`Owner address : ${owner.address}`);
}

main()
    .then(()=> process.exit(0))
    .catch((error)=>{
        console.log(error);
        process.exit(1);
    });