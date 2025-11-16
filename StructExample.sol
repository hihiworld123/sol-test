// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract StructExample {
    struct Person {
        uint8 age;
        string name;
    }

    struct Hobbie {
        string lable;
        string value;
    }

    Person[] public persons;
    mapping(address => Person) public personMap;

    function addPerson(Person calldata p) public {
        persons.push(p);
    }

    function serPerson(Person calldata p, address addr) public {
        personMap[addr] = p;
    }

    function getMapping() public view returns (Person memory) {
        return personMap[msg.sender];
    }
}
