#!/usr/bin/perl
use v5.10.0;
use warnings;
use strict;

use File::Path qw(mkpath);


package main;

#Check if .local/putitoff directory exists
if ( -d "$ENV{HOME}/.local/putitoff") {
  print "dir exists\n";
}
else{
  print  "dir doesn't exist\n";
  print  "creating directory\n";
  mkpath("$ENV{HOME}/.local/putitoff");

}

#assign our database file to $filename REMEMBER ~/ DOES NOT WORK
my $filename = "$ENV{HOME}/.local/putitoff/putitoff.db";

#localize the filehandler
my $fh;

#If the file is there print it out, else create a test case and print it out
if (open($fh, '<', $filename)) {
  print "file exists\n";
  print <$fh>;
  close $fh;
}
else {
  print "Creating example file\n";  
  open($fh, '>', $filename) or die "fuck"; 
  print $fh "Test 1\nTest 2\nTest 3\n";
  close $fh;


  open($fh, '<', $filename); 
  print <$fh>;
  close $fh;

}
