#!/usr/bin/env perl

use Benchmark qw( cmpthese );

my $str = q{
	abcd abcz qwer qwet asdf asdg zxcv zxcb
};

cmpthese( 1e6, {
	'sub1' => &sub1( $str ),
	'sub2' => &sub2( $str ),
});

sub sub1 {
	my $str = shift;

	while ( $str =~ m/\G\s*(\w+)/gc ) {  # piecewise matching
		return $1;
	}
}

sub sub2 {
	my $str = shift;

	while ( $str =~ s/\s*(\w+)// ) {  # biting off
		return $1;
	}
}
