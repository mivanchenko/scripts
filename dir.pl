#!/usr/bin/env perl


# Returns filenames
use File::Find;
find( sub { /p[lm]$/ && print "$_\n" }, '.' );


# Returns absolute paths recursively
use Path::Class::Rule;
my @files;
my $rule = Path::Class::Rule->new->perl_file;
$rule->not_name( qr/.*sw[op]$/ );

foreach my $file ( $rule->all('.') ) {
	push @files, $file->{'dir'}->absolute->stringify.'/'.$file->{'file'};
}


# Returns absolute paths recursively
use Path::Class;
my @files;
dir('.')->recurse( callback => sub {
    my $file = shift;
    if ( $file =~ /p[lm]$/ ) {
        push @files, $file->absolute->stringify;
    }
});
print Dumper \@files;


# Returns absolute paths non-recursively
use Path::Class;
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
