#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 4;
use Data::Dumper;

use autobox::expr::dump;

my @a = qw/a b c d/;
my $ref = \@a;

is @a->perl, Dumper \@a;

is [@a]->perl, Dumper [@a];

is $ref->perl, Dumper $ref;

my @lol = map { [ 1 .. 5 ] } 1 .. 5;

is @lol->perl, Dumper \@lol;
