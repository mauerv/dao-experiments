const BouncerDAO = artifacts.require("BouncerDAO");

module.exports = function(deployer) {
  deployer.deploy(BouncerDAO);
};
