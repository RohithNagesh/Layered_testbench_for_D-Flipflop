# Layered_testbench_for_D-Flipflop
Objective is to write a layered testbench for D Flip-Flop Asynchronous Reset Low (DFF_ASRL) and to verify the functionality of the DFF_ASRL by generating different types of input stimulus
# BENEFITS OF LAYERED TESTBENCH
+ Better maintainability.
+ Better reusability.
+ Parallel development and verification.
# TABLE OF CONTENTS
+ [INTRODUCTION](#introduction)
+ [DESIGN]
+ [TRANSATION CLASS]
+ [GENERATOR]
+ [DRIVER]
+ [INTERFACE]
+ [MONITOR]
+ [SCOREBOARD]
+ [ENVIRONMENT]
+ [TESTBENCH AND TEST]
# INTRODUCTION
1. Testbench or Verification Environment is used to check the functional correctness of the Design Under Test (DUT) by generating and driving a predefined input sequence to a design, capturing the design output and comparing with-respect-to expected output.
2. Verification environment is a group of class’s performing specific operation. i.e., generating stimulus, driving, monitoring, etc. and those classes will be named based on the operation
 ![image](https://github.com/RohithNagesh/Layered_testbench_for_D-Flipflop/assets/103078929/5ff5a9c2-648a-41f7-9a57-db61e3823378)
# DESIGN
1. A flip flop is the fundamental sequential circuit element, which has two stable states and can store one bit at a time. It can be designed using a combinational circuit with feedback and a clock. D Flip-Flop is one of that Flip Flop that can store data
2. D flip-flop can have an asynchronous reset as input independent of the clock. That means the output of the Flip Flop can be set to 0 with the reset despite the clock pulse, which means the output can change with or without a clock, which can result in asynchronous output.
   ![image](https://github.com/RohithNagesh/Layered_testbench_for_D-Flipflop/assets/103078929/8757a6b0-b3b8-42f6-b1a6-d6319a3d263e)
# TRANSATION CLASS
1. Field required to generate stimulus are declared in transaction class
2. Transaction class can also be used as placeholder for the activity monitored by monitor on DUT signals
3. Generator sends transactions to be interpreted by the driver to provide stimulus to the DUT through the interface
4. Monitor interprets outputs of the DUT into transaction then pushes them to the scoreboard
# GENERATOR
Generates transactions that will be translated into stimulus for the DUT and Sends generated transactions to driver over mailbox
# DRIVER
1. Driver Class receives the stimulus from a generator in the form of a transaction through a shared mailbox
2. Driver converts transaction level data to signal level activity
# INTERFACE
1. SystemVerilog construct to encapsulate communication between modules
2. Can contain modports which provides direction information for module interface ports and controls the user of tasks and controls the uses of tasks and functions within certain modules
3. Shared by multiple entities (driver, monitor, etc.)
# MONITOR
1. Samples the Interface signals and convert signal level activity to transaction level
2. Sends transaction to scoreboard via mailbox
# SCOREBOARD
Scoreboard receives the sampled transaction from the monitor and it is used to perform the actual verification, is the output correct?
# ENVIRONMENT
Contains instances of the generator, driver, monitor, and scoreboard, connects generators to drivers and monitors to scoreboard with mailboxes, and provides instance of the interface to all and it also contain Main task which runs a test
# TESTBENCH AND TEST
1. Test Bench is the top level entity and a module. Instantiates the DUT, interface and the test
2. The test is a module that instantiates the environment and calls its run() procedure.
