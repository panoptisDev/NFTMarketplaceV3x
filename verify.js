const { run } = require("hardhat");

async function main() {
  await verify("0x24724527645623562345234523452345345", []);
}

async function verify(address, args) {
  try {
    return await run("verify:verify", {
      address: address,
      constructorArguments: args,
    });
  } catch (e) {
    console.log(address, args, e);
  }
}

main()
  .then(() => process.exit(0))
  .catch(e => {
    console.error(e);
    process.exit(1);
  });