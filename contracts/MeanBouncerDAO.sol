// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.6.9;
/**
 * My second iteration of BouncerDAO. Applicants only have one chance to get in. 
 */

 import "@openzeppelin/contracts/access/Ownable.sol";

contract MeanBouncerDAO is Ownable {
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
		for (uint i = 0; i < applications.length; i++) {
			if (applications[i] == applicant) {
				delete applications[i];
				if (accepted) {
					members[applicant] = true;
				} else {
					rejected[applicant] = true;
				}
			}
		}
	}
}
