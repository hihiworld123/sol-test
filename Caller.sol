// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Caller {
    function testMsg() public view returns (address) {
        return msg.sender;
    }

    function testTx() public view returns (address) {
        return tx.origin;
    }
}

contract Callee {
    Caller caller;

    constructor() {
        caller = new Caller();
    }

    function testMsg() public view returns (address) {
        return caller.testMsg();
    }

    function testTx() public view returns (address) {
        return caller.testTx();
    }
}
