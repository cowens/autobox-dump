package autobox::expr::dump;

use warnings;
use strict;

use base "autobox";

use autobox::expr::dump::scalar;
use autobox::expr::dump::array;
use autobox::expr::dump::hash;

sub import {
	my $class = shift;
	$class->SUPER::import(
		SCALAR => "autobox::expr::dump::scalar",
		ARRAY  => "autobox::expr::dump::array",
		HASH   => "autobox::expr::dump::hash",
	);
}

=head1 NAME

autobox::expr::dump - human/perl readable strings from the results of an EXPR

=head1 VERSION

Version 20090425

=cut

our $VERSION = '20090425';

=head1 SYNOPSIS

The autobox::expr::dump pragma adds, via the autobox pragma, a method to 
normal expression (such as scalars, arrays, hashes, math, literals, etc.)
that produces a human/perl readable representation of the value of that
expression. 


    use autobox::expr::dump;

    my $foo = "foo";
    print $foo->perl;   #$VAR1 = 'foo';

    print +(5*6)->perl; #$VAR1 = 30;

    my @a = (1..3);

    print @a->perl;
    #$VAR1 = [
    #          1,
    #          2,
    #          3
    #        ];

    print {a=>1, b=>2}->perl;
    #$VAR1 = {
    #          'a' => 1,
    #          'b' => 2
    #        };

=head1 AUTHOR

Chas. J Owens IV, C<< <chas.owens at gmail.com> >>

=head1 BUGS

Literal lists (e.g. C<(1 .. 3)->perl>) aren't handled correctly.

Function calls that return lists are not handled correctly.

Both of these bugs come from the fact that ->perl is treating putting them
in scalar context.  This can be worked around by putting the value in an
anonyous arrayref: C<[(1..3)]->perl>.

Please report any bugs or feature requests to XXXXXXX

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc autobox::expr::dump

=head1 ACKNOWLEDGEMENTS

Michael Schwern for starting the perl5i pragma which prompted me to add
a feature I wanted to autobox.

=head1 COPYRIGHT & LICENSE

Copyright 2009 Chas. J Owens IV, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of autobox::expr::dump
