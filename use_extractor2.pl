#!/usr/bin/env perl

use Data::Dumper;
use Perl::PrereqInstaller;

my $installer = Perl::PrereqInstaller->new;
$installer->scan( '/my/dir' );
my @not_installed  = $installer->not_installed;
my @prev_installed  = $installer->previously_installed;
print Dumper \@not_installed;
print Dumper \@prev_installed;
