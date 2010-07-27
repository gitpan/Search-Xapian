package Search::Xapian::FeatureUnavailableError;

=head1 NAME

Search::Xapian::FeatureUnavailableError -  Indicates an attempt to use a feature which is unavailable.

=head1 DESCRIPTION

  Typically a feature is unavailable because it wasn't compiled in, or
  because it requires other software or facilities which aren't available.


=cut

use 5.006;
use strict;
use warnings;
use Carp;

require DynaLoader;

our @ISA = qw(DynaLoader Search::Xapian::RuntimeError);

1;
