// SPDX-License-Identifier: LGPL-3.0-only 
pragma solidity 0.8.33; 
// CONTRATO
contract Vault {
// DEFINICIÓN DE TIPOS
enum Status {  OPEN, CLOSED  }
struct Deposit {
    uint  amount; 
    uint  timestamp; 
    bool withdrawn;
}
// VARIABLES
address public owner; 
Status public statusvault;
mapping (address => Deposit) public deposits; 

// MODIFICADORES

modifier onlyOwner(){
    require (owner == msg.sender, "not owner");
    _;
}
// EVENTOS 

event DepositCreated (address indexed user, uint256 amount); 
event DepositWithdrawn (address indexed user, uint256 amount);
event VaultStatusChanged (Status newStatus); 


// FUNCIONES

constructor () {
    owner = msg.sender; 
    statusvault = Status.OPEN; 
}

function deposit () external payable {
    require (msg.value > 0, "Must send ETH"); 
    require (deposits[msg.sender].amount == 0, "Deposit already exists"); 
    require (statusvault == Status.OPEN, "Vault is closed");

    deposits [msg.sender] = Deposit ({ 
        amount:msg.value,
        timestamp:block.timestamp,
        withdrawn:false
        });
    emit DepositCreated (msg.sender, msg.value); 
}

function withdraw () external {
    Deposit storage userDeposit = deposits[msg.sender]; 
    
    require (userDeposit.amount > 0,"No deposit");
    require (!userDeposit.withdrawn, "Deposit already withdrawn");
    require (statusvault == Status.OPEN, "Vault is closed");

uint256 amountToSend = userDeposit.amount;
userDeposit.withdrawn = true; 

(bool success, ) = payable(msg.sender).call{value: amountToSend}("");
    require(success, "ETH transfer failed");

emit DepositWithdrawn(msg.sender, amountToSend);
}
 
function closeVault () external onlyOwner {
    statusvault = Status.CLOSED;
    emit VaultStatusChanged(Status.CLOSED);
}

function openVault () external onlyOwner {
    statusvault = Status.OPEN;
    emit VaultStatusChanged(Status.OPEN);
}
}
