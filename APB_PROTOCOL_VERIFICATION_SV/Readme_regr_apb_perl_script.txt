Detailed Summary of the Perl Script
This Perl script automates the regression process for verifying the APB3 Protocol using SystemVerilog. It streamlines test execution, log and coverage generation, and result analysis. Below is a more detailed explanation of the script's workflow, tools, and outputs.

1. Test Initialization
Purpose: Prepare for running the test cases listed in the testname_list.txt file.
Steps:
The file testname_list.txt contains a list of all test cases (e.g., apb_base_test, apb_overflow).
The script reads the file and stores test case names in an array for iterative processing.
Removes any unwanted carriage return characters (\r) from the test case names to avoid execution errors.
2. Test Case Execution
Purpose: Automates the compilation, optimization, simulation, and coverage analysis of each test case.
Steps:
Library Setup:
Creates (vlib) and maps (vmap) a working directory to store simulation outputs.
Compilation:
Compiles the SystemVerilog APB testbench (apb_tb.sv) using the vlog command.
Optimization:
Optimizes the compiled design for each test case with functional coverage enabled (+cover=fcbest).
Simulation:
Executes each test case using the vsim command:
Generates a log file (<testname>.log) for each test.
Collects functional coverage in a Unified Coverage Database (UCDB) file (<testname>.ucdb).
Commands ensure proper cleanup, saving coverage data upon completion.
3. Coverage Report Generation
Purpose: Consolidates individual coverage results and generates a detailed coverage report.
Steps:
Merging Coverage Files:
All individual UCDB files (<testname>.ucdb) are merged into a single file (final_regr.ucdb) using the vcov merge command.
HTML Report Creation:
Opens the merged coverage file and generates a detailed HTML report in the covhtmlreport_regr directory.
Includes coverage metrics (e.g., source code coverage, detailed analysis).
Configures threshold values (50% as low, 90% as high) for highlighting coverage gaps.
4. Result Analysis and Excel Report Generation
Purpose: Analyzes simulation logs to determine the test status, error count, and description, and creates an Excel summary.
Steps:
Log Analysis:
Opens the log file for each test case (<testname>.log).
Searches for key indicators:
Test Passed: Marks the test as "PASSED."
Test Failed or ERROR: Marks the test as "FAILED" and counts the errors.
Data Storage:
Populates test details (serial number, name, status, description, error count) into an array.
Excel Creation:
Generates an Excel file (regr_summary.xls) with columns:
Sno: Serial number of the test.
NAME: Test case name.
STATUS: Indicates "PASSED" or "FAILED."
DESCRIPTION: Matches the test case name for clarity.
ERROR_COUNT: Counts errors identified in the logs.
5. Outputs Generated
Logs:
<testname>.log: Contains the detailed execution log for each test case.
Coverage:
<testname>.ucdb: Functional coverage data for individual test cases.
final_regr.ucdb: Consolidated coverage data for the entire regression.
covhtmlreport_regr: Detailed HTML report of the functional coverage analysis.
Excel Summary:
regr_summary.xls: Summarizes test execution results, including pass/fail status, error count, and test descriptions.
Tools and Technologies Used
Simulation and Coverage Analysis:
QuestaSim:
Handles compilation, simulation, optimization, and coverage reporting.
Commands used: vlib, vmap, vlog, vopt, vsim, and vcov merge.
Perl IDE:
Padre, the Perl IDE:
Used to write and execute the Perl script for regression.
Excel Report:
Spreadsheet::WriteExcel module:
Automates the creation of the regr_summary.xls file, summarizing the test results.
Example Test Execution Summary (Based on Screenshot)
Test Cases Included:
apb_base_test
apb_overflow
apb_underflow
apb_invalid_address
Results:
All test cases passed successfully.
Error count for each test case is 0.
Description matches the test case name, making it easy to identify.
Key Benefits of the Script
Automation: Eliminates manual effort in running test cases, collecting coverage, and analyzing results.
Detailed Insights: Provides comprehensive coverage reports (HTML) and test summaries (Excel).
Scalability: Can handle large test suites efficiently, merging results seamlessly.
Error Identification: Log analysis highlights errors and failed tests for debugging.
Reusability: The script is reusable for other protocols or verification projects with minimal modifications.
This script ensures a robust and efficient workflow for verifying the APB3 Protocol, making it easier to analyze coverage gaps, debug test cases, and maintain regression results.