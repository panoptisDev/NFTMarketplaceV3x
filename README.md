
### Deploying to Polygon

In this example, replace "YOUR_API_KEY" with your actual Etherscan API key. You can obtain an API key by creating an account on the Etherscan website (https://etherscan.io/) and generating an API key from your account settings.

Save this configuration file as hardhat.config.js in the root directory of your Hardhat project. Make sure to install the necessary packages (@nomicfoundation/hardhat-toolbox, hardhat, and hardhat-ethers) by running npm install or yarn install.

Now you can use Hardhat with the Polygon networks by running commands like npx hardhat --network mainnet <task> or npx hardhat --network mumbai <task>, where <task> represents the specific task or command you want to execute.



### Setup


### Compile
npx hardhat compile

### Deploy
npx hardhat run scripts/deploy.js --network mumbai

### Verify
npx hardhat verify --network mumbai <address> <unlock time>
---

### got error code
```
npx hardhat run scripts/deploy.js --network mumbai

TypeError: (0 , ethers_1.getAddress) is not a function
    at new HardhatEthersSigner (/home/koko/NFTMarketplaceV3x/node_modules/@nomicfoundation/hardhat-ethers/src/signers.ts:73:30)
    at Function.create (/home/koko/NFTMarketplaceV3x/node_modules/@nomicfoundation/hardhat-ethers/src/signers.ts:65:12)
    at getSigner (/home/koko/NFTMarketplaceV3x/node_modules/@nomicfoundation/hardhat-ethers/src/internal/helpers.ts:60:29)
    at async Promise.all (index 0)
    at getSigners (/home/koko/NFTMarketplaceV3x/node_modules/@nomicfoundation/hardhat-ethers/src/internal/helpers.ts:45:30)
    at getContractFactoryByAbiAndBytecode (/home/koko/NFTMarketplaceV3x/node_modules/@nomicfoundation/hardhat-ethers/src/internal/helpers.ts:305:21)
    at main (/home/koko/NFTMarketplaceV3x/scripts/deploy.js:5:26)

```
### solution
Nomic foundation released a new version of hardhat (2.15.0)
Try:
npm install -g yarn
yarn add --dev hardhat @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers
---