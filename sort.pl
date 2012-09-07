#!/usr/bin/perl

# sort array of hashes

use Data::Dumper;

@arr = (
        {
                '10' => '5',
        },
        {
                '30' => '1',
        },
        {
                '20' => '3',
        },
);

@arr_sorted = sort { (values(%$b))[0] <=> (values(%$a))[0] } @arr;

print Dumper( @arr_sorted );
