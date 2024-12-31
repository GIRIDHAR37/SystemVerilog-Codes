#!/usr/bin/perl
# Open the test list file
use testcase
open FH, "<testname_list.txt";
my @tests = <FH>;
# Set the APB_HOME path
#my $APB_HOME = "E:/Perl/perl_ex_codes/APB_VERIFICATION_SV_REGRESSION";
# Iterate through all test cases
foreach my $testname (@tests) {
    chomp($testname);
    $testname =~ s/\r//g;
    my $testname_log = $testname."\.log";
    my $testname_ucdb = $testname."\.ucdb ";
    #compile
    system ("vlib work");
    system ("vmap work work");
    system ("vlog apb_tb.sv");
    #optimizing
    system ("vopt apb_tb +cover=fcbest -o $testname");
    #elaborating
    system ("vsim -c +testname=$testname -l $testname_log -coverage $testname -do \"coverage save -onexit $testname_ucdb\" -do \"run -all\" -do \"vcov merge final_regr.ucdb $testname_ucdb\"");
#    system ("vsim -c +testname=$testname -l $testname_log -coverage $testname -do \"coverage save -onexit $testname_ucdb\" -do \"run -all\"");
#    system ("vsim -do \"vcov merge final_regr.ucdb $testname_ucdb\"");
}
#merging all ucdb files
$merge_cmd = "vcov merge final_regr.ucdb ";
foreach $testname (@tests){
        chomp($testname);
        $merge_cmd =~ s/\r//g;
        my $testname_ucdb = $testname."\.ucdb ";
        $merge_cmd = $merge_cmd."$testname_ucdb";
}
print "$merge_cmd\n";
system ("vsim -c -do \"$merge_cmd\" -do \"exit\"");
#Report the test pass/fail summary in required fromat
system ("vsim -c -do \"coverage open final_regr.ucdb final_reg\" -do \"coverage report -html -htmldir covhtmlreport_regr -source -details -verbose -threshL 50 -threshH 90\" -do \"exit\"");
#Generate xls
@testcase_arr;
&generate_xls();
sub generate_xls() {
    print "running generate_xls\n";
    foreach $testname (@tests) {
        chomp($testname);
        $testname =~ s/\r//g;
        #get test status
        $testname_log = $testname."\.log";
        open  FR_T, "<$testname_log";
        my @testlines = <FR_T>;
        $err_count=0;
        foreach $line(@testlines){
            if($line =~ m/test passed/i) {$status = "PASSED";}
            if($line =~ m/test failed/i) {$status = "FAILED";}
            if($line =~ m/ERROR \:/) {$err_count++;}
        }
        $sno++;
        $descr = $testname;
 #       $err_count=0; #from the log files get number of errors (search for errors)
        push(@testcase_arr, new testcase($sno,$testname,$status,$descr,$err_count));
    }
    #printing all the elements of array of xls
    foreach (@testcase_arr){
        $_->printinfo();
    }
    #populate xls
    &write_xls();
}

sub write_xls() {
        use Spreadsheet::WriteExcel;
        my $workbook = Spreadsheet::WriteExcel->new('regr_summary.xls');
        my $worksheet = $workbook->add_worksheet();
 #       $sno=0;
        $row=0;
        #fill the column element name
        $worksheet->write($row, 0, "Sno");
        $worksheet->write($row, 1, "NAME");
        $worksheet->write($row, 2, "STATUS");
        $worksheet->write($row, 3, "DESCRIPTION");
        $worksheet->write($row, 4, "ERROR_COUNT");
        $row++;
        
        foreach $test_info(@testcase_arr){
            $worksheet->write($row, 0, $test_info->{sno});
            $worksheet->write($row, 1, $test_info->{name});
            $worksheet->write($row, 2, $test_info->{status});
            $worksheet->write($row, 3, $test_info->{descr});
            $worksheet->write($row, 4, $test_info->{err_count});
            $row++;
            $sno++;
        }
        $workbook->close() or die "Error closing file : $!..";
}
print "RUNNING BY PERL SCRIPT\n";

=cut
#!/usr/bin/perl
# Open the test list file
open FH, "<testname_list.txt";
my @tests = <FH>;
#close FH;

# Iterate through all test cases
foreach my $testname (@tests) {
    chomp($testname);
    my $testname_log = $testname."\.log";
    my $testname_ucdb = $testname."\.ucdb";

    # Compile
    system("vlib work");
    system("vmap work work");
    system("vlog apb_tb.sv");

    # Optimize
    system("vopt apb_tb +cover=fcbest -o $testname");

    # Elaborate and simulate
    system("vsim -c -coverage $testname -l $testname_log -novopt -suppress 12110 -do \"coverage save -onexit $testname_ucdb\" -do \"run -all\"");

    # Merge coverage
    system("-do \"vcov merge final_regr.ucdb <$testname_ucdb>\"");
}

print "RUNNING BY PERL SCRIPT\n";
=cut

=cut
#    $testname =~ s/\r//g;  # Remove any carriage return characters
    # Compile
    print "Compiling $testname\n";
    system("vlib work");
    system("vmap work work");
    system("vlog +incdir+${APB_HOME}/$testname") == 0
        or warn "Compilation failed for apb_tb!.....\n";
    # Optimize to generate coverage report
    print "Optimizing $testname\n";
    system("vopt apb_tb +cover=fcbest -o $testname") == 0
        or warn "Optimization failed for test $testname!.....\n";
    # Elaborate and run simulation
    print "Elaborating $testname\n";
    my $testname_log = $testname."\.log";
    my $testname_ucdb = $testname."\.ucdb";
    system("vsim -c +testname=$testname -l $testname_log -coverage $testname -novopt -suppress 12110 -do \"coverage save -onexit $testname_ucdb\" -do \"run -all\" -do \"vcov merge final_regr.ucdb $testname_ucdb\"") == 0
        or warn "Simulation failed for test $testname!......\n";
}
=cut

=cut
#!/usr/bin/perl
#open the testlist file
open FH,"<testname_list.txt";
@tests = <FH>;
$APB_HOME = "E:/Perl/perl_ex_codes/APB_VERIFICATION_SV_REGRESSION";   
#Foreach on all testcases
foreach $testname(@tests){
	chomp($testname);
	$testname =~ s/\r//g;
	#compile
	print"compiling $testname\n";
	system("vlog +incdir+${APB_HOME}/$testname");
	#optimize is used to generate coverage report, we run vopt command
	print"optimizing $testname\n";
	system ("vopt apb_tb +cover=fcbest -o $testname"); #gives out executable file,named same as testname
	#elaboration
	print"elaborating $testname\n";
	$testname_log = $testname."\.log";
	$testname_ucdb = $testname."\.ucdb";
        system("vsim -c +testname=$testname -l $testname_log -coverage $testname -do \"coverage save -onexit $testname_ucdb\" -do \"run -all\" -do \"vcov merge final_regr.ucdb $testname_ucdb\" ");     
}
=cut

