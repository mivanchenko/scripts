#!/usr/bin/env perl

use Carp;
use English qw( -no_match_vars );
#use Fatal qw( open close );

my $file = 'z';

open my $fh, '<', $file
	or croak "Can't open [$file]: [$OS_ERROR]"
;
close $fh;
close $fhd;
