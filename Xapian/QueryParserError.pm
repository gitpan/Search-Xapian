package Search::Xapian::QueryParserError;

=head1 NAME

Search::Xapian::QueryParserError -  Indicates a query string can't be parsed. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
