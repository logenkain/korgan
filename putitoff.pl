#!/usr/bin/perl
use v5.10.0;
use warnings;
use strict;

use File::Path qw(mkpath);

package main;

#######SUBROUTINES##########
sub init_dir {
	my $dir = shift;

	if ( -d "$dir") {
  	print "dir exists\n";
	}
	else{
 	 print  "dir doesn't exist\n";
 	 print  "creating directory\n";
 	 mkpath("$ENV{HOME}/.local/putitoff");
	}
}

#If the file is there print it out, else create a test case and print it out
sub init_file {
my $fh;
my $filename = shift;
	if (open($fh, '<', $filename)) {
	  print "file exists\n";
 	 print <$fh>;
 	 close $fh;
	}
	else {
  	print "Creating example file\n";  
  	open($fh, '>', $filename) or die "Can't write to $filename"; 
  	print $fh "Test 1\nTest 2\nTest 3\n";
  	close $fh;
  	
		open($fh, '<', $filename); 
  	print <$fh>;
  	close $fh;
	}
}

#######END SECTION##########

#assign our database file to $filename REMEMBER ~/ DOES NOT WORK
my $filename = "$ENV{HOME}/.local/putitoff/putitoff.db";

#Local dir to save database
my $dir = "$ENV{HOME}/.local/putitoff/";

#initalize directory and file if they do not exist.
init_dir($dir);
init_file($filename);

