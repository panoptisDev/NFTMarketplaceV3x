
### Deploying to Polygon

In this example, replace "YOUR_API_KEY" with your actual Etherscan API key. You can obtain an API key by creating an account on the Etherscan website (https://etherscan.io/) and generating an API key from your account settings.

Save this configuration file as hardhat.config.js in the root directory of your Hardhat project. Make sure to install the necessary packages (@nomicfoundation/hardhat-toolbox, hardhat, and hardhat-ethers) by running npm install or yarn install.

Now you can use Hardhat with the Polygon networks by running commands like npx hardhat --network mainnet <task> or npx hardhat --network mumbai <task>, where <task> represents the specific task or command you want to execute.