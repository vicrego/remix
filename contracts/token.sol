
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract Token{
    uint256 totalSupply;
    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint)) public allowance;

    event NewTransfer(address from, address to, uint amount);
    event Approval(address aproval, address spender, uint amount);

    constructor (uint supply){
        totalSupply = supply;
        balanceOf[msg.sender] = totalSupply;
    }
    function transfer (address to, uint256 amount) public {
        balanceOf[msg.sender] = balanceOf[msg.sender] - amount;
        balanceOf[to] = balanceOf[to] + amount;
    }

    function approve (address spender, uint256 amount) public{
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }


    function transferFrom (address from, address to, uint amount) public{
        require(allowance[from][msg.sender] >= amount);
        allowance[from][msg.sender] -= amount;
        balanceOf[from] = balanceOf[from] - amount;
        balanceOf[to] = balanceOf[to] + amount;
    }
}