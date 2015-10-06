#!/usr/bin/env perl

use Data::Dumper;
use Perl::PrereqInstaller;
use Perl::PrereqScanner;

my $installer = Perl::PrereqInstaller->new;
$installer->scan( '/opt/bin/how-to.pl' );
print 'Not installed: ' , Dumper $installer->not_installed;

#print 'Installed: '     , Dumper $installer->previously_installed;
#print 'Scan errors: '   , Dumper $installer->scan_errors;
#print 'Report: '        , Dumper $installer->report;

#my $scanner = Perl::PrereqScanner->new;
#my $scanner = Perl::PrereqScanner->new({ scanners => [ qw(Perl5) ] });
#my $prereqs = $scanner->scan_file( '/opt/bin/script.pl' );
#print 'Prereqs: ', Dumper $prereqs;
