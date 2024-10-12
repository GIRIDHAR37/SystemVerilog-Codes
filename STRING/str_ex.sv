module top;

	string str1 = "GIRIDHAR VENKATESH";
	string str2 = "giridhar_venkatesh";
	string substr,name;
	int len,cmp,icmp,intnum;
	real realnum;
	byte char;
	string g = "12345";
	string v = "67890";

	initial begin

// len : returns the length of the string
		len = str1.len();
		$display("length of str1 : %0d",len);

// putc : puting(inserting) a character at a specific index 
		str2.putc(8," ");
		$display("after puting space( ) at 8 index in str2 : %s",str2);

// getc : geting a character at a specific index 
		char = str1.getc(7);
		$display("after geting a character at 7th index in str1 : %s",char);

// tolower: Convert all characters in the string to lowercase
		str1 = str1.tolower();
		$display("After converting str1 lowercase : %s",str1);

// toupper: Convert all characters in the string to uppercase
		str2 = str2.toupper();
		$display("After converting str2 uppercase : %s",str2);

// compare : comparing two strings (case-sensitive)
        cmp = str1.compare(str2);
		$display("After comparing (case - sensitive) str1 : %s and str2 : %s cmp : %0d",str1,str2,cmp);

// icompare : comparing two strings (case-insensitive)
        icmp = str1.icompare(str2);
		$display("After comparing (case - insensitive) str1 : %s and str2 : %s icmp : %0d",str1,str2,icmp);

// substr : extracting a part from one specified index to another specified index 
		substr = str1.substr(9,17);
		$display("substring in str1 from 9 to 14 : %s",substr);

// atoreal : convert numerical string into real number value 
		realnum = str1.atoreal();
		$display("str1 : %s converted to real number value : %f",str1,realnum);

// atoi : convert numerical string into int number value 
		intnum = str2.atoi();
		$display("str2 : %s converted to int number value : %0d",str2,intnum);

// atoreal : convert numerical string into real number value 
		realnum = g.atoreal();
		$display("g : %s converted to real number value : %.2f",g,realnum);

// atoi : convert numerical string into int number value 
		intnum = v.atoi();
		$display("v : %s converted to int number value : %0d",v,intnum);

// to reverse a string
		name=str1; // make sure both strings have same string characters
		$display("str1 before reversing : %s",str1);
		for(int i;i<str1.len();i++) begin
			name.putc(i,str1[str1.len()-1-i]);
		end
		$display("after reversing str1 name : %s",name);
		
	end
endmodule

// output :
/*
# length of str1 : 18
# after puting space( ) at 8 index in str2 : giridhar venkatesh
# after geting a character at 7th index in str1 : R
# After converting str1 lowercase : giridhar venkatesh
# After converting str2 uppercase : GIRIDHAR VENKATESH
# After comparing (case - sensitive) str1 : giridhar venkatesh and str2 : GIRIDHAR VENKATESH cmp : 32
# After comparing (case - insensitive) str1 : giridhar venkatesh and str2 : GIRIDHAR VENKATESH icmp : 0
# substring in str1 from 9 to 14 : venkatesh
# str1 : giridhar venkatesh converted to real number value : 0.000000
# str2 : GIRIDHAR VENKATESH converted to int number value : 0
# g : 12345 converted to real number value : 12345.00
# v : 67890 converted to int number value : 67890
# str1 before reversing : giridhar venkatesh
# after reversing str1 name : hsetaknev rahdirig
*/
