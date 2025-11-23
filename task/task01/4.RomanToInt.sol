// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanToInt {
    mapping(bytes1 => int256) public romanData;

    int256 public num;

    event RomanToIntLog(
        uint256 index,
        bytes1 char1,
        int256 currentValue,
        int256 prevValue,
        int256 result
    );

    function romanToInt(string memory roman) public returns (int256) {
        romanData[bytes1("I")] = 1;
        romanData[bytes1("V")] = 5;
        romanData[bytes1("X")] = 10;
        romanData[bytes1("L")] = 50;
        romanData[bytes1("C")] = 100;
        romanData[bytes1("D")] = 500;
        romanData[bytes1("M")] = 1000;

        int256 result = 0;
        int256 prevValue = 0;
        bytes memory arr = bytes(roman);
        for (uint256 i = arr.length - 1; i > 0; i--) {
            bytes1 char1 = arr[i];
            int256 currentValue = romanData[char1];

            if (currentValue >= prevValue) {
                result += currentValue;
            } else {
                result -= currentValue;
            }
            prevValue = currentValue;

            emit RomanToIntLog(i, char1, currentValue, prevValue, result);
        }

        //下标为0的情况，单独处理
        int256 currentValue1 = romanData[arr[0]];
        if (currentValue1 >= prevValue) {
            result += currentValue1;
        } else {
            result -= currentValue1;
        }

        num = result;
        return result;
    }
}
