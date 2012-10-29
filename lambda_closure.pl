#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

my $var1 = 'first';
my $var2 = 'second';

call( $var1, 'stop' );

sub call {
	my $arg = shift;
	my $default = sub { print 'default' };
	(
		{
			$var1 => sub { print $var1 . q{ } . shift },
			$var2 => sub { print $var2 . q{ } . shift },
		}->{$arg} || $default
	)->(@_);
	print "\n";
}
