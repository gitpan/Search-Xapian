package Search::Xapian::DatabaseOpeningError;

=head1 NAME

Search::Xapian::DatabaseOpeningError -  DatabaseOpeningError indicates failure to open a database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

use Search::Xapian::DatabaseVersionError;

our @ISA = qw(DynaLoader Search::Xapian::DatabaseError);

1;
