#!/usr/bin/env perl

#print pack( 'C*', qw( 105 118 97 110 99 104 101 110 107 111 46 109 105 99 104 97 101 108 46 119 111 114 107 64 103 109 97 105 108 46 99 111 109 ) );

#print grep$_=pack('c',hex),unpack'A2'x 33,unpack'h*',pack'B*',unpack'h*',pack'H*','011010011001101100101001110110010011100101001001101010011101100101111001111110011101000111101001011010010011100101001001001010011010100111001001110100011011101111111001000110110111100100001000101110011110100100101001011010011100100111010001001110011111100111101001';

#print grep$_=pack((chr hex oct 77),hex),unpack join(undef,((chr hex oct 51).(chr hex oct 40))x oct hex 29),unpack chr(hex oct 104).chr hex((chr hex oct 40).(chr hex oct 75)),pack chr(hex oct 52).chr hex((chr hex oct 40).(chr hex oct 75)),unpack chr(hex oct 104).chr hex((chr hex oct 40).(chr hex oct 75)),pack chr(hex oct 60).chr hex((chr hex oct 40).(chr hex oct 75)),'011010011001101100101001110110010011100101001001101010011101100101111001111110011101000111101001011010010011100101001001001010011010100111001001110100011011101111111001000110110111100100001000101110011110100100101001011010011100100111010001001110011111100111101001';
