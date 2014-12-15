=head
Name: GBE_Safari.pl
Program title: Ghost Windows Browser Extractor (GBE)
Authors: Lucian Alacritas, Rashele Raber, Rafidah Pitkin
Description: 
	Go into Safari history; list visited sites and the
	amount of times visited. Output is shown in command 
	line and Excel spreadsheets.
Tested on: Windows 7x64

Regex help from http://www.somacon.com/p127.php
Count help from http://perlmaven.com/count-words-in-text-using-perl
Spreadsheet help from http://search.cpan.org/dist/Spreadsheet-WriteExcel/ and
http://search.cpan.org/~jmcnamara/Spreadsheet-WriteExcel-2.37/lib/Spreadsheet/WriteExcel/Examples.pm
=cut

#!/usr/bin/perl
use warnings;
use strict;
use Spreadsheet::WriteExcel;
use Parse::RecDescent;
use File::HomeDir qw(home);

my $dir = home();		#get currently logged-in user's home directory
my @hits=();			#array for found websites
my $size;				#number of hits found
my $sitecount;			#number of websites found
my @excelwebsite;		#array used for excel spreadsheet
my @excelcounter;		#array used for excel spreadsheet

#open Safari History file; get the lines; close the file
open FILE, "$dir/AppData/Roaming/Apple Computer/Safari/History.plist" or die "File doesn't exist!\n";
my @lines = <FILE>;
close FILE;

foreach my $lines (@lines)
{
	#search for http[s]:// up until a slash after the TLD
	while($lines=~ m{https?\:\/\/(.*?)\/}g) 
	{
		push(@hits, $1);
	}
	$size = @hits;
}

#hash that will hold site names + amount of times they show up
my %count;

#sort and count websites
foreach my $num (sort @hits)
{
	$count{$num}++;
}

#Get the current date and time
print "\nThe current time is: ";
print scalar localtime, "\n";
print "Number of hits:\t $size\n\n";

#print websites and their count to the command line
#also push them into the excel arrays
foreach my $str (sort keys %count)
{
	printf "%-31s %s\n", $str, $count{$str};
	push(@excelwebsite, $str);
	push(@excelcounter, $count{$str});
	$sitecount++; 
}

#adds 1 more so the Excel graphs don't miss the last one
$sitecount++; 

#begin creating Excel file; insert data
my $workbook  = Spreadsheet::WriteExcel->new( 'SafariResult.xls' );
my $worksheet = $workbook->add_worksheet();
my $bold      = $workbook->add_format( bold => 1 );
my $headings  = [ 'Website', 'Count' ];
my $data = [
        [ @excelwebsite ],
        [ @excelcounter ],
    ];
$worksheet->set_column('A:A', 36);
$worksheet->write( 'A1', $headings, $bold );
$worksheet->write( 'A2', $data );

#line chart
my $line_chart = $workbook->add_chart( type => 'line' );
$line_chart->add_series( 
	categories => "=Sheet1!\$A\$2:\$A\$$sitecount",
    values     => "=Sheet1!\$B\$2:\$B\$$sitecount", 
	name => 'Line chart' );
$line_chart->set_x_axis( name => 'Websites' );
$line_chart->set_y_axis( name => 'Count' );
	
#pie chart
my $pie_chart = $workbook->add_chart( type => 'pie' );
$pie_chart->add_series( 
	categories => "=Sheet1!\$A\$2:\$A\$$sitecount",
    values     => "=Sheet1!\$B\$2:\$B\$$sitecount",
	name => 'Pie chart' );
	
#bar chart
my $bar_chart = $workbook->add_chart( type => 'bar' );
$bar_chart->add_series( 
	categories => "=Sheet1!\$A\$2:\$A\$$sitecount",
    values     => "=Sheet1!\$B\$2:\$B\$$sitecount",
	name => 'Bar chart' );
$bar_chart->set_x_axis( name => 'Websites' );
$bar_chart->set_y_axis( name => 'Count' );
	
#column chart
my $column_chart = $workbook->add_chart( type => 'column' );
$column_chart->add_series( 
	categories => "=Sheet1!\$A\$2:\$A\$$sitecount",
    values     => "=Sheet1!\$B\$2:\$B\$$sitecount",
	name => 'Column chart' );
$column_chart->set_x_axis( name => 'Websites' );
$column_chart->set_y_axis( name => 'Count' );