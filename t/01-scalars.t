#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 6;
use Data::Dumper;

use autobox::expr::dump;

is 5->perl, Dumper 5;

is "foo"->perl, Dumper "foo";

is +(5*6)->perl, Dumper(5*6);

my $str = "bar";
is $str->perl, Dumper $str;

my $num = 100.34;
is $num->perl, Dumper $num;

my $ref = \$num;
is $ref->perl, Dumper $ref;
