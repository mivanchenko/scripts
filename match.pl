#!/usr/bin/perl

$string = 'abcdefg efgdabcz';

$matched = $string =~ /ab.{2}/g;

($match) = $string =~ /(ab.{2})/;
($match_2) = $string =~ /ab.{2}/g;

($match1, $match2) = $string =~ /ab.{2}/g;
@matches = $string =~ /ab.{2}/g;

$count  = @matches = $string =~ /ab.{2}/g;
$count2 = $string =~ s{abc}{abc}g;

print "matched: [$matched]\n";

print "match: [$match]\n";
print "match_2: [$match_2]\n";

print "match1: [$match1], match2: [$match2]\n";
print "matches: [@matches]\n";

print "count:  [$count]\n";
print "count2: [$count2]\n";

## matches word with the first char the same as the last one
#$string =~ /^(.{1}).*\1$/
