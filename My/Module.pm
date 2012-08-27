package My::Module;
use v5.10;

use My::Page;

#say $My::Page::page;

#our @ISA = qw( Exporter );
#our @EXPORT_OK = qw( add_segments );

use base 'Exporter';
our @EXPORT_OK = qw( add_segments );

our $var = 42;
my $varlock = 12345;

my $is_test;

sub import {
	$is_test = !! $_[1];
#	say $is_test;
}

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
	debug($varlock);
	return 'ok';
}

sub My::Module::handler {
	print "handler: $varlock\n";
}

sub debug {
	my @messages = @_;
	use Data::Dumper;
	print "<<< DEBUG ".__PACKAGE__.((caller)[3]?' '.(caller)[3]:'').":\n";
#	print Dumper( \@messages );
	print scalar @messages;
	print "\n>>>\n";
}

1;
