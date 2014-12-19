#!/usr/bin/env perl

use strict;
use warnings;

push my @commands, (
        'cd /home/monk00/monk.in.ua/monk',
        'git checkout HEAD -- .',
        'git pull',
        'cd - >/dev/null',
);

my $command = join( ' 2>&1'."\n", @commands );

my $result = qx( $command );

print "Content-Type: text/html\n\n";
print "<html><body>\n";
print "$result\n";
print "</body></html>\n";

