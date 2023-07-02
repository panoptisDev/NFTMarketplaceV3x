const { ethers, upgrades } = require("hardhat");

async function main() {
  // Deploy the MarketplaceV3x contract
  const MarketplaceV3x = await ethers.getContractFactory("MarketplaceV3x");
  const marketplaceV3x = await upgrades.deployProxy(MarketplaceV3x);

  await marketplaceV3x.deployed();

  console.log("MarketplaceV3x deployed to:", marketplaceV3x.address);

  // Verify the contract on Etherscan
  if (network.name !== "hardhat") {
    await hre.run("verify:verify", {
      address: marketplaceV3x.address,
      constructorArguments: [],
    });
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);

  });
  