// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.6.9;
/**
 * A simple DAO where people apply to get in, and the contract owner accepts or rejects them.
 */

 import "@openzeppelin/contracts/access/Ownable.sol";

contract BouncerDAO is Ownable {

	struct Member {
		bool accepted;
	}

	mapping(address => Member) public members;
	address[] public applicants;

	constructor() public {
    members[msg.sender] = Member(true);
	}

	function requestMembership() external {
		applicants.push(msg.sender);
	}

	function approveMembership(address _applicant) external onlyOwner {
		for (uint i = 0; i < applicants.length; i++) {
			if (applicants[i] == _applicant) {
				delete applicants[i];
				members[_applicant] = Member(true);
			}
		}
	}
}
