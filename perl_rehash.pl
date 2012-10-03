#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

my %hash = (
	'k1' => 'v1',
	'k2' => 'v2',
);
print '2: ' . %hash . "\n" . Dumper( \%hash );

for ( 3 .. 8 ) {
	$hash{ 'k' . $_ } = 'v' . $_;
	print $_ . ': ' . %hash . "\n" . Dumper( \%hash );
}
