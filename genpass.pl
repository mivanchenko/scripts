#!/usr/bin/env perl

my $uid = gen_pass( 8 );
print "$uid\n";

sub gen_pass
{
	my $length = shift;
	my $pool = 'abcdefghijkmnpqrstuvwxyz23456789ABCDEFGHJKLMNPQRSTUVWXYZ';
#	my $pool = '0123456789';
	my $pass;

	while ( length( $pass ) < $length )
	{
		$pass .= substr( $pool, (int(rand(length($pool)))), 1 );
	}

	return $pass;
} 
