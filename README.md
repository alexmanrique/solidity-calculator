# Calculadora

A Solidity smart contract calculator that performs basic arithmetic operations (addition, subtraction, multiplication, and division) on the Ethereum blockchain.

## Contract Overview

The `Calculadora` contract provides the following functionality:

- **Addition**: Adds two numbers and updates the result
- **Subtraction**: Subtracts two numbers and updates the result
- **Multiplication**: Multiplies two numbers and updates the result
- **Division**: Divides two numbers (admin-only) and updates the result

### Features

- Public `resultado` state variable that stores the last calculation result
- Admin-controlled division operation for security
- Event emissions for all operations
- Division by zero protection
- Initial value and admin address set during contract deployment

### Contract Functions

- `addition(uint256 firstNumber_, uint256 secondNumber_)` - Public function to add two numbers
- `substraction(uint256 firstNumber_, uint256 secondNumber_)` - Public function to subtract two numbers
- `multiply(uint256 firstNumber_, uint256 secondNumber_)` - Public function to multiply two numbers
- `divide(uint256 firstNumber_, uint256 secondNumber_)` - Admin-only function to divide two numbers
