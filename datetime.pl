#!/usr/bin/env perl

use POSIX qw( strftime );
my $date = strftime( '%Y%m%d', gmtime(time) );
print "$date\n";


use Time::HiRes qw( gettimeofday );
my ($s, $usec) = gettimeofday();
print "s: [$s], usec: [$usec]\n";
