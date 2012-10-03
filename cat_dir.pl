#!/usr/bin/env perl

use strict;
use warnings;

=head1 Usage

 ./cat_dir.pl dir1 dir2

=cut

foreach my $arg ( @ARGV ) {
	if ( -d $arg ) {
		print_dir( $arg );
	}
}

sub print_dir {
	my $dir = shift;

	my @files = glob "$dir/*";
	foreach my $file ( @files ) {
		if ( -d $file ) {
			print "[$file] is a directory!\n";
			print_dir( $file );
			next;
		}
		print_file( $file );
	}

	return 1;
}

sub print_file {
	my $file_name = shift;

	open my $fh, $file_name
		or die "Can't open file [$file_name]: [$!]";

	while ( my $line = <$fh> ) {
		print $line;
	}

	close $fh;

	return 1;
}
