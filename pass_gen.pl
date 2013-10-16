#!/usr/bin/env perl

my $uid = gen_pass(12);
print "$uid\n";

sub gen_pass {
	my $length = shift;
	my $pass;
	my $al      = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	my $num     = '0123456789';
	my $special = '-=~!@#%$^&*()_+[]{}<>';

	my $pool    = $al.$num.$special;

	while ( length($pass) < $length ) {
		$pass .= substr($pool, (int(rand(length($pool)))), 1);
	}

	return $pass;
} 
