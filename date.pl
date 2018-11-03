#!/usr/bin/env perl

use POSIX qw( strftime );
my $date = strftime( '%Y%m%d', gmtime(time) );
print "$date\n";

use POSIX;
my $date = POSIX::strftime( '%Y-%m-%d %H:%M:%S', localtime );
my $date = POSIX::strftime( "[%Y-%m-%d %T]\n", localtime );
print "$date\n";

use Time::Piece;
my $time = Time::Piece->new->strftime('%Y-%m-%d %T');

use Time::HiRes qw( gettimeofday );
my ($s, $usec) = gettimeofday();
print "s: [$s], usec: [$usec]\n";

######################

my @date = localtime;
my $date = sprintf( '%04d%02d%02d_%02d%02d%02d',
	$date[5] + 1900, $date[4] + 1, reverse @date[0..3] );

print "$date\n";

######################

my @date = ( localtime( time ) )[3..5];
my $date = sprintf( '%04d%02d%02d', $date[2] + 1900, $date[1] + 1, $date[0] );

print "$date\n";
