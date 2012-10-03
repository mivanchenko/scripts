#!/usr/bin/env perl

use strict;
use warnings;

=head1 Usage

 ./cat.pl dir1 file2 dir3

=cut

sub croak { die "$0: [@_]: [$!]\n" }

foreach my $arg ( @ARGV ) {
	if ( -d $arg ) {
		print_dir( $arg );
	}
	print_file( $arg );
}

sub print_dir {
	my $dir = shift;

	my @files = glob "$dir/*";
	foreach my $file ( @files ) {
		if ( -d $file ) {
#			print "[$file] is a directory!\n";
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
		or croak $file_name;

	while ( my $line = <$fh> ) {
		print $line;
	}

	close $fh;

	return 1;
}
