// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//Application Binary Interface
contract ABI {
    //编码
    function encodeData(
        string memory text,
        uint256 number
    ) public pure returns (bytes memory, bytes memory) {
        return (abi.encode(text, number), abi.encodePacked(text, number));
    }

    //解码
    function decodeData(
        bytes memory encodedData
    ) public pure returns (string memory text, uint256 number) {
        return abi.decode(encodedData, (string, uint256));
    }

    //获取当前函数签名
    function getSelector() public pure returns (bytes4) {
        return msg.sig;
    }

    function computeSelector(string memory func) public pure returns (bytes4) {
        return bytes4(keccak256(bytes(func)));
    }

    function transfer(
        address addr,
        uint256 amount
    ) public pure returns (bytes memory) {
        return msg.data;
    }

    function encodeFunctionCall() public pure returns (bytes memory) {
        return
            abi.encodeWithSignature(
                "transfer(address,uint256)",
                0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
                100
            );
    }

    function hashFunctions(
        string memory input
    ) public pure returns (bytes32, bytes32, bytes32) {
        bytes memory data = abi.encodePacked(input);
        return (keccak256(data), sha256(data), ripemd160(data));
    }

    function modularMath(
        uint256 x,
        uint256 y,
        uint256 m
    ) public pure returns (uint256, uint256) {
        return (addmod(x, y, m), mulmod(x, y, m));
    }

    //椭圆曲线生成公钥
    function recoverAddress(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public pure returns (address) {
        return ecrecover(hash, v, r, s);
    }
}
