package Search::Xapian::NetworkTimeoutError;

=head1 NAME

Search::Xapian::NetworkTimeoutError -  Indicates a timeout expired while communicating with a remote database. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::NetworkError);

1;
