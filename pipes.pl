#!/usr/bin/env perl

# READ from pipe

my $file = './1.pl |';
open my $fh, $file
	or die "Can't open [$file]: [$!]";

print <$fh>;

close $fh;
