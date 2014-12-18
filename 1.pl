#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use My::Module qw(add_segments);


#my $module = My::Module->new();
#$module->add_segments();

#My::Module::handler();

my $key = 'qwe';
my %cached_logs = ();

$cached_logs{$key} = [qw( 1 2 3 )];
$cached_logs{$key} = [qw( )];
#delete $cached_logs{$key};

if ( $cached_logs{$key} ) {
	print "ok\n";
}







my $var = 'undef';
print "ok\n" unless length $var;





















my $key = '[19/Nov/2014:09:04:56 -0800]_172.31.214.207_/bba/checkout';

#$key =~ s![\/\:\.\ \[\]\-]!_!g;
$key =~ y!/:. []-!_!;

print "$key\n";















my $line = 'asd';

if ( $line ) {
	my $event = [qw( event )];
	my $events = [qw( 1 2 3 )];
	push @{$events}, $event;

}

#print Dumper $events;

my @arr = ();
print ref( \@arr ) . "\n";

my $sca = 'asd';
print ref( $sca ) . "\n";

my $hsh = {'asd'=>'zxc'};
print ref( $hsh ) . "\n";























my ($log_line, $common, $events);

my (
	$timestamp, $unix_time, $client_ip, $url, $unique_id, $event_idx,
	$session_id, $browser_id, $member_id, $state, $event, $other,
);

{
#	no warnings qw(uninitialized);
#	$log_line = join("\t", $timestamp, $unix_time, $client_ip, $url, $unique_id, $event_idx,
#					 $session_id, $browser_id, $member_id, $state, $event,
#					 $other);
   $common = [
       $timestamp, $client_ip, $url, $unique_id,
       $session_id, $browser_id, $member_id,
   ];
   $events = [
       $unix_time, $event_idx, $state, $event, $other,
   ];  
}

















my $page_name = '//yo/yo//yo/yo//';

# Dima:
#$page_name =~ s|^/+?||;
#$page_name =~ s|/+?$||;

# Misha:
#$page_name =~ s|^/+||;
#$page_name =~ s|/+$||;

print "$page_name\n";

#if ( get_line(42) ) {
#	print "$line\n";
#}




















use POSIX;

my $date = POSIX::strftime( "[%Y-%m-%d %H:%M:%S]\n", localtime );
print "$date\n";










print map { scalar reverse } sort reverse qw/6 10 3/;




use Try::Tiny::Retry;

my $current = 1;
sub get_next {
	return $current++;
}

retry {
	print get_next() . "\n" and die;
}
catch {
	print "catched\n";
}
finally {
	print "finally\n";
}
