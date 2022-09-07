// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.9 ;

contract Bank {
    string public bankName;
    address public bankOwner;

    mapping (address => uint) customerBalance;

    constructor(string memory _bankName){
        bankName = _bankName;
        bankOwner = msg.sender;
    }

    modifier onlyBankOwner {
        require(msg.sender == bankOwner, "Only bank owner can execute this function");
        _;
    }

    function setBankName(string memory _bankName) external onlyBankOwner{
        bankName = _bankName;
    }

    function depositMoney() external payable{
        require(msg.value >0, "cant deposit 0 or less than 0 ethers");
        customerBalance[msg.sender] += msg.value;
    }

    function withdrawMoney(address _to, uint _amount) external payable {
        require(_amount >0, "cant withdraw 0 or less than 0 ethers");
        require(customerBalance[msg.sender]>=_amount, "Not enough balance");
        customerBalance[msg.sender] -= _amount;
        //customerBalance[_to] += _amount;
        (bool success, ) = payable(_to).call{value : _amount}("");
        require(success,"Transfer failed");
        //payable(_to).transfer(_amount);
    }

    function getCustomerBalance() external view returns(uint balance){
        return customerBalance[msg.sender];
    }

    function getBankBalance() external view returns(uint bankBalance){
        return address(this).balance;
    }

}