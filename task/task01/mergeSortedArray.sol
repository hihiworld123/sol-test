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

        return insertSort(arr);
    }

    function insertSort(
        uint256[] memory ary
    ) public pure returns (uint256[] memory) {
        uint256[] memory tempArr = ary;
        uint256 temp; //定义一个临时变量，保存要插入的值；
        uint256 len = tempArr.length;
        uint256 pIndex; // 上一个值
        for (uint256 i = 1; i < len; ++i) {
            temp = tempArr[i]; //需要插入的值；
            pIndex = i;
            while (pIndex >= 1 && temp < tempArr[pIndex - 1]) {
                tempArr[pIndex] = tempArr[pIndex - 1]; //相当于ary[i]=ary[i-1];
                --pIndex; //准备下一波交换；
            }
            tempArr[pIndex] = temp; //相当于ary[i-1]=temp; 因为上面 pIndex-- 了
        }
        return tempArr;
    }

    function getArr() public returns (uint256[] memory) {
        return arr;
    }
}
