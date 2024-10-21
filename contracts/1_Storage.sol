// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./AccessControl.sol";



contract Storage is AccessControl {

    uint256 number;

    constructor() {

    }    

    function store(uint256 num) public onlyAdmin {
        //Only the contract's owner can store a value
        number = num;
    }
  
    function pay() public payable {}

    function retrieve() public view returns (uint256){
        return number;
    }

    function getBalance() public view returns (uint256 bal){
        bal = address(this).balance; 
    }
}

