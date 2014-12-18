package My::Module;

#our @ISA = qw( Exporter );
#our @EXPORT_OK = qw( add_segments );

use base 'Exporter';
our @EXPORT_OK = qw( add_segments );

our $var = 42;
my $varlock = 12345;

sub new {
	return bless {}, __PACKAGE__;
}

sub pass {
	$_[0]->{'password'} = $_[1]; return 1;
}

sub get_pass {
	return $_[0]->{'password'};
}

sub add_segments {
	print "add_segments: $varlock\n";
	return 'ok';
}

sub My::Module::handler {
	print "handler: $varlock\n";
}

1;
