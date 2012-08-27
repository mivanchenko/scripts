sub debug {
	my $message = shift;
	print Dumper( $message );
}

sub debug {
	my @messages = @_;
	print Dumper( \@messages );
}

sub debug {
	my $message = shift;
	$Data::Dumper::Terse = 1;
	$Data::Dumper::Indent = 1;
	if ( $DEBUG ) {
		print Dumper( $message );
	}
}
