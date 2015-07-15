package Damper;
use base 'Exporter';
use Data::Dumper;
our @EXPORT = qw(damp);
sub damp {
	my $filename = '~/temp/debug';
	open my $fh, ">> $filename" or die "Can't write to $filename";
	foreach ( @_ ) {
		print $fh Dumper $_;
	}
	close $fh;
}
1;
