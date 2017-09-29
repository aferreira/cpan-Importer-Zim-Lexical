
package Importer::Zim::Lexical;

# ABSTRACT: Import functions as lexical subroutines

use 5.018;

use Sub::Inject 0.3.0 ();    # load before Importer::Zim::Utils

BEGIN {
    require Importer::Zim::Base;
    Importer::Zim::Base->VERSION('0.5.0');
    our @ISA = qw(Importer::Zim::Base);
}

use Importer::Zim::Utils 0.7.0 qw(DEBUG);

sub import {
    my $class = shift;

    warn "$class->import(@_)\n" if DEBUG;
    my @exports = $class->_prepare_args(@_);

    @_ = map { @{$_}{qw(export code)} } @exports;
    goto &Sub::Inject::sub_inject;
}

no Importer::Zim::Utils qw(DEBUG);

1;

=encoding utf8

=head1 SYNOPSIS

    use Importer::Zim::Lexical 'Scalar::Util' => 'blessed';
    use Importer::Zim::Lexical 'Scalar::Util' =>
      ( 'blessed' => { -as => 'typeof' } );

    use Importer::Zim::Lexical 'Mango::BSON' => ':bson';

    use Importer::Zim::Lexical 'Foo' => { -version => '3.0' } => 'foo';

    use Importer::Zim::Lexical 'Krazy::Taco' => qw(tacos burritos poop);

=head1 DESCRIPTION

   "It's... INCREDIBLE! There's stuff down here I've never even
   dreamed of! I'm gonna try to blow it up."
     – Dib

This is a backend for L<Importer::Zim> which gives lexical scope
to imported subroutines.

=head1 DEBUGGING

You can set the C<IMPORTER_ZIM_DEBUG> environment variable
for get some diagnostics information printed to C<STDERR>.

    IMPORTER_ZIM_DEBUG=1

=head1 SEE ALSO

L<Importer::Zim>

=cut
