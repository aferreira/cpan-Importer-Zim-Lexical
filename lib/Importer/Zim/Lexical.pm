
package Importer::Zim::Lexical;

use 5.018;

BEGIN {
    require Importer::Zim::Base;
    Importer::Zim::Base->VERSION('0.3.0');
    our @ISA = qw(Importer::Zim::Base);
}

use Carp        ();
use Sub::Inject ();

sub import {
    my $class = shift;

    say "$class->import(@_)";    # XXX
    my @exports = $class->_prepare_args(@_);
    Sub::Inject::sub_inject( map { @{$_}{qw(export code)} } @exports );
}

1;

=encoding utf8

=head1 NAME

Importer::Zim::Lexical - Import functions with lexical scope

=head1 SYNOPSIS

    use Importer::Zim::Lexical 'Scalar::Util' => 'blessed';
    use Importer::Zim::Lexical 'Scalar::Util' =>
      ( 'blessed' => { -as => 'typeof' } );

    use Importer::Zim::Lexical 'Mango::BSON' => ':bson';

    use Importer::Zim::Lexical 'Foo' => { -version => '3.0' } => 'foo';

=cut
