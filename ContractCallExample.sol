// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ContractOne{

    mapping(address => uint) public balances;

    function deposit() public payable {

        balances[msg.sender] += msg.value;
    }


}

contract ContractTwo{

    receive() external payable { }

    function depositOnContractOne(address _contract_one) public {
        ContractOne contract_one = ContractOne(_contract_one);
        contract_one.deposit{value:100,gas:100000}();
    }
    
}
