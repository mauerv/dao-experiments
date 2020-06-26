const LeanBouncerDAO = artifacts.require("LeanBouncerDAO");

module.exports = function(deployer) {
  deployer.deploy(LeanBouncerDAO);
};
