#!/usr/bin/env perl


use File::Find;
find( sub { /p[lm]$/ && print "$_\n" }, '.' );


use Path::Class;

my @files;
dir('.')->recurse( callback => sub {
    my $file = shift;
    if ( $file =~ /p[lm]$/ ) {
        push @files, $file->absolute->stringify;
    }
});
print Dumper \@files;


sub _read_filepaths {
	my ($self, $path) = @_;
	my @filepaths;

	my $dir = dir( split( '/', $path ) );

	while ( my $file = $dir->next ) {
		next if $file->is_dir();
		push @filepaths, $file->stringify();
	}

	return \@filepaths;
}
