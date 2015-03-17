#! /usr/bin/env perl

use Getopt::Long;

my $todo = 0;
GetOptions(
	"help|?" => \&usage,
	"list|l" => sub { $todo = 'list' },
) or usage();

my %actions = (
	'list' => sub {
		print "Listing...\n";
	},
);

my $code = $actions{$todo};
$code->() if $code;

sub usage {
	print STDERR "Usage:\n\t$0 [--list|-l]\n";
	exit 1;
}
