#!/usr/bin/env perl

use File::Slurp;
my $str = read_file( 'filename' );
my $lines = read_file( 'filename', array_ref => 1, chomp => 1 );

# OR

my $str = do { local( @ARGV, $/ ) = $file_path; <> };

## get a file_name from STDIN
#do { local $/; <> };

# OR

my $str = do { local $/; <DATA> };

# OR

my $str = join( '', <DATA> ); 
