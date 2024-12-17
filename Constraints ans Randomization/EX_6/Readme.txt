Problem Statement
The task involves generating 15 random numbers between 0 to 100 such that the numbers do not repeat. The constraints must ensure that every number in the array is unique, and the solution must not use unique or randc—keywords/methods that typically simplify unique random number generation.

EDA Playground Link : https://edaplayground.com/x/PkCc

Implementation Approach
The solution uses SystemVerilog constraints to ensure the requirements are met. The implementation is as follows:

Dynamic Array for Random Values:
A dynamic array is declared with randomizable elements to store the 15 random numbers. A dynamic array is chosen to allow flexibility in size specification during the randomization process.

Constraint for Array Size:
A constraint is written to fix the array size to exactly 15 elements. This ensures that the array contains the desired number of random values.

Range Constraint:
The constraint restricts each element in the array to be within the range of 0 to 100. This is achieved using a range operator to enforce the bounds during randomization.

Uniqueness Constraint:
To ensure no two numbers in the array are the same, each element in the array is explicitly compared to all previous elements.

A loop iterates over all previous indices to verify that the current element does not match any prior element.
This ensures uniqueness without relying on unique or randc.
Randomization:
SystemVerilog’s randomize() function is called to generate random values for the array that satisfy the constraints.

If the randomization is successful, the unique numbers are printed for verification.
If randomization fails, a message indicates the failure, ensuring robustness.
Simulation Repetition:
The randomization process is repeated multiple times (e.g., 5 times) to verify that the constraints consistently produce valid outputs. Each run generates a new set of unique random numbers.

Tools Used
Simulation Tool:

Siemens QuestaSim 2023.0.3:
QuestaSim was used to simulate the SystemVerilog design. QuestaSim provides advanced capabilities for verifying hardware descriptions, including:
Randomization testing with constraints.
Observing outputs to confirm that constraints are satisfied.
Debugging any issues in the randomization process.
Code Editing and Debugging Tool:

Gvim Text Editor:
Gvim was used for writing and editing the SystemVerilog code. Features like syntax highlighting, quick navigation, and debugging tools made it efficient for handling the constraints and ensuring the code’s correctness.
Execution Process
Compilation and Simulation:
The code was compiled and executed in QuestaSim 2023.0.3.

Randomization:
The randomize() function generates a new set of random values for the array in each simulation iteration. The constraints ensure the numbers are unique and within the specified range.

Output Verification:
The output displays the array elements, confirming:

The array size is 15.
All numbers lie within the range 0 to 100.
The numbers are unique, ensuring no repetition.
Multiple Runs:
To validate the consistency of the constraints, the randomization process is executed multiple times (e.g., 5 runs), and the outputs are checked.

RESULT :
/*
# printing array elements : '{90, 89, 54, 47, 98, 75, 21, 9, 16, 66, 96, 88, 22, 79, 42}
# printing array elements : '{9, 2, 87, 99, 16, 78, 39, 95, 48, 88, 42, 0, 91, 66, 96}
# printing array elements : '{39, 22, 47, 58, 62, 38, 77, 94, 56, 74, 27, 68, 92, 80, 54}
# printing array elements : '{79, 82, 5, 45, 80, 46, 42, 72, 18, 51, 38, 8, 3, 39, 93}
# printing array elements : '{69, 10, 50, 62, 59, 29, 20, 31, 55, 1, 68, 72, 66, 87, 19}
*/