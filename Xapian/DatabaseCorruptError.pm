package Search::Xapian::DatabaseCorruptError;

=head1 NAME

Search::Xapian::DatabaseCorruptError -  DatabaseCorruptError indicates database corruption was detected. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::DatabaseError);

1;
