// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.6.9;
/**
 * A simple DAO where people apply to get in, and the contract owner accepts or rejects them.
 */

 import "@openzeppelin/access/Ownable.sol";

contract BouncerDAO is Ownable {

	struct Member {
		bool accepted;
	}

	mapping(address => Member) public members;
	address[] public applicants;

	constructor() public {
    // TODO
	}
	function requestMembership() external {

	}
	function approveMembership() external {

	}
}
