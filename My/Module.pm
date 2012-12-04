package My::Module;

our $var = 42;

sub new {
	return bless {}, __PACKAGE__;
}

sub pass {
	$_[0]->{'password'} = $_[1]; return 1;
}

sub get_pass {
	return $_[0]->{'password'};
}

1;
