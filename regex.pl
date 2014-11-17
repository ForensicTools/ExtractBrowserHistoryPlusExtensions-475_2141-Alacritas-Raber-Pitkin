#!/usr/bin/perl
use warnings;
use strict;

#help from http://www.somacon.com/p127.php
#help from http://perlmaven.com/count-words-in-text-using-perl

my $name = getlogin();	#current username
my @hits=();
my $size=0;

#open Chrome history file; get the lines; close the file
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
printf FILE "%-31s %s\n", "Website", "Count";
printf "%-31s %s\n", "Website", "Count";
foreach my $str (sort keys %count) 
{
	printf "%-31s %s\n", $str, $count{$str};
    printf FILE "%-31s %s\n", $str, $count{$str};
}

close FILE;