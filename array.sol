// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayContract {
    uint256 public a = 10;

    uint256[] public arr;

    uint256[] public arr2 = [1, 2, 3];

    uint256[] public arr3 = new uint256[](5);

    uint256[3] public staticArr;

    uint256[3] public staticArr1 = [1, 2, 3];

    function readStaticArr()
        external
        view
        returns (uint256[3] memory data, uint256 length)
    {
        data = staticArr;
        length = staticArr.length;
    }

    function readStaticArr1()
        external
        view
        returns (uint256[3] memory data, uint256 length)
    {
        data = staticArr1;
        length = staticArr1.length;
    }

    function readArr()
        external
        view
        returns (uint256[] memory data, uint256 length)
    {
        data = arr;
        length = arr.length;
    }

    function readArr2()
        external
        view
        returns (uint256[] memory data, uint256 length)
    {
        data = arr2;
        length = arr2.length;
    }

    function readArr3()
        external
        view
        returns (uint256[] memory data, uint256 length)
    {
        data = arr3;
        length = arr3.length;
    }
}
