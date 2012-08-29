#!/usr/bin/perl

$string = 'abcdefg efgdabcz';

$matched = $string =~ /ab.{2}/g;
($match) = $string =~ /ab.{2}/g;
($match1, $match2) = $string =~ /ab.{2}/g;
@matches = $string =~ /ab.{2}/g;
$count = @matches = $string =~ /ab.{2}/g;

print "matched: [$matched]\n";
print "match: [$match]\n";
print "match1: [$match1], match2: [$match2]\n";
print "matches: [@matches]\n";
print "count: [$count]\n";
