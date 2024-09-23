// SPDX-License-Identifier: MIT

 pragma solidity ^0.8.24;

 library PriceConverter {
    function getPrice() public view returns(uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (,int256 price,,,) = priceFeed.latestRoundData();
    // price of ETH in terms of USD
    return uint256 (price * 1e10);
    }
    
    function getConversionRate(uint256 ethAmount) public view returns (uint256){
       uint256 ethPrice = getPrice(); 
       uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
       return ethAmountInUsd;

    }
 }