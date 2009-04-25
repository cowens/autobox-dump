#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 4;
use Data::Dumper;

use autobox::expr::dump;

sub func {
	return { a => 1, b => 2 };
}

my %h = ( one => 1, two => 2, three => [1, 1, 1] );
my $ref = \%h;

is %h->perl, Dumper \%h;

is {%h}->perl, Dumper {%h};

is $ref->perl, Dumper $ref;

is func->perl, Dumper func;

