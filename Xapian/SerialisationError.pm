package Search::Xapian::SerialisationError;

=head1 NAME

Search::Xapian::SerialisationError -  Indicates an error in the std::string serialisation of an object. 


=head1 DESCRIPTION


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
