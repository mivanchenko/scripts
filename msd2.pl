#!/usr/bin/perl

use LWP::UserAgent;
use Digest::MD5;

my $bnd = '---------------------------bOuNdArY';

#generate file name based on md5 of real filename
sub gen_fn
{
    my $ddd = shift;
    my $ext = "";
    if ($ddd =~ /^\xFF\xD8/) {
        $ext = 'jpg';
    }elsif ($ddd =~ /^\x89PNG\x0d\x0a/) {
        $ext = 'png';
    } elsif ($ddd =~ /^GIF89/) {
        $ext = 'gif';
    } else {
        $ext = 'dat';
    }

    my $md5 = new Digest::MD5;
    $md5->add($ddd);

    my $r = $md5->hexdigest();
    my $new_fn = substr($r, 0, 2)."/".
                 substr($r, 2, 2)."/".
                 substr($r, 4, 28).".".$ext;;
    return $new_fn;
}

# read file into string
sub read_file
{
    my $fn = shift;

    open my $fh, '<', $fn or die;
    local $/ = undef;
    my $ddd = <$fh>;
    close $fh;
    
#    my @d = split //,$ddd;
    return $ddd;
}

# check args

if (@ARGV != 2) {
    print "please use it like\n";
    print "$0 apt-address img-file-name\n";
    exit;
}

my $ep = $ARGV[0];

if ($ep !~ /^http:\/\//) {
    $ep = "http://$ep";
}

if ($ep !~ /\/$/) {
    $ep .= '/';
}

my $path = 'service/merch_data_sync';
$ep .= $path;

my $fn = $ARGV[1];

die "file $fn does not exists \n" unless ( -e $fn );

# prepare data

my $ddd = read_file($fn);
my $new_fn = gen_fn($ddd);

# ---

my $EOL = "\r\n";

my $header = "POST $path HTTP/1.1" . $EOL;
$header   .= "Host: $ARGV[0]" . $EOL;
$header   .= "User-Agent: TMCS::Service::Que" . $EOL;

# HACK for Apache1
$header   .= "X-Forwarded-Server: tmol.dev100.websys.tmcs" . $EOL;

my $header1 = "--$bnd" . $EOL;
$header1 .= 'Content-Disposition: form-data; name="product_image"; filename="'.$new_fn.'"'.$EOL;
$header1 .= 'Content-Type: ';

if ($fn =~ /\.jpg$/) {
    $header1 .= 'image/jpeg'
} elsif ($fn =~/\.gif$/) {
    $header1 .= 'image/gif';
} else {
    $header1 .= 'unknown/data';
}
$header1 .= $EOL;
$header1 .= "Last-Modified: Mon, 09 Jun 2014 17:56:09 GMT" . $EOL . $EOL;

my $footer = $EOL . "--$bnd--" . $EOL;

my $data = $header1 . $ddd . $footer;

$header   .= "Content-Length: " . length($data) . $EOL;
$header   .= "Content-Type: multipart/form-data; boundary=$bnd" . $EOL . $EOL;

# write to a file for netcat usage: [cat req.bin | nc 127.0.0.1 8080]
open my $fh, '>', 'req.bin' or die;
print $fh $header;
print $fh $data;
close $fh;

# prepare request
my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(POST=>$ep);
$req->header(HOST=>$ARGV[0]);
$req->header('User-Agent'=>'TMCS::Service::Que');
$req->header('Content-Type'=>'multipart/form-data; boundary='.$bnd);
$req->header('Content-Length', length($data));
$req->content($data);

print "send with filename = $new_fn\n";

# send request
my $resp = $ua->request($req);
if ($resp->is_success) {
    my $message = $resp->decoded_content;
    print "Received reply: $message\n";
}
else {
    print "HTTP GET error code: ", $resp->code, "\n";
    print "HTTP GET error message: ", $resp->message, "\n";
    print "HTTP GET content: [", $resp->content, "]\n";
}
