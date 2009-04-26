#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 12;

use autobox::dump;

sub add_one { return $_[0] + 1 }

my $add_one = \&add_one;
$add_one = eval $add_one->perl;

isa_ok $add_one, "CODE"; 

sub mk_iter { my $i; sub { $i++ } }

my $real_iter = mk_iter();

#NOTE: must provide vairables to close over when reconstituing closures.
my $eval_iter = eval 'my $i; ' . $real_iter->perl;

isa_ok $eval_iter, "CODE"; 

$real_iter->(); #put the iter one ahead

is add_one($eval_iter->()), $real_iter->();

is $add_one->($eval_iter->()), $real_iter->();

my $f1 = eval 'my $i; ' . $real_iter->perl;
my $f2 = eval 'my $i; ' . $real_iter->perl;

for my $i (0 .. 3) {
	my $j = $f1->();
	my $k = $f2->();
	is $i, $j;
	is $j, $k;
}
