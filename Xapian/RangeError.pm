package Search::Xapian::RangeError;

=head1 NAME

Search::Xapian::RangeError -  RangeError indicates an attempt to access outside the bounds of a container.

=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
