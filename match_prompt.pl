#!/usr/bin/perl

while ( <> ) {
	chomp;
	if ( /42/ ) {
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_|\n";
	}
}
