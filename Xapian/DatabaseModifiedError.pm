package Search::Xapian::DatabaseModifiedError;

=head1 NAME

Search::Xapian::DatabaseModifiedError -  DatabaseModifiedError indicates a database was modified.

=head1 DESCRIPTION

  To recover after catching this error, you need to call
  Xapian::Database::reopen() on the Database and repeat the operation
  which failed.


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::DatabaseError);

1;
