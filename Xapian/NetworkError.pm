package Search::Xapian::NetworkError;

=head1 NAME

Search::Xapian::NetworkError -  Indicates a problem communicating with a remote database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

use Search::Xapian::NetworkTimeoutError;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
