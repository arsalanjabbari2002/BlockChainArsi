pragma solidity ^0.8.13;

contract myERC20 {
    string _name;
    string _symbol;
    uint8 _deciamls;
    uint256 _totalSupply;

    mapping(address => uint256) balance;
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

    function getName() public view returns (string memory) {
        return _name;
    }

    function getSymbol() public view returns (string memory) {
        return _symbol;
    }

    function getDecimals() public view returns (uint8) {
        return _deciamls;
    }

    function getTotalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balance[msg.sender] >= _value, "insufficient balance");

        balance[msg.sender] -= _value;
        balance[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(
            allowance[_from][msg.sender] >= _value,
            "insufficent allowence"
        );
        require(balance[_from] >= _value, "insufficent owner balance");
        allowance[_from][msg.sender] -= _value;
        balance[_from] -= _value;
        balance[_to] += _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] += _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowanceOf(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return allowance[_owner][_spender];
    }
}
