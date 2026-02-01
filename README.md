# 🔐 Basic ETH Vault – Solidity Smart Contract

## 📌 Description
This project is a basic Ethereum Vault smart contract written in Solidity.

It allows users to deposit and withdraw ETH in a secure and transparent way, following core DeFi principles.

Each user can create a single deposit, which can be withdrawn only once.

---

## 🚀 Features
- Deposit ETH into the Vault
- Withdraw deposited ETH
- One deposit per user
- Owner-controlled Vault status (Open / Closed)
- Emergency stop mechanism
- Events for deposits, withdrawals, and status changes

---

## 🛠️ Tech Stack
- Solidity `^0.8.33`
- Ethereum Virtual Machine (EVM)
- Remix IDE

---

## 📄 Smart Contract Overview

### Vault States
```solidity
enum Status { OPEN, CLOSED }
```

### **Deposit Structure**
```solidity
struct Deposit {
    uint256 amount;
    uint256 timestamp;
    bool withdrawn;
}
```

### **Main Functions**

- deposit() – Allows users to deposit ETH

- withdraw() – Allows users to withdraw their deposit

- openVault() – Opens the Vault (only owner)

- closeVault() – Closes the Vault (only owner)

---

## 🔒 **Security Considerations**

- Uses Checks-Effects-Interactions pattern

- Prevents multiple withdrawals

- Prevents deposits and withdrawals when Vault is closed

- Uses call instead of deprecated transfer

---

## **📦 How to Use**

- Deploy the contract

- Call deposit() with ETH

- Withdraw funds using withdraw()

- Owner can open or close the Vault if needed

---

## **🧠 Learning Goals**

This project was built as part of a blockchain development learning path, focusing on:

- Solidity fundamentals

- Smart contract structure

- DeFi basic concepts

- Security best practices

---

## **⚠️ Disclaimer**

This contract is for educational purposes only and has not been audited.
Do not use in production environments.

