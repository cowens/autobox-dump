package autobox::dump;

use warnings;
use strict;

use base "autobox";

our $VERSION = '20090425.1630';

sub import {
	my $class = shift;

	my $dumper = "autobox::dump::inner";

	$class->SUPER::import(
		SCALAR => $dumper,
		ARRAY  => $dumper,
		HASH   => $dumper,
	);
}


{
    package autobox::dump::inner;

    sub perl {
        require Data::Dumper;

        my $dumper = Data::Dumper->new( [$_[0]] );
	$dumper->Useqq(1);
        $dumper->Indent(1)->Terse(1);
        $dumper->Sortkeys(1) if $dumper->can("Sortkeys");

        return $dumper->Dump;
    }
}


=head1 NAME

autobox::dump - human/perl readable strings from the results of an EXPR

=head1 VERSION

Version 20090425.1630

=head1 SYNOPSIS

The autobox::dump pragma adds, via the autobox pragma, a method to 
normal expression (such as scalars, arrays, hashes, math, literals, etc.)
that produces a human/perl readable representation of the value of that
expression. 


    use autobox::dump;

    my $foo = "foo";
    print $foo->perl;   # 'foo';

    print +(5*6)->perl; # 30;

    my @a = (1..3);

    print @a->perl;
    # [
    #  1,
    #  2,
    #  3
    # ];

    print {a=>1, b=>2}->perl;
    # {
    #  'a' => 1,
    #  'b' => 2
    # };

=head1 AUTHOR

Chas. J Owens IV, C<< <chas.owens at gmail.com> >>

=head1 BUGS

Has all the issues L<autobox> has.

Please report any bugs or feature requests to 
http://github.com/cowens/autobox-dump/issues

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc autobox::dump

=head1 ACKNOWLEDGEMENTS

Michael Schwern for starting the perl5i pragma which prompted me to add
a feature I wanted to autobox.

=head1 COPYRIGHT & LICENSE

Copyright 2009 Chas. J Owens IV, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of autobox::dump
