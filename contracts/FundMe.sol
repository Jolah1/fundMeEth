 // SPDX-License-Identifier: MIT

 pragma solidity ^0.8.24;

 import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

 contract FundMe {

    uint256 public minimumUsd = 5 * (10 ** 18); // 5e18

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;


    function fund() public payable {
      // allow users to send $
      // have a minimum $ sent 
      require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 1X018
      funders.push(msg.sender);
      addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;


    }
    // function withdraw() public {}

    

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

 }