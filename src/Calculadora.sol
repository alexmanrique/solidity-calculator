// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.24;

contract Calculadora {

    uint256 public resultado;

    address public admin;

    event Addition(uint256 firstNumber, uint256 secondNumber, uint256 resultado);
    event Substraction(uint256 firstNumber, uint256 secondNumber, uint256 resultado);
    event Multiplier(uint256 firstNumber, uint256 secondNumber, uint256 resultado);
    event Division(uint256 firstNumber, uint256 secondNumber, uint256 resultado);
    constructor(uint256 valorInicial_, address admin_) {
        resultado = valorInicial_;
        admin = admin_;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    } 

    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ + secondNumber_;
        resultado = resultado_;
        emit Addition(firstNumber_, secondNumber_, resultado_);
    }

    function substraction(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ - secondNumber_;
        resultado = resultado_;
        emit Substraction(firstNumber_, secondNumber_, resultado_);
    }

    function multiply(uint256 firstNumber_, uint256 secondNumber_) external returns (uint256 resultado_) {
        resultado_ = firstNumber_ * secondNumber_;
        resultado = resultado_;
        emit Multiplier(firstNumber_, secondNumber_, resultado_);
    }

    function divide(uint256 firstNumber_, uint256 secondNumber_) external onlyAdmin returns (uint256 resultado_) {
        require(secondNumber_ != 0, "Division by 0 not allowed");
        resultado_ = firstNumber_ / secondNumber_;
        resultado = resultado_;
        emit Division(firstNumber_, secondNumber_, resultado_);
    }
}

