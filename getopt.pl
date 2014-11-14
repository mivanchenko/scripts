#!/usr/bin/env perl

use Getopt::Long;

my ($ticket, $branch, $count);

GetOptions(
        't|ticket=s' => \$ticket,
        'c|count=i'  => \$count,
) or die(
        "Usage: $0 --ticket=qwe123 --count=75\n"
        . "   or: $0 -t qwe123 -c 75\n"
);

print "ticket: [$ticket]\n";
print "count:  [$count]\n";
