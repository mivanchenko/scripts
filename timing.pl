#!/usr/bin/env perl

use Time::HiRes;
my $t0 = [Time::HiRes::gettimeofday()];

slow_function();

print tv_interval($t0) . " sec\n";

sub slow_function
{
	print "Type something: ";
	my $data = <>;
}
