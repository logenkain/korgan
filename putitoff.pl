#!/usr/bin/perl
use v5.10.0;
use warnings;
use strict;

package main;
require 'src/subs.pm';

#assign our database file to $filename REMEMBER ~/ DOES NOT WORK
my $filename = "$ENV{HOME}/.local/putitoff/putitoff.db";

#Local dir to save database
my $dir = "$ENV{HOME}/.local/putitoff/";

#initalize directory and file if they do not exist.
Subs::init_dir($dir);
Subs::init_file($filename);
my %data = Subs::read_db($filename);
print "going to print data!\n";

print "Key: $_ and Value: $data{$_}\n" foreach (keys%data);
