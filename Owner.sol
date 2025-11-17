// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Owner {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "\u4ec5\u5408\u7ea6\u62e5\u6709\u8005\u53ef\u8c03\u7528"
        );
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
