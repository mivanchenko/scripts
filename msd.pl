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
    } elsif ($dddi =~ /^GIF89/) {
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

$ep .= 'service/endpoint2';

my $fn = $ARGV[1];

die "file $fn does not exists \n" unless ( -e $fn );

# prepare data

my $ddd = read_file($fn);
my $new_fn = gen_fn($ddd);

# prepare request
my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(POST=>$ep);
$req->header(HOST=>$eq);
$req->header('User-Agent'=>'Module::Name');
$req->header('Content-Type'=>'multipart/form-data; boundary='.$bnd);

# make the body

my $data = $bnd;

my $headers1 = "\r\n";
$headers1 .= 'Content-Disposition: form-data; name="product_image"; filename="'.$new_fn.'"'."\r\n";
$headers1 .= 'Content-Type: ';

$data .= $headers1;

my $headers2;
if ($fn =~ /\.jpg$/) {
    $headers2 .= 'image/jpeg'
} elsif ($fn =~/\.gif$/) {
    $headers2 .= 'image/gif';
} else {
    $headers2 .= 'unknown/data';
}
$headers2 .= "\r\n";

$headers2 .= "Last-Modified: Mon, 09 Jun 2014 17:56:09 GMT\r\n\r\n";

$data .= $headers2;

$data .= $ddd;

my $headers3 = "\r\n$bnd\r\n";

$data .= $headers3;

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
}
