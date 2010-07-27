package Search::Xapian::InvalidOperationError;

=head1 NAME

Search::Xapian::InvalidOperationError -  InvalidOperationError indicates the API was used in an invalid way.

=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::LogicError);

1;
