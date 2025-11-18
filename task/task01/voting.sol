// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting {
    mapping(address => uint256) voteData;
    address[] addresses;

    function vote(address candidate) public {
        uint256 num = voteData[candidate];
        num++;
        voteData[candidate] = num;
        if (!contains(candidate)) {
            addresses.push(candidate);
        }
    }

    function getVotes(address candidate) public view returns (uint256) {
        return voteData[candidate];
    }

    function resetVotes() public {
        for (uint256 i = 0; i < addresses.length;i++ ) {
            voteData[addresses[i]] = 0;
        }
    }

    function contains(address candidate) private view returns (bool) {
        for (uint256 i = 0; i < addresses.length; i++) {
            if (addresses[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
