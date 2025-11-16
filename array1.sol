// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayContract {
    bytes public bs = "abc\x22\x22";
    bytes public _data = new bytes(10);

    string public str0;
    string public str1 = "TinyXiong\u718A";

    function readBytesByIndex(uint256 i) public view returns (bytes1) {
        return bs[i];
    }

    function readBytestIndexByBytes1(bytes1 d) public view returns (int256) {
        for (uint256 i = 0; i < bs.length; i++) {
            if (bs[i] == d) {
                return int256(i);
            }
        }
        return -1;
    }

    function testSlice(bytes calldata data,uint256 start,uint256 end) public pure returns(bytes memory){
        return data[start:end];
    }



    
}
