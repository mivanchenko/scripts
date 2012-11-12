#!/usr/bin/env perl

use Time::HiRes qw( gettimeofday tv_interval );
my $t0 = [gettimeofday];

slow_function();

print tv_interval( $t0 ) . " sec\n";

sub slow_function
{
	print "Type something: ";
	my $data = <>;
}
