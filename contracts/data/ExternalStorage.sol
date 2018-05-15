pragma solidity ^0.4.19;

import "./OwnableContract.sol";

contract ExternalStorage is OwnableContract {

    function ExternalStorage() public {
    }

    mapping(bytes32 => uint) UIntStorage;

    function getUIntValue(bytes32 record) public constant returns (uint){
        return UIntStorage[record];
    }

    function setUIntValue(bytes32 record, uint value)
    public
    onlyAuthorized
    {
        UIntStorage[record] = value;
    }

    function deleteUIntValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete UIntStorage[record];
    }

    mapping(bytes32 => string) StringStorage;

    function getStringValue(bytes32 record) public constant returns (string){
        return StringStorage[record];
    }

    function setStringValue(bytes32 record, string value)
    public
    onlyAuthorized
    {
        StringStorage[record] = value;
    }

    function deleteStringValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete StringStorage[record];
    }

    mapping(bytes32 => address) AddressStorage;

    function getAddressValue(bytes32 record) public constant returns (address){
        return AddressStorage[record];
    }

    function setAddressValue(bytes32 record, address value)
    public
    onlyAuthorized
    {
        AddressStorage[record] = value;
    }

    function deleteAddressValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete AddressStorage[record];
    }

    mapping(bytes32 => bytes) BytesStorage;

    function getBytesValue(bytes32 record) public constant returns (bytes){
        return BytesStorage[record];
    }

    function setBytesValue(bytes32 record, bytes value)
    public
    onlyAuthorized
    {
        BytesStorage[record] = value;
    }

    function deleteBytesValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete BytesStorage[record];
    }

    mapping(bytes32 => bytes32) Bytes32Storage;

    function getBytes32Value(bytes32 record) public constant returns (bytes32){
        return Bytes32Storage[record];
    }

    function setBytes32Value(bytes32 record, bytes32 value)
    public
    onlyAuthorized
    {
        Bytes32Storage[record] = value;
    }

    function deleteBytes32Value(bytes32 record)
    public
    onlyAuthorized
    {
        delete Bytes32Storage[record];
    }

    mapping(bytes32 => bool) BooleanStorage;

    function getBooleanValue(bytes32 record) public constant returns (bool){
        return BooleanStorage[record];
    }

    function setBooleanValue(bytes32 record, bool value)
    public
    onlyAuthorized
    {
        BooleanStorage[record] = value;
    }

    function deleteBooleanValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete BooleanStorage[record];
    }

    mapping(bytes32 => int) IntStorage;

    function getIntValue(bytes32 record) public constant returns (int){
        return IntStorage[record];
    }

    function setIntValue(bytes32 record, int value)
    public
    onlyAuthorized
    {
        IntStorage[record] = value;
    }

    function deleteIntValue(bytes32 record)
    public
    onlyAuthorized
    {
        delete IntStorage[record];
    }
}