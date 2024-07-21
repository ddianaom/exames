var DigitalMarketplace = artifacts.require("DigitalMarketplace");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(DigitalMarketplace);
};
