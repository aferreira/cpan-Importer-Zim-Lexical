
package Importer::Zim::Lexical;

use 5.018;
BEGIN {
    require Importer::Zim::Base;
    our @ISA = qw(Importer::Zim::Base);
}

use Carp ();
use Exporter::Lexical ();

sub import {
    my $class = shift;

say "$class->import(@_)"; # XXX
    my @exports = $class->_prepare_args(@_);
    for (@exports) {
        my ( $export, $sub ) = @{$_}{qw(export code)};
        Exporter::Lexical::lexical_import( $export, $sub );
    }

    # Same hack of Exporter::Lexical::import
    Exporter::Lexical::_lex_stuff(';1;');
}

1;

=encoding utf8

=head1 NAME

Importer::Zim::Lexical - Import functions with lexical scope

=head1 SYNOPSIS

    use Importer::Zim::Lexical 'Scalar::Util' => 'blessed';
    use Importer::Zim::Lexical 'Scalar::Util' => 'blessed' =>
      { -as => 'typeof' };

    use Importer::Zim::Lexical 'Foo' => { -version => '3.0' } => 'foo';

=cut
