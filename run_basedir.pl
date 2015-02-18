#!/usr/bin/env perl

use Cwd;

# run from base dir
my $curr_dir = ( split( '/', cwd() ) )[-1];
if ( $curr_dir eq 'bin' ) {
	my $exit_code = system( 'cd .. && ./bin/this_program.pl' );
	exit $exit_code;
}

# code of "this_program.pl"
