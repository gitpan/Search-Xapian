package Search::Xapian::UnimplementedError;

=head1 NAME

Search::Xapian::UnimplementedError -  UnimplementedError indicates an attempt to use an unimplemented feature. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::LogicError);

1;
