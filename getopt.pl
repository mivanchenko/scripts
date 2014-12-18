#!/usr/bin/env perl

use Getopt::Long;
use Pod::Usage;

my ($param);

GetOptions(
    'p|param=s' => \$param,
) or pod2usage(2);

pod2usage(1) if $help;

print "param: [$param]\n";

__END__

=head1 NAME

Name

=head1 SYNOPSIS

 ./$0 --param=value

=head1 OPTIONS

=over 4

=item B<--help>

Print a brief help message and exit.

=item B<--param>

Param to use.

=back

=head1 DESCRIPTION

=cut
