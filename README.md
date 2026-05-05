# 4 bit wide single_port RAM with synchronous read/write and asynchronous reset
This project implements a simple 4x4 RAM (Random Access Memory) using Verilog HDL along with a testbench for simulation and verification.
The RAM supports:
1.Write operation
2.Read operation

📌 Module Description:
#4 memory locations
#Each location stores 4-bit data

Total memory:
4 × 4 = 16 bits

🔁 Working Principle
1. Reset Operation
When:
rst = 1
All memory locations are cleared:
R_mem[i] <= 4'b0000;
and output becomes:
rdata <= 4'b0000;

2. Write Operation
When:
we = 1
Data is written into selected address:
R_mem[addr] <= wdata;

3. Read Operation
When:
we = 0
Stored data is read from memory:
rdata <= R_mem[addr];

🧪 Testbench Verification
The testbench performs the following operations:
Step 1: Apply Reset
Initial reset clears the RAM.

Step 2: Write Data

Step 3: Read Data
Reads data from all memory locations to verify correct storage.

Step 4: Reset Verification
Applies reset again and confirms memory is cleared.

🛠 Tools Used
cadence Xelium
