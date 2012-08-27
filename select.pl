
my $out;
open(my $out_fh, '>', \$out) or die;
my $STDOUT = select $out_fh;

select $STDOUT;
close $out_fh;
