#!/usr/bin/env perl

sub _read_filepaths
{
    my $self = shift;
    my $path = shift;
    my @filepaths;

    my $dir = dir( split( '/', $path ) );

    while ( my $file = $dir->next )
    {
        next if $file->is_dir();
        push @filepaths, $file->stringify();
    }

    return \@filepaths;
}
