require("@nomicfoundation/hardhat-toolbox");
require("dotenv/config")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url : `${process.env.POKT_RINKEBY_URL}`,
      accounts : [`${process.env.RINKEBY_PRIVATE_KEY}`]
    }
  }
};
