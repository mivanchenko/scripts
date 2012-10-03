#!/usr/bin/env perl

use strict;
use warnings;

=head1 Note

Non-recursive

=head1 Usage

 ./grep.pl 'pattern' file1 dir2/*

=cut

sub croak { die "$0: [@_]: [$!]\n" }

my ($pattern, @files) = @ARGV;

foreach my $file ( @files ) {
	if ( -f $file ) {
		grape( $pattern, $file );
	}
}

sub grape {
	my ($pattern, $file_name) = @_;

	open my $fh, $file_name
		or croak $file_name;
	
	while ( my $line = <$fh> ) {
		if ( $line =~ $pattern ) {
			print $line;
		}
	}

	close $fh;

	return 1;
}
