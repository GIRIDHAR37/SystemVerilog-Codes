Problem Statement
The problem is to generate and print the first 20 gray code numbers using SystemVerilog. Gray code is a binary numeral system where two successive values differ in only one bit. The task is to use constrained randomization to fill an array with gray code values and then print the generated values.

Description of Code Implementation
The code is designed to generate and print a sequence of 20 gray codes using SystemVerilog's constrained randomization and dynamic arrays. Here’s a step-by-step breakdown of the implementation:

Class Definition (sample): The class sample is defined, which contains a dynamically sized array gray_code_array. This array is meant to store 5-bit gray codes, a sequence where consecutive numbers differ by only one bit.

Constrained Randomization: The constraint block gray_code_array_c defines two key constraints:

gray_code_array.size == 20; ensures that the array contains 20 elements.
The foreach loop inside the constraint ensures that each element of the array follows the gray code formula, i ^ (i >> 1). This formula converts a binary number into its corresponding gray code by performing a bitwise XOR operation between the number and its right-shifted version.
Print Function: The print function is used to display the gray code array elements. It uses SystemVerilog’s formatting feature %p, which prints the array in its entirety in a clear format.

Module top: The module top instantiates the class sample as an object s. In the initial block:

The object s is created with the new() method.
The randomize() method is called to generate the gray codes according to the constraints.
Finally, the print() method is invoked to display the generated gray code array.
Output: The result is an array of gray codes that is printed as:
'{0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8, 24, 25, 27, 26}
These are the first 20 gray codes, generated as per the defined constraint in the code.

Tools Used:
Siemens Questasim 2023.0.3: This tool was used to execute the SystemVerilog code, simulate the randomization process, and print the results.
Gvim Text Editor: Gvim was used for editing the SystemVerilog code, providing a lightweight yet powerful environment for code editing and syntax highlighting.