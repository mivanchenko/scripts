package My::Module;

our $var = 42;

sub new {
	return bless {}, __PACKAGE__;
}

1;
