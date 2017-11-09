
package Importer::Zim::Lexical;

# ABSTRACT: Import functions as lexical subroutines

use 5.018;

use Sub::Inject 0.2.0 ();

sub import {
    require Importer::Zim::Base;
    Importer::Zim::Base->VERSION('0.12.0');
    goto &Importer::Zim::Base::import_into;
}

sub export_to { shift; goto &Sub::Inject::sub_inject }

sub _export_to { goto &Sub::Inject::sub_inject }

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
