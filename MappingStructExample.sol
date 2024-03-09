// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MappingStructExample{

    struct Transaction{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint TotalBalance;
        uint NumberOfDeposits;
        mapping (uint => Transaction) DepositTransactions;
        uint NumberOfWithdrawls;
        mapping (uint => Transaction) WithdrawlsTransactions;
        
    }


    mapping(address => Balance) public balances;

    function deposit()public payable {
        balances[msg.sender].TotalBalance += msg.value;
        Transaction memory depositTrans = Transaction(msg.value,block.timestamp);
        balances[msg.sender].DepositTransactions[balances[msg.sender].NumberOfDeposits] = depositTrans;
        balances[msg.sender].NumberOfDeposits ++;
    }

    function widthdrawlMoney(address payable  _to, uint _amount) public{
        balances[msg.sender].TotalBalance -= _amount;
        Transaction memory WithdrawlTrans = Transaction(_amount,block.timestamp);
        balances[msg.sender].WithdrawlsTransactions[balances[msg.sender].NumberOfWithdrawls] = WithdrawlTrans;
        balances[msg.sender].NumberOfWithdrawls ++;
        _to.transfer(_amount);
    }

}
