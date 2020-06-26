// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.6.9;
/**
 * My second iteration of BouncerDAO. Applicants only have one chance to get in. Better array management.
 */

 import "@openzeppelin/contracts/access/Ownable.sol";

contract BouncerDAO is Ownable {
	address[] public applicants;
	mapping(address => bool) public members;
	mapping(address => bool) public rejected;

	constructor() public {
    members[msg.sender] = true;
	}

	function requestMembership() external {
		applicants.push(msg.sender);
	}

	function approveMembership(address _applicant) external onlyOwner {
		for (uint i = 0; i < applicants.length; i++) {
			if (applicants[i] == _applicant) {
				delete applicants[i];
				members[_applicant] = true;
			}
		}
	}
}
