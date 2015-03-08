package Subs;
use strict;
use v5.10.0;
use warnings;
use File::Path qw(mkpath);

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
  	print $fh "Test1, 1/2/1987\nTest2, 4/19/1925\nTest3, 01/01/2023\n";
  	close $fh;
  	
		open($fh, '<', $filename); 
  	print <$fh>;
  	close $fh;
	}
}

sub read_db {
	#read the csv, add each line to a hash.
	my $filename = shift;
	my %data = ();
	
	open(my $fh, '<', $filename) or die "Could not open '$filename' $!\n";

	while (my $line = <$fh>) {
		chomp $line;
		my @fields = split "," , $line;
	  $data{$fields[0]} = $fields[1];	
	}
	return %data;
}
1;
