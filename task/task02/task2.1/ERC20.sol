// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./IERC20.sol";

//
contract ERC20 is IERC20 {
    mapping(address => uint) public balances;
    string public name; // 名称
    string public symbol; // 代号
    uint8 public decimals = 18; // 小数位数

    mapping(address => mapping(address => uint256)) public allowance;
    uint256 public totalSupply; // 代币总供给

    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
    }

    //查询账户持有的代币数量
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    //代币转账逻辑
    function transfer(address to, uint value) external returns (bool) {
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    //授权转账逻辑
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        // allowance[sender][msg.sender] -= amount;
        balances[from] -= value;
        balances[to] += value;
        emit Transfer(from, to, value);
        return true;
    }

    //铸造代币数量
    function mint(uint amount) external {
        balances[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    //代币授权逻辑
    function approve(
        address spender,
        uint amount
    ) external override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    //销毁代币函数
    function burn(uint amount) external {
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
