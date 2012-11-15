#!/usr/bin/env perl

use My::Module;

my $m = My::Module->new();

if ( $m->can('new') ) {
	print 'yes';
}

print "\n";
