package Search::Xapian::InvalidArgumentError;

=head1 NAME

Search::Xapian::InvalidArgumentError -  InvalidArgumentError indicates an invalid parameter value was passed to the API.

=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::LogicError);

1;
