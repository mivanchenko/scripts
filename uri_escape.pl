#!/usr/bin/env perl

use URI::Escape;

my $str = 'web@master';

$str = uri_escape( $str );

print "$str\n";
