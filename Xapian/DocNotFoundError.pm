package Search::Xapian::DocNotFoundError;

=head1 NAME

Search::Xapian::DocNotFoundError -  Indicates an attempt to access a document not present in the database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
