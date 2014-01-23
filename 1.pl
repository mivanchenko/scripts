#!/usr/bin/env perl

use strict;
use warnings;

my @pages_keys_ordered = qw(
	home search category
);

my %pages = (
	home     => 'Home page',
	search   => 'Search page',
	category => 'Category page',
);

foreach my $page_key ( @pages_keys_ordered ) {
	print "$page_key: $pages{$page_key}\n";
}

my $file = __FILE__;
my $host = substr($file, 1, 3);
print "file $file\n";
print "host: $host\n";
