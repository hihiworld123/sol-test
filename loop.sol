// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopExample {
    function basicFor() public pure returns (uint) {
        uint sum = 0;

        uint i = 0;
        while (i < 10) {
            i++;
            sum += i;
        }

        return sum;
    }
}
