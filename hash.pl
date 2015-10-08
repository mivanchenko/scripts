#!/usr/bin/env perl

use Data::Dumper;

my $hash = {
	qwe => 123,
	defined $7 ? (nanosecond => $7) : (),
};

print Dumper $hash;
