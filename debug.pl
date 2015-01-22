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

# @HACK
use Data::Dumper;
warn "\n::DEBUG ".__PACKAGE__.' '.(caller)[3].":\n";
warn "[]\n";

sub debug {
	my @messages = @_;
	use Data::Dumper;
	print "<<< DEBUG ".__PACKAGE__.((caller)[3]?' '.(caller)[3]:'').":\n";
#	print Dumper( \@messages );
	print scalar @messages;
	print "\n>>>\n";
}
