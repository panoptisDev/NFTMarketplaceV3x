require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const PRIVATE_KEY = process.env.PRIVATE_KEY || "";
const API_KEY = process.env.API_KEY || "YOUR_API_KEY";

module.exports = {
  networks: {
    polygon: {
      url: "https://polygon-mainnet-rpc.com",
      accounts: [PRIVATE_KEY],
      gasPrice: 3000000, // Adjust the gas price as needed
    },
    mumbai: {
      url: "https://rpc.ankr.com/polygon_mumbai",
      accounts: [PRIVATE_KEY],
      gasPrice: 30000000, // Adjust the gas price as needed
    },
  },
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  paths: {
    artifacts: "./artifacts",
    cache: "./cache",
    sources: "./contracts",
    tests: "./test",
  },
  mocha: {
    timeout: 20000,
  },
  etherscan: {
    apiKey: API_KEY,
  },
};
