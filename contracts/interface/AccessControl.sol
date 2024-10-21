// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
    
contract AccessControl {
    address public owner;
    mapping(address => bool) isAdmin;

    modifier onlyOwner (){
        require(msg.sender == owner, "only owner");
        _;
    }

    modifier  onlyAdmin (){
        require(isAdmin[msg.sender], "only admin");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addAdmin(address user) public onlyOwner {
        isAdmin[user] = true;
    }

    function removeAdmin(address admin) public onlyOwner {
        isAdmin[admin] = false;
    }

    function changeOwner (address newOwner) public onlyOwner{
        owner = newOwner;
    }
}