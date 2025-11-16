// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 public stateVar = 100;
    mapping(address => uint256) public balances;
    uint256[] someStorageArray;

    //常量（编译时确定，在字节码中）
    uint256 public constant CONSTANT_VAR = 1000;

    uint256 public immutable IMMUTABLE_VAR;

    constructor() {
        IMMUTABLE_VAR = 500;
    }

    struct TempStruct {
        uint256 value;
        string name;
    }

    function clainVar() public view returns (uint256) {}

    function pureFunction(uint256 x) public pure returns (uint256) {
        uint256 y = x * 2;
        return y;
    }

    function viewFunction() public view returns (uint256) {
        return stateVar;
    }

    function referenceExample(uint256[] memory inputArray) public {
        uint256[] memory localArray = inputArray;
        someStorageArray.push(100);
    }

    function memoryTempStruct(
        string calldata name1,
        uint val
    ) public view returns (TempStruct memory) {
        TempStruct memory ts = TempStruct({name: name1, value: val});
        return ts;
    }

    function calldataTempStruct(
        TempStruct calldata ts
    ) external view returns (TempStruct memory) {
        TempStruct memory ts2 = ts;
        // return ts2;
        return _call(ts);
    }

    function _call(
        TempStruct calldata ts
    ) private view returns (TempStruct memory) {
        return ts;
    }
}
