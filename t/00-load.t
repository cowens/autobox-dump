#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'autobox::expr::dump' );
}

diag( "Testing autobox::expr::dump $autobox::expr::dump::VERSION, Perl $], $^X" );
