#!/usr/bin/env perl

use Data::Dumper;
use List::Compare;

my @arr1 = qw( free bsd shmsd );
my @arr2 = qw(          shmsd yo );
my $lc = List::Compare->new( \@arr1, \@arr2 );

# intersection
my @intersection = $lc->get_intersection;
print "@intersection\n";

# union
my @union = $lc->get_union;
print "@union\n";

# outersection
my @outersection = $lc->get_symmetric_difference;
print "@outersection\n";


##
# for arrays of strings only
my @arr1 = qw( free bsd shmsd );
my @arr2 = (
	{
		'id' => '111',
		'name' => 'shmsd',
	},
	{
		'id' => '222',
		'name' => 'free',
	}
);

my %IN_ARR1 = map { $_ => 1 } @arr1;

my @ids
	= map {
		$_->{'id'}
	}
	grep {
		$IN_ARR1{ $_->{'name'} };
	} @arr2;

print "@ids\n";

