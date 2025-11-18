// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanToInt {
    mapping(string => uint256) public romanData;

    string public roman1;

    function romanToInt(string memory roman) public returns (uint256) {
        roman1 = roman;

        romanData["I"] = 1;
        romanData["V"] = 5;
        romanData["X"] = 10;
        romanData["L"] = 50;
        romanData["C"] = 100;
        romanData["D"] = 500;
        romanData["M"] = 1000;

        uint256 result = 0;
        uint256 prevValue = 0;
        bytes memory arr = bytes(roman);
        for (uint256 i = arr.length; i >= 0; i--) {
            bytes memory val = new bytes(1);
            val[0] = arr[i];
            string memory str = string(val);

            uint currentValue = romanData[str];
            if (currentValue >= prevValue) {
                result += currentValue;
            } else {
                result -= currentValue;
            }

            prevValue = currentValue;
        }

        return romanData["I"];
    }
}
