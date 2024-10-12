SystemVerilog Strings Overview:
In SystemVerilog, a string is a dynamic array of characters. Unlike Verilog, which used 8-bit wide vectors to represent characters, SystemVerilog introduces a native string data type for handling text. Strings are highly flexible and support a variety of operations like concatenation, comparison, and transformation (e.g., converting between upper and lower case).

EDA Playground Link : https://www.edaplayground.com/x/aZHn

Strings in SystemVerilog are dynamically sized, meaning that their length can change based on the operation performed on them. This contrasts with arrays, which have a fixed size, making strings much more convenient for certain operations, especially when dealing with variable-length data.

SystemVerilog String Methods:
SystemVerilog provides several built-in methods for strings, which makes string manipulation simpler and more intuitive. Here’s a description of the methods used in your code:

len():

Returns the length of the string.
Example: len = str1.len(); returns the number of characters in str1.
Output: The length of "GIRIDHAR VENKATESH" is 18.
putc(index, char):

Inserts a character at the specified index in the string.
Example: str2.putc(8, " "); inserts a space character at index 8 in str2.
Output: Changes "giridhar_venkatesh" to "giridhar venkatesh".
getc(index):

Retrieves a character from the string at the specified index.
Example: char = str1.getc(7); retrieves the character at index 7 from str1.
Output: The character at index 7 in "GIRIDHAR VENKATESH" is 'R'.
tolower():

Converts all characters in the string to lowercase.
Example: str1 = tolower(str1); converts the string to lowercase.
Output: "GIRIDHAR VENKATESH" becomes "giridhar venkatesh".
toupper():

Converts all characters in the string to uppercase.
Example: str2 = toupper(str2); converts the string to uppercase.
Output: "giridhar venkatesh" becomes "GIRIDHAR VENKATESH".
compare():

Compares two strings in a case-sensitive manner. It returns 0 if the strings are equal and a non-zero value otherwise.
Example: cmp = str1.compare(str2);
Output: Since "giridhar venkatesh" and "GIRIDHAR VENKATESH" are not equal in case-sensitive comparison, it returns a non-zero value (32).
icompare():

Compares two strings in a case-insensitive manner. It returns 0 if the strings are equal and a non-zero value otherwise.
Example: icmp = str1.icompare(str2);
Output: The strings "giridhar venkatesh" and "GIRIDHAR VENKATESH" are considered equal in case-insensitive comparison, so it returns 0.
substr(start, end):

Extracts a substring from the string between the specified indices.
Example: substr = str1.substr(9, 17);
Output: The substring from index 9 to 14 of "giridhar venkatesh" is "venkatesh".
atoreal():

Converts the string into a real (floating-point) number. If the string does not represent a valid number, it returns 0.
Example: realnum = str1.atoreal();
Output: "giridhar venkatesh" is not a number, so it returns 0.000000.
atoi():

Converts the string into an integer. If the string does not represent a valid number, it returns 0.
Example: intnum = str2.atoi();
Output: "GIRIDHAR VENKATESH" is not a number, so it returns 0.
Advantages of SystemVerilog Strings:
Dynamic Size: Strings can grow or shrink as needed, making them more flexible than fixed-size arrays.
Built-in Methods: String manipulation becomes much simpler using the built-in methods such as len(), tolower(), toupper(), and substr().
Readable Code: String operations are more intuitive and readable, improving code maintainability.
Convenient Comparisons: Built-in comparison functions make string comparison easier (both case-sensitive and case-insensitive).
Disadvantages of SystemVerilog Strings:
Performance Overhead: Since strings are dynamic, there might be performance overhead compared to fixed-size character arrays, especially in large-scale simulations.
Limited Real-world Use: Strings in SystemVerilog are typically not synthesized, meaning they are mainly useful for testbenches or simulation-based tasks.
Non-numerical Conversion Issues: When attempting to convert non-numeric strings to real or integer values, the result is always 0, which may not always provide meaningful feedback.
Code Walkthrough and Explanation:
Your code demonstrates how to use various SystemVerilog string methods to perform operations on two strings str1 and str2. The operations include length calculation, character insertion, character retrieval, case conversion, string comparison, and substring extraction. Additionally, it showcases how to convert strings to numbers using atoreal() and atoi().

Length Calculation:
The len() method is used to compute the length of str1, which returns 18, corresponding to the number of characters in "GIRIDHAR VENKATESH".

Character Insertion:
The putc() method inserts a space at index 8 of str2, converting "giridhar_venkatesh" to "giridhar venkatesh".

Character Retrieval:
The getc() method retrieves the character at index 7 from str1, returning 'R'.

Case Conversion:
tolower() converts str1 to lowercase, changing "GIRIDHAR VENKATESH" to "giridhar venkatesh".
toupper() converts str2 to uppercase, changing "giridhar venkatesh" to "GIRIDHAR VENKATESH".

String Comparison:
The compare() method compares str1 and str2 in a case-sensitive manner, returning 32 due to the ASCII difference between uppercase and lowercase letters.
The icompare() method performs a case-insensitive comparison and returns 0, indicating that the strings are equal.

Substring Extraction:
The substr() method extracts a substring from str1 between indices 9 and 17, returning "venkatesh".

String to Number Conversion:
Both atoreal() and atoi() attempt to convert the strings to numbers. Since "giridhar venkatesh" and "GIRIDHAR VENKATESH" are not valid numbers, they both return 0.

Tools Used:
EDA Playground Siemens Questa 2023.0.3:
This tool was used to execute and simulate the SystemVerilog code. It provides a cloud-based environment for running SystemVerilog simulations using the Siemens Questa simulator. The outputs were generated from this tool.

Gvim Text Editor:
Gvim was used for editing and debugging the SystemVerilog code. It’s a powerful text editor that supports syntax highlighting for hardware description languages (HDLs) like SystemVerilog, making it an efficient tool for code writing and debugging.

