=head
Name: GBE_Menu.pl
Program title: Ghost Windows Browser Extractor (GBE)
Authors: Lucian Alacritas, Rashele Raber, Rafidah Pitkin
Description: 
	Main menu. Lets the user choose what browser(s) the 
	tool will investigate.
Tested on: Windows 7x64

WARNING:
Entering random crap shows an error.
If the random crap starts with 1-6 then it just looks at the number.
=cut

#!/usr/bin/perl
use warnings;
use strict;

while (1){
	print "\nThe current time is: ";
	print scalar localtime;
	print "\n";
	print "\nWelcome to Ghost Windows Browser Extractor.
	1. Help
	2. Clear the screen
	3. Google Chrome
	4. Mozilla Firefox
	5. Apple Safari
	6. Opera Software
	7. Exit
Please select an option from the menu above: ";

	chomp(my $choice = <STDIN>);

	if ($choice == 1){
		print "\nThis tool extracts the history from the four
browsers mentioned above. The information will then
be visible in the command line, as well as in an
excel spreadsheet. \n";
		next;
	}
	elsif ($choice == 2) {
		system("cls");
		next;
	}
	elsif ($choice == 3){
		system("GBE_Chrome.pl");
		next;
	}
	elsif ($choice == 4){
		system("GBE_Firefox.pl");
		next;
	}
	elsif ($choice == 5){
		system("GBE_Safari.pl");
		next;
	}
	elsif ($choice == 6){
		system("GBE_Opera.pl");
		next;
	}
	elsif ($choice == 7){
		exit;
	}
	else {
		print "\nInvalid option!\n";
		next;
	}
}