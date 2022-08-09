pragma solidity ^0.5.11;

contract FunctionsExample {

    mapping(address => uint) public balanceReceived;

    function reciveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough founds.");
        assert(balanceReceived[msg.sender] <= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function () external payable {
        reciveMoney();
    }

}