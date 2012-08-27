#!/usr/bin/env perl

use Perl::Critic;

my @files = @ARGV;
print "Usage: $0 <file1> ...\n" unless scalar(@ARGV);

my $critic = Perl::Critic->new( -profile => '/home/michael/.perlcriticrc' );

foreach my $file ( @files ) {
	my @violations = $critic->critique( $file );

	print "\n[$file]:\n";

	if ( ! scalar(@violations) ) {
		print "ok\n";
	}
	else {
		print @violations;
	}

	print "\n";
}
