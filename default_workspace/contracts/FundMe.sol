// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    mapping(address=>uint256) public adressToAmountFunded;
    function fund() public payable{
        adressToAmountFunded[msg.sender] += msg.value;
        //what is the eth->usd conversion rate?
        //oracles are the bridge between real world and blockchains
        //chains are deterministic
        //we cannot have one oracle, that makes it centralized
        //chainlink is modular decentralized oracle infastructure for this purpose
    }
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version(); 
    }
    function getPrice() public view returns(uint256){
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
         (uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return uint256(answer);
        //158866000000
    }
}