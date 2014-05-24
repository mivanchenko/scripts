open FILE, 'file.dat'
    or die "Can't open file.dat";
while (<FILE>) {
    next unless /asd/;
    print "Lines counted: $.\n" and last;
#   if ( /start/ .. /end/ ) {
#       print "line: $_";
#   }
}
close FILE;
