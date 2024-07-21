var BloodExams = artifacts.require("BloodExams");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(BloodExams);
};
