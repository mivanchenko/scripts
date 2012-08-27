#!/usr/bin/env perl

use strict;
use warnings;

=head1 Usage

 ./words.pl book.txt N

=head1 Description

Lists the most used N words from a book.
Figures out words present in a book that are absent in a system's dictionary.
If no N specified, defaults to 10.
You may download such book from gutenberg.net.

=cut

$| = 1;  # buffer off
use Data::Dumper;
use File::Slurp qw( read_file );

my %dict;
my %seen;
my %unseen;
my $n = $ARGV[1] || 10;
my $dict_path = '/usr/share/dict/british-english';

# read dict
my @dict = read_file $dict_path;
foreach my $line ( @dict ) {
	chomp $line;
	$line = lc $line;
	$dict{$line}++;
}

# read book
my $file_name = $ARGV[0];
my $content = read_file $file_name;

# split by non-word sequence
my @words = map { lc } split /\b\W+\b/, $content;

# count
foreach my $word ( @words ) {
	$seen{$word}++;
}

sort_cut_output( \%seen, $n );

do_unseens( \%dict, \%seen, $n );

sub sort_them {
	my $hash = shift;

	my @sorted_data
		=
		# [ word => freq ]
		map {
			[ $_ => $hash->{$_} ]
		}
		# sorts by value
		sort {
			$hash->{$b} <=> $hash->{$a}
		} keys %{$hash}
	;

	return \@sorted_data;
}

sub output {
	my $sorted_cut = shift;

	while ( my $piece = splice @{$sorted_cut}, 0, 1 ) {
		my $word = $piece->[0];
		my $freq = $piece->[1];
		print "$word: $freq\n";
	}

	return 1;
}

sub sort_cut_output {
	my ($words, $N) = @_;

	my $sorted_data = sort_them( $words );

	my @sorted_cut = @{$sorted_data}[ 0 .. $N - 1 ];

	output( \@sorted_cut );

	return 1;
}

sub do_unseens {
	my ($dict, $seen, $n) = @_;

	my $unseen;

	print "\n---Unseens:\n";

	# figure out unseens
	foreach my $word ( keys %{$seen} ) {
		if ( ! exists $dict->{$word} ) {
			$unseen->{$word}++;
		}
	}

	sort_cut_output( $unseen, $n );
}
