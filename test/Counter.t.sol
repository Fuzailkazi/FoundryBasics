// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public{
        counter = new Counter();
    }

    function testInc() public{
        counter.inc();
        assertEq(counter.count(), 1);
    }

    function testFailDec() public {
        counter.dec();

    }

    function testDecUnderflow() public{
        vm.expectRevert(); //  because here we expect an underflow 
        counter.dec();
    }
    
    function testDec() public {
        counter.inc();
        counter.inc();
        counter.dec();
         assertEq(counter.count(), 1);

    }

}
