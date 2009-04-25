#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 6;

use autobox::expr::dump;

is eval 5->perl, 5;

is eval "foo"->perl, "foo";

is eval( +(5*6)->perl ), 30;

my $str = "bar";
is eval $str->perl, $str;

my $num = 100.34;
is eval $num->perl, $num;

my $ref = \$num;
is ${eval $ref->perl}, $$ref;
