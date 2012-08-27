#!/usr/bin/perl

use strict;
use lib '/home/michael/scripts/gen-perl';
use Thrift::Socket;
use Thrift::Server;
use Cars;

package CarsHandler;
use base qw(CarsIf);

sub new {
    my $classname = shift;
    my $self      = {};

    return bless($self,$classname);
}

my %CARS = (
	'0' => 'No car',
	'1' => 'Audi',
	'2' => 'BMW',
);

my %CAR_OBJECTS = (
	2 => {
		'brand' => 'BMW',
	},
);

sub get_car
{
	my $self = shift;
	my $id = shift;

	print "id: $id\n";

	if ( ! exists($CAR_OBJECTS{$id}) )
	{
		my $error = Error->new();
		$error->err_no(1);
		$error->err_desc('No such car');

		die $error;
	}

#	my $new_car = $CAR_OBJECTS{$id};
#	$new_car->{'brand'} .= ' NEW!';
	
	my $new_car = Car->new();
	$new_car->brand( $CAR_OBJECTS{$id}->{'brand'} );

	return $new_car;
}

sub get_car_name
{
	my $self = shift;
	my $id = shift;

	$id ||= 0;
	if ( exists($CARS{$id}) )
	{
		return $CARS{$id};
	}
	else
	{
		return $CARS{'0'};
	}
}

sub ping
{
  print "ping()\n";
}

sub add
{
  my($self, $n1, $n2) = @_;
  printf("add(%d,%d)\n", $n1, $n2);
  return $n1 + $n2;
}

sub calculate
{
	no strict 'subs';

  my($self, $logid, $work) = @_;
  my $op   = $work->{op};
  my $num1 = $work->{num1};
  my $num2 = $work->{num2};
  printf("calculate(%d, %d %d %d)\n", $logid, $num1, $num2, $op);

  my $val;

  if ($op == tutorial::Operation::ADD) {
    $val = $num1 + $num2;
  } elsif ($op == tutorial::Operation::SUBTRACT) {
    $val = $num1 - $num2;
  } elsif ($op == tutorial::Operation::MULTIPLY) {
    $val = $num1 * $num2;
  } elsif ($op == tutorial::Operation::DIVIDE) {
    if ($num2 == 0)
    {
      my $x = new tutorial::InvalidOperation;
      $x->what($op);
      $x->why('Cannot divide by 0');
      die $x;
    }
    $val = $num1 / $num2;
  } else {
    my $x = new tutorial::InvalidOperation;
    $x->what($op);
    $x->why('Invalid operation');
    die $x;
  }

  my $log = new shared::SharedStruct;
  $log->key($logid);
  $log->value(int($val));
  $self->{log}->{$logid} = $log;

  return $val;
}

sub getStruct
{
  my($self, $key) = @_;
  printf("getStruct(%d)\n", $key);
  return $self->{log}->{$key};
}

sub zip
{
  my($self) = @_;
  print "zip()\n";
}



eval {
  my $handler       = new CarsHandler;
  my $processor     = new CarsProcessor($handler);
  my $serversocket  = new Thrift::ServerSocket(9090);
  my $forkingserver = new Thrift::ForkingServer($processor, $serversocket);
  print "Starting the server...\n";
  $forkingserver->serve();
  print "done.\n";
}; if ($@) {
  if ($@ =~ m/TException/ and exists $@->{message}) {
    my $message = $@->{message};
    my $code    = $@->{code};
    my $out     = $code . ':' . $message;
    die $out;
  } else {
    die $@;
  }
}

