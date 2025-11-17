// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract HandleError{

    error Unauthorized();

    error InsuffinalBalance(uint256 available, uint256 required);

    error TransferFailed(address from, address to ,uint256 amount, string reason);

    function requireError(bool condition) public pure returns(uint256){
        require(condition,"input is not 'true'");
        return 1;
    }

    function assertError(bool condition) public pure returns(uint256){
        assert(condition);
        return 2;
    }

    function revertError(bool condition) public view returns(uint256){
        if (!condition){
            revert TransferFailed(address(this),msg.sender,10,"20");
        }
        return 3;
    }    

}

contract catchTryContract{
    HandleError public he;

constructor(){
    he = new HandleError();    
}

function trycatch(bool condition) public returns(string memory){
        try he.requireError(condition) returns(uint256 result){

            return "success";
        }catch Error(string memory reason){

            return string.concat("reason::", reason);
        }catch Panic(uint errorCode){

            return "panic";
        }catch(bytes memory lowLevelData){
            return string.concat("lowLevelData::",string(lowLevelData));
        }
    }
}