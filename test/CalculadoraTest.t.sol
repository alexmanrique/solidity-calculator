// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.30;

import "../lib/forge-std/src/Test.sol";
import "../src/Calculadora.sol";

contract CalculadoraTest is Test {
    Calculadora public calculadora;
    address public admin = address(0xABCD);
    address public user = address(0x1234);

    function setUp() public {
        calculadora = new Calculadora(0, admin);
    }

    function testAddition() public {
        uint256 result = calculadora.addition(5, 3);
        assertEq(result, 8);
        assertEq(calculadora.resultado(), 8);
    }

    function testSubstraction() public {
        uint256 result = calculadora.substraction(10, 4);
        assertEq(result, 6);
        assertEq(calculadora.resultado(), 6);
    }

    function testMultiply() public {
        uint256 result = calculadora.multiply(6, 7);
        assertEq(result, 42);
        assertEq(calculadora.resultado(), 42);
    }

    function testDivideAsAdmin() public {
        vm.prank(admin);
        uint256 result = calculadora.divide(20, 4);
        assertEq(result, 5);
        assertEq(calculadora.resultado(), 5);
        vm.stopPrank();
    }

    function testDivideByZeroReverts() public {
        vm.prank(admin);
        vm.expectRevert("Division by 0 not allowed");
        calculadora.divide(10, 0);
        vm.stopPrank();
    }

    function testDivideAsNonAdminReverts() public {
        vm.prank(user);
        vm.expectRevert("Only admin can perform this action");
        calculadora.divide(10, 2);
        vm.stopPrank();
    }

    function testFuzzDivision(uint256 a, uint256 b) public {
        vm.assume(b != 0);
        vm.prank(admin);
        uint256 result = calculadora.divide(a, b);
        assertEq(result, a / b);
        assertEq(calculadora.resultado(), a / b);
        vm.stopPrank();
    }
}
