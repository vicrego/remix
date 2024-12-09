// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



contract Oracle {
    address constant feedAddress = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;
    AggregatorV3Interface feed;
    constructor() {
        feed = AggregatorV3Interface(feedAddress);
    }

    function getPrice() public view returns(int256) {
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) = feed.latestRoundData();
        return answer;
    }
}