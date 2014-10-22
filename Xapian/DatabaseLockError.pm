package Search::Xapian::DatabaseLockError;

=head1 NAME

Search::Xapian::DatabaseLockError -  DatabaseLockError indicates failure to lock a database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::DatabaseError);

1;
