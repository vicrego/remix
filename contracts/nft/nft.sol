// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract NFTTolken{
    event Mint(address to, uint256 id, bytes32 hash);
    event Transfer(address to, uint256 id);
    uint256 public tokenCounter;
    mapping(uint256 => address) public tokenOwner;
    address owner;

    constructor() {
        owner = msg.sender;
    }
    function mint(address to, bytes32 ipfsHash) public {
        require(msg.sender == owner);
        uint256 tokenId = tokenCounter + 1;
        tokenOwner[tokenId] = to;
        tokenCounter++;
        emit Mint(to, tokenId, ipfsHash);
    }
    function transfer(address to, uint256 id) public {
        require(tokenOwner[id] == msg.sender);
        tokenOwner[id] = to;
        emit Transfer(to, id);
    }

}