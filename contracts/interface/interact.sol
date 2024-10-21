// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
    

abstract contract IStorage {
    function store(uint256 num) virtual public; 
}

contract SetNumber {
    
    IStorage storeContract;
    constructor(address contractAddress){
        storeContract = IStorage(contractAddress);
    }

    function setNumber() public {
        storeContract.store(block.timestamp);
    }
}



