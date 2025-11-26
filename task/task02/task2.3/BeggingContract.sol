// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BeggingContract {
    address public owner;
    mapping(address => uint256) private treasureBowl;

    event Donate(address donor, uint256 amount);

    constructor() payable {
        owner = msg.sender;
    }

    receive() external payable {}

    function donate() public payable {
        uint256 amount = msg.value;
        require(amount > 0, "Donation must be greater than 0");

        treasureBowl[msg.sender] += amount;
        emit Donate(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Not owner");
        require(
            address(this).balance >= amount,
            "Insufficient balance in contract"
        );
        payable(owner).transfer(address(this).balance);
    }

    function getDonation(address donor) public view returns (uint256) {
        return treasureBowl[donor];
    }
}
