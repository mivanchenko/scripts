#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use Fatal qw( open close );
use Module::ExtractUse;
use Path::Class::Rule;

my $code_string = get_code_string('.');

my $extractor = Module::ExtractUse->new;

my @used = sort $extractor->extract_use( \$code_string )->array;

print join( "\n", @used );
print "\n";

# END

# Returns a sheet of perl code for a given dir recursively
sub get_code_string {
	my $dir = shift;
	my $code_string;

	my $files = get_perl_files( $dir );

	foreach my $file ( @{$files} ) {
		open my $fh, '<', $file;
		while ( my $line = <$fh> ) {
			$code_string .= $line;
		}
		close $fh;
	}

	return $code_string;
}

# Finds all files with perl code
sub get_perl_files {
	my $dir = shift;
	my @files;

	my $rule = Path::Class::Rule->new->perl_file;
	$rule->not_name( qr/.*sw[op]$/ );

	foreach my $file ( $rule->all( $dir ) ) {
		push @files, $file->{'dir'}->absolute->stringify.'/'.$file->{'file'};
	}

	return \@files;
}
