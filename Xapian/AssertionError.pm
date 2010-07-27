package Search::Xapian::AssertionError;

=head1 NAME

Search::Xapian::AssertionError -  AssertionError is thrown if a logical assertion inside Xapian fails.

=head1 DESCRIPTION

  In a debug build of Xapian, a failed assertion in the core library code
  will cause AssertionError to be thrown.

  This represents a bug in Xapian (either an invariant, precondition, etc
  has been violated, or the assertion is incorrect!)


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::LogicError);

1;
