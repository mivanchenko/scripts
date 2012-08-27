#!/usr/bin/env perl

use Mail::Send;
my $msg = Mail::Send->new();
$msg->to('my@email.net');
$msg->subject('test subject');
my $fh = $msg->open;
print $fh "test message";
$fh->close
   or die "Couldn't send whole message: $!\n";


#use strict;
#use warnings;
#
#use Email::MIME;
#use Email::Sender::Simple qw(sendmail);
#
#my $message = Email::MIME->create(
#  header_str => [
#    From    => 'me@example.com',
#    To      => 'my@email.net',
#    Subject => 'test subject',
#  ],
#  attributes => {
#    encoding => 'quoted-printable',
#    charset  => 'ISO-8859-1',
#  },
#  body_str => "Happy testday to you!\n",
#);
#
#sendmail($message);
