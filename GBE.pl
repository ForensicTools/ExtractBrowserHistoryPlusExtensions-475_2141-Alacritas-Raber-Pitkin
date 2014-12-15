=begin
Name: GBE.pl
Program title: Ghost Windows Browser Extractor (GBE)
Authors: Lucian Alacritas, Rashele Raber, Rafidah Pitkin
Description: 
	Go into Chrome history; list visited sites and the
	amount of times visited. Output is shown in command 
	line and Excel spreadsheet.
Tested on: Windows 7, Windows 8.1

Regex help from http://www.somacon.com/p127.php
Count help from http://perlmaven.com/count-words-in-text-using-perl
=cut

#!/usr/bin/perl
use warnings;
use strict;

my $name = getlogin();	#get currently logged-in username
my @hits=();			#array for found websites
my $size=0;				#number of websites found

#open Chrome History file; get the lines; close the file
open FILE, "C:/Users/$name/AppData/Local/Google/Chrome/User Data/Default/History" or die $!;
my @lines = <FILE>;
close FILE;

#new Excel file for output
open FILE, ">C:/Users/$name/Desktop/Weblist.csv";

foreach my $lines (@lines)
{
	#search for http[s]:// up until a slash after the TLD
	if($lines=~ m/https?\:\/\/(.*?)\//) 
	{ 
		push(@hits, $1);
	}
	$size = @hits;
}
print FILE "Number of hits:\t $size\n\n";
print "Number of hits:\t $size\n\n";

#hash that will hold site names + amount of times they show up
my %count;

#sort and count websites
foreach my $num (sort @hits)
{
	$count{$num}++;
}

#print out website + count number (without repeats)
printf FILE "%-31s , %s\n", "Website", "Count";
printf "%-31s %s\n", "Website", "Count";
foreach my $str (sort keys %count) 
{
	printf "%-31s %s\n", $str, $count{$str};
    printf FILE "%-31s , %s\n", $str, $count{$str};
}

close FILE;
