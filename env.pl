#!/usr/bin/env perl

print "Content-type: text/html; \n\n";

foreach my $k ( sort keys %ENV ) {
	print "$k: $ENV{$k}<br />\n";
}
