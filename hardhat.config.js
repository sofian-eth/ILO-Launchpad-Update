require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.6.12",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000
      }
    }
  },
  etherscan: {
    apiKey: "VSRKRGYCCRJ6IS29YXWR4NZ2B9PF3685DA",
  },
  networks: {
    hardhat: {
    },
    bnbtestnet: {
      url: "https://bsc-testnet.publicnode.com",
      accounts: ["521e0d635173d1f2d962549dddb3fe734c14f629629ff5b4c0579ae054fb19fc"]
    }
  }
};
