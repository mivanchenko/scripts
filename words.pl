#!/usr/bin/env perl

use strict;
use warnings;

=head1 Usage

 ./words.pl ebook.txt N

=head1 Description

Lists the most used N words from a book.
If no N specified, defaults to 10.
You may download such book from gutenberg.net.

=cut

use Data::Dumper;
use File::Slurp qw( read_file );

my %seen;
my $N = $ARGV[1] || 10;

# read
my $file_name = $ARGV[0];
my $content = read_file $file_name;

# split by non-word sequence
my @words = map { lc } split /\b\W+\b/, $content;

# count
foreach my $word ( @words ) {
	$seen{$word}++;
}

# sort
my @sorted_data
	=
	# returns arrayref: [ word => freq ]
	map {
		[ $_ => $seen{$_} ]
	}
	# returns sorted words
	sort {
		# $a, $b - words
		# $seen{$a} - frequency of a word
		$seen{$b} <=> $seen{$a}
	} keys %seen
;

# cut
my @sorted_cut = @sorted_data[ 0 .. $N - 1 ];

# output
while ( my $piece = splice @sorted_cut, 0, 1 ) {
	my $word = $piece->[0];
	my $freq = $piece->[1];
	print "$word\n";
}
