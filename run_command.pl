my $command = [
    'prove',
    '-v',
    "$FindBin::Bin/t/ecomcrt-91.t",
];

run( $command );

sub run {
    my $command = shift;
    my $exit_status = system( @{$command} );
    my $exit_value = 0;
    if ( $exit_status == -1 ) {
        $exit_value = 2;
    }
    elsif ( $exit_status >>= 8 ) {
        $exit_value = 3;
    }
    exit $exit_value;
}
