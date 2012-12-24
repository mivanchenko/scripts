#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

$ENV{'HTTP_HOST'} = 'host.com';

my ($first, $second) = split( //, $ENV{'HTTP_HOST'}, 2 + 1 );
print "$first/$second/$ENV{'HTTP_HOST'}\n";
