#!/usr/bin/env perl

use Data::Dumper;
use Readonly;

my $hash = {
	qwe => 123,
	defined $7 ? (nanosecond => $7) : (),
};

Readonly::Scalar my $KEYS_HASH => { map { $_ => 1 } qw(
	key1 key2
)};

print Dumper $hash;
