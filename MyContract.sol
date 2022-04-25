// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract MyErc20Token {
    string token_name;
    string token_symbol;
    uint8 token_decimals;
    uint256 token_total_supply;

    mapping(address => uint256) token_balance;

    mapping(address => mapping(address => uint256)) allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 totalSupply
    ) {
        _name = name;
        _symbol = symbol;
        _deciamls = decimals;
        _totalSupply = totalSupply;
        balance[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
}
