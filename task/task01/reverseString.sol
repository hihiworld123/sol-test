// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReverseString {
    function reverse(string memory str) public pure returns (string memory) {
        bytes memory arr = bytes(str);

        uint len = arr.length;
        for (uint i = 0; i < len / 2; i++) {
            bytes1 a = arr[len - i - 1];
            arr[len - i - 1] = arr[i];
            arr[i] = a;
        }

        return string(arr);
    }
}
