#!/usr/bin/env perl

package GrandParent;
sub say {
	my $class = shift;
	print "class: [$class]\n";
	print "I'm a GrandParent\n";
}

package Parent;
use base 'GrandParent';
sub say {
	my $class = shift;
	print "class: [$class]\n";
	$class->SUPER::say();
	print "I'm a Parent\n";
}

package Child;
use base 'Parent';
sub say {
	my $class = shift;
	print "class: [$class]\n";
	$class->SUPER::say();
	print "I'm a Child\n";
}

package main;
my $child = Child->say;

