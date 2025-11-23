// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeSortedArray {
    uint256[] public arr;

    function merge(
        uint256[] memory a,
        uint256[] memory b
    ) public returns (uint256[] memory) {
        for (uint i = 0; i < a.length; i++) {
            arr.push(a[i]);
        }

        for (uint i = 0; i < b.length; i++) {
            arr.push(b[i]);
        }

        arr = insertSort(arr);
        return arr;
    }

    function insertSort(
        uint256[] memory arr1
    ) public pure returns (uint256[] memory) {
        uint256[] memory tempArr = arr1;
        uint256 temp;
        uint256 len = tempArr.length;
        uint256 pIndex;
        for (uint256 i = 1; i < len; ++i) {
            temp = tempArr[i];
            pIndex = i;
            while (pIndex >= 1 && temp < tempArr[pIndex - 1]) {
                tempArr[pIndex] = tempArr[pIndex - 1];
                --pIndex;
            }
            tempArr[pIndex] = temp;
        }
        return tempArr;
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }
}
