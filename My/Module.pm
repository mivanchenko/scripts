package My::Module;

our $var = 42;

sub new {
	return bless {}, __PACKAGE__;
}

sub diag {
	my $self = shift;
	return 1;
}

1;
