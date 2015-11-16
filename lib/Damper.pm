package Damper;
use base 'Exporter';
our @EXPORT = qw(damp);
use Data::Printer { output => '/Users/mivanchenko/work/debug' };
sub damp { p $_ for @_ }
1;

__END__
package Damper;
use base 'Exporter';
use Data::Dumper;
$Data::Dumper::Deparse = 1;
our @EXPORT = qw(damp);

sub damp {
	my $filename = '/Users/mivanchenko/work/debug';
	open my $fh, ">> $filename" or die "Can't write to $filename";
	foreach (@_) {
		print $fh Dumper $_;
	}
	close $fh;
}
1;
