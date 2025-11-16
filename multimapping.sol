// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiMapping {
    mapping(address => mapping(string=>uint256) ) public userBalance;

    function setUserBalance(string memory currency, uint256 amount) public {
        userBalance[msg.sender][currency] = amount;
    }

    function getUserBalance(address user,string memory currency) public view returns(uint256){
        return userBalance[user][currency];
    }

    // function getMapping(mapping(string=>uint256) calldata a) public returns (mapping(string=>uint256) ){

    // }

    function deleteBalance(address addr, string memory currency) public{
        delete userBalance[addr][currency];
    }

    



}