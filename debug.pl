sub debug {
	my $message = shift;
	print "DEBUG: [$message]\n";
}

sub debug {
	my @messages = @_;

	require Data::Dumper;
	Data::Dumper->import(qw(Dumper));
	$Data::Dumper::Terse = 1;
	$Data::Dumper::Indent = 1;

	print Dumper( \@messages );
}

sub debug {
	my $message = shift;
	print Dumper( $message );
}

sub debug {
	my $message = shift;
	$Data::Dumper::Terse = 1;
	$Data::Dumper::Indent = 1;
	if ( $DEBUG ) {
		print Dumper( $message );
	}
}
