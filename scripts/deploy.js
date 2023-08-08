const { ethers } = require("hardhat");
// const ethers = require("ethers");

async function main() {
  const Contract = await ethers.getContractFactory("InvestmentsInfo")

  const contract = await Contract.deploy();
  await contract.waitForDeployment();

  debugger

  console.log(`Info deployed to: ${contract.target}`);

  debugger

  const address = contract.getAddress();
  
  const Factory = await ethers.getContractFactory("InvestmentsFactory");
  const factory = await Factory.deploy(contract.target);

  await factory.waitForDeployment();

  console.log(`Factory deployed to: ${factory.target}`);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
