const hre = require('hardhat');

async function main() {
  const Market = await hre.ethers.getContractFactory('MarketplaceV3x');
  const market = await Market.deploy(
    _pluginMap_address,
    _defaultAdmin_address,
    _contractURI_string,
    [_trustedForwarder1_address, _trustedForwarder2_address],
    _platformFeeRecipient_address,
    _platformFeeBps_number,
    _nftCollection1_address,
    _nftCollection2_address,
    _nftCollection3_address,
    _nftCollection4_address,
    _nftCollection5_address
  );
  await market.deployed();
  console.log('Market deployed to:', market.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);

  });
