// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingContract {

    mapping(address=>uint) public myMapping;

    function setMyMapping(address _key,uint _value) public {
        myMapping[_key] = _value;
    }

}