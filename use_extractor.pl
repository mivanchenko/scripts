#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use List::MoreUtils qw( uniq );
use Module::Extract::Use;
use Path::Class::Rule;

my $dir = '.';

my $extractor = Module::Extract::Use->new;

my $files = get_perl_files( $dir );

my @modules;

foreach my $file ( @{$files} ) {
	push @modules, $extractor->get_modules( $file );
}

@modules = sort( uniq( @modules ) );

print Dumper \@modules;


# END


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
