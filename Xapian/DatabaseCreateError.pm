package Search::Xapian::DatabaseCreateError;

=head1 NAME

Search::Xapian::DatabaseCreateError -  DatabaseCreateError indicates a failure to create a database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::DatabaseError);

1;
