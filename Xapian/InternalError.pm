package Search::Xapian::InternalError;

=head1 NAME

Search::Xapian::InternalError -  InternalError indicates a runtime problem of some sort. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
