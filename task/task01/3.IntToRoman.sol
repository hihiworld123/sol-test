// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract IntToRoman {
    function int2Roman(uint256 num) public pure returns (string memory) {
        string[10][4] memory c = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            ["", "M", "MM", "MMM", "", "", "", "", "", ""]
        ];

        string memory roman = "";
        roman = string.concat(roman, c[3][(num / 1000) % 10]);
        roman = string.concat(roman, c[2][(num / 100) % 10]);
        roman = string.concat(roman, c[1][(num / 10) % 10]);
        roman = string.concat(roman, c[0][num % 10]);

        return roman;
    }
}
