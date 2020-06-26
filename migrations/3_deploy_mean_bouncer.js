const MeanBouncerDAO = artifacts.require("MeanBouncerDAO");

module.exports = function(deployer) {
  deployer.deploy(MeanBouncerDAO);
};
