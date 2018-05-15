pragma solidity ^0.4.19;

contract OwnableContract {
    /* The distinction between creator and owner allows for control of the DAO (creator) over the contract,
    while adding the flexibility that an authorized party can manipulate the contract as well*/

    address public creator = msg.sender;
    address public owner = msg.sender;

    /// @notice check if the caller is the owner of the contract
    modifier onlyCreator {
        require (msg.sender == creator) ;
        _;
    }
    /// @notice check if the caller is the owner of the contract
    modifier onlyOwner {
        require (msg.sender == owner) ;
        _;
    }

    modifier onlyAuthorized {
        require ((msg.sender == creator) || (msg.sender == owner)) ;
        _;
    }

    /// @notice change the owner of the contract
    /// @param _newOwner the address of the new owner of the contract.
    function changeOwner(address _newOwner)  onlyAuthorized {
        require(_newOwner != 0x0) ;
        owner = _newOwner;
    }
    function () payable { revert(); }
}