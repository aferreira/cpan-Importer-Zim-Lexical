
package Importer::Zim::Lexical;

# ABSTRACT: Import functions with lexical scope

use 5.018;

BEGIN {
    require Importer::Zim::Base;
    Importer::Zim::Base->VERSION('0.3.0');
    our @ISA = qw(Importer::Zim::Base);
}

use Sub::Inject ();

use constant DEBUG => $ENV{IMPORTER_ZIM_DEBUG} || 0;

sub import {
    my $class = shift;

    warn "$class->import(@_)\n" if DEBUG;
    my @exports = $class->_prepare_args(@_);
    Sub::Inject::sub_inject( map { @{$_}{qw(export code)} } @exports );
}

1;

=encoding utf8

=head1 SYNOPSIS

    use Importer::Zim::Lexical 'Scalar::Util' => 'blessed';
    use Importer::Zim::Lexical 'Scalar::Util' =>
      ( 'blessed' => { -as => 'typeof' } );

    use Importer::Zim::Lexical 'Mango::BSON' => ':bson';

    use Importer::Zim::Lexical 'Foo' => { -version => '3.0' } => 'foo';

=head1 DEBUGGING

You can set the C<IMPORTER_ZIM_DEBUG> environment variable
for get some diagnostics information printed to C<STDERR>.

    IMPORTER_ZIM_DEBUG=1

=head1 SEE ALSO

L<Importer::Zim>

=cut
