pragma solidity ^0.4.19;

contract DataVerifiable {

    /// @notice reverts if ether was sent accidentally
    modifier refundEtherSentByAccident() {
        require(msg.value == 0) ;
        _;
    }

    /// @notice  if an address is invalid
    /// @param _target the address to check
    modifier revertIfAddressIsInvalid(address _target) {
        require(_target != 0x0) ;
        _;
    }

    /// @notice revert if the id is invalid
    /// @param _id the ID to validate
    modifier revertIfIsEmptyString(string _id) {
        require(bytes(_id).length != 0) ;
        _;
    }

    /// @notice revert if the uint is equal to zero
    /// @param _id the ID to validate
    modifier revertIfEqualToZero(uint _id) {
        require(_id != 0) ;
        _;
    }

    /// @notice revert if the id is invalid
    /// @param _id the ID to validate
    modifier revertIfIsEmptyBytes32(bytes32 _id) {
        require(_id != "") ;
        _;
    }
}