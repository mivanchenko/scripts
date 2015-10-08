#!/usr/bin/env perl

sub mins  { $_[0]        * 60 }
sub hours { mins($_[0])  * 60 }
sub days  { hours($_[0]) * 24 }

