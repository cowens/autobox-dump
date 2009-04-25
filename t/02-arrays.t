#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 4;

use autobox::dump;

my @a = qw/a b c d/;
my $ref = \@a;

is_deeply eval @a->perl, [@a];

is_deeply eval [@a]->perl, [@a];

is_deeply eval $ref->perl, $ref;

my @lol = map { [ 1 .. 5 ] } 1 .. 5;

is_deeply eval @lol->perl, \@lol;
