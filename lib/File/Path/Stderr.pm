package File::Path::Stderr;

use strict;
#use warnings;

use File::Path ();

require Exporter;
@File::Path::Stderr::ISA = qw(Exporter);
@File::Path::Stderr::EXPORT = qw(mkpath rmpath);
$File::Path::Stderr::VERSION = "1.00";

=head1 NAME

File::Path::Stderr - like File::Path but print to STDERR

=head1 SYNOPSIS

   use File::Path::Stderr;

   mkpath(['/foo/bar/baz', 'blurfl/quux'], 1, 0711);
   rmtree(['foo/bar/baz', 'blurfl/quux'], 1, 1);

=head1 DESCRIPTION

This is a very, very simple wrapper around L<File::Path>.  All
exported functions function exactly the same as they do in B<File::Spec>
except rather than printing activity reports to the currently selected
filehandle (which is normally STDOUT) the messages about what B<File::Path>
is doing are printed to STDERR.

=cut

sub mkpath
{
  my $old = select();
  select(STDERR);
  File::Path::mkpath(@_);
  select($old);
}

sub rmpath
{
  my $old = select();
  select(STDERR);
  File::Path::rmpath(@_);
  select($old);
}

=head1 AUTHOR

Written by Mark Fowler E<lt>mark@twoshortplanks.comE<gt>

Copryright Mark Fowler 2003.  All Rights Reserved.

This program is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=head1 BUGS

None known.

Bugs should be reported to me via the CPAN RT system.
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=File::Path::Stderr>.


=head1 SEE ALSO

L<File::Path>

=cut

1;
