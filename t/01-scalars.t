#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 9;

use autobox::dump;

is eval 5->perl, 5;

is eval "foo"->perl, "foo";

is eval( +(5*6)->perl ), 30;

my $str = "bar";
is eval $str->perl, $str;

my $num = 100.34;
is eval $num->perl, $num;

my $ref = \$num;
is ${eval $ref->perl}, $$ref;

#make sure non-printable charactrs can be seen
is "\x{0A}"->perl, qq("\\n"\n);

is "\x{00}"->perl, qq("\\0"\n);

is "\x{7F}"->perl, qq("\\177"\n);

