#!/usr/bin/env perl

use File::Slurp;
my $str = read_file( 'filename' );
my $lines = read_file( 'filename', array_ref => 1, chomp => 1 );

# OR

my $str = do { local( @ARGV, $/ ) = $filename; <> };

# OR

my $str = join( '', <DATA> ); 
