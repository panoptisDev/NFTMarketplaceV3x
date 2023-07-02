![alt text](https://iili.io/HI49K6G.png)

Progress 95%
fork it if you want to help me finish this project.

# MarketplaceV3x
im rewriting the marketplace contract to use 5 nft collections instead of only 1


### Deploying to Polygon

1. Create a `.env` file in the root directory of the project
2. Add the following variables to the `.env` file:
MNEMONIC=<your mnemonic>
API_KEY=<your polygonscan api key>

### Setup

Nomic foundation released a new version of hardhat (2.15.0)

npm install -g yarn
yarn add --dev hardhat @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers
---

### Compile
npx hardhat compile

### Deploy
npx hardhat run scripts/deploy.js --network mumbai

### Verify
npx hardhat verify --network mumbai <address> <unlock time>
---

npm install -g yarn
yarn add --dev hardhat @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers
---
### Verify script
node verify.js --network <network-name> 

---
### Arguments

The MarketplaceV3x contract has 11 constructor arguments:
replace placeholder with address of the contract

address _pluginMap
address _defaultAdmin
string memory _contractURI
address[] memory _trustedForwarders
address _platformFeeRecipient
uint16 _platformFeeBps
address _nftCollection1
address _nftCollection2
address _nftCollection3
address _nftCollection4
address _nftCollection5

Please note that the address _pluginMap parameter is not part of the initialize function, but it is passed to the constructor of RouterImmutable which MarketplaceV3x inherits from.
---

