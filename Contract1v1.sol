//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
contract circleHack 
{
  

    address provider;
    address consumer;
    address admin;
    bool permission;
    bool registration;
    mapping (address => permission) public permit;
    mapping (address => registration) public regStatus;

    modifier validPermission
    { 
        require(permit[msg.sender].permission == true, "Permitted");
        _;
    }
    
    modifier sufficientBalance(uint cost) 
    {
        require(consumer[msg.sender].balance >= cost, "Balance available");
        _;
    }

    modifier onlyAdmin
    {
        require(msg.sender == admin, "Admin here!");
        _;
    }

    function registerProvider(address provider) onlyAdmin public
    {
        regStatus[provider].registration = true;
    }

    function registerConsumer(address consumer) onlyAdmin public
    {
        regStatus[consumer].registration = true;
    }
    
    function unregister (address addr) onlyAdmin public 
    {
       if(regStatus[addr].registration = true)
       {
           regStatus[addr].registration = false;   
       }     
    }

}
