// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.6.9;
/**
 * My third iteration of BouncerDAO. Remove array anti-patterns.
 */

 import "@openzeppelin/contracts/access/Ownable.sol";

contract LeanBouncerDAO is Ownable {
	address[] public applications;
	mapping(address => bool) public members;
	mapping(address => bool) public rejected;
	mapping(address => bool) public applicants;

	constructor() public {
    	members[msg.sender] = true;
	}

	function requestMembership() external {
		require(members[msg.sender] == false);
		require(rejected[msg.sender] == false);
		require(applicants[msg.sender] == false);

		applicants[msg.sender] = true;
		applications.push(msg.sender);
	}

	function processMembership(address applicant, bool accepted) external onlyOwner {
		if (accepted) {
			members[applicant] = true;
		} else {
			rejected[applicant] = true;
		}
	}

	function getApplications() external view returns(address[] memory) {
		return applications;
	}
}
