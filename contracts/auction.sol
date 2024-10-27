// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface IERC721 {
    function transferFrom(address, address, uint) external;
}

contract Auction {
    IERC721 public nft;
    uint public nftId;

    address payable public seller;

    uint endTime;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) bids;
    bool ended;

    constructor(address _nft, uint _nftId) {
        nft = IERC721(_nft);
        nftId = _nftId;
        nft.transferFrom(msg.sender, address(this), nftId);
        endTime = block.timestamp + 7 days;
    }
    function bid() external payable {
        require(block.timestamp < endTime);
        require(msg.value > highestBid);
        highestBid = msg.value;
        highestBidder = msg.sender;
        //A linha abaixo soma os valores de bids anteriores
        //Da mesma pessoa 
        bids[msg.sender] += msg.value;
    }

    function withdraw() external{
        require(msg.sender != highestBidder);
        uint bal = bids[msg.sender];
        //Abaixo é uma prevenção ao reentrance atack
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(bal);

    }

    function end() external {
        require(!ended);
        require(block.timestamp > endTime);
        ended = true;
        nft.transferFrom(address(this), highestBidder, nftId);
        seller.transfer(highestBid);
        //Para que depois que o leilão acabar, ele poder 
        //retirar lances anteriores se houverem
        highestBidder = address(0);
        
    }

}



