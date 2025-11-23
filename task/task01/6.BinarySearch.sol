// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BinarySearch {
    int public index;

    function binarySearch(
        int[] memory arr,
        int p,
        int q,
        int ele
    ) public returns (int) {
        if (p > q) {
            index = -1;
            return -1;
        }

        int mid = p + (q - p) / 2;
        if (ele == arr[uint(mid)]) {
            index = mid;
            return mid;
        }

        if (ele < arr[uint(mid)]) {
            return binarySearch(arr, p, mid - 1, ele);
        } else {
            return binarySearch(arr, mid + 1, q, ele);
        }
    }
}
