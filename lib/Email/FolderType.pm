use strict;
package Email::FolderType;
use vars qw($VERSION @ISA @EXPORT_OK);

require Exporter;
@ISA       = qw(Exporter);
@EXPORT_OK = qw(folder_type);

$VERSION = '0.6';

=head1 NAME

Email::FolderType - determine the type of a mail folder

=head1 SYNOPSIS

  use Email::FolderType qw(folder_type);

  print folder_type "~/mymbox";     # prints 'Mbox'
  print folder_type "~/a_maildir/"; # prints 'Maildir'
  print folder_type "some_mh/.";    # prints 'MH'
  print folder_type "an_archive//"; # prints 'Ezmlm'

=head1 DESCRIPTION

Provides a utility subroutine for detecting the type of a given mail
folder.

=head1 SUBROUTINES

=head2 folder_type <path>

Automatically detects what type of mail folder the path refers to and
returns the name of that type.

It primarily bases the type on the suffix of the path given.

  Suffix | Type
 --------+---------
  /      | Maildir
  /.     | MH
  //     | Ezmlm

In case of no known suffix it checks for a known file structure.  If
that doesn't work out it defaults to C<Mbox>.

=cut

sub folder_type ($) {
    my $folder = shift;

    return "Ezmlm"   if $folder =~ m{//$};
    return "Maildir" if $folder =~ m{/$};
    return "MH"      if $folder =~ m{/\.$};
    return "Maildir" if -d "$folder/cur";
    return "Ezmlm"   if -d "$folder/archive";
    # XXX return "MH" if -e WHAT?;
    return "Mbox";
}

1;
__END__

=head1 AUTHOR

Simon Wistow <simon@thegestalt.org>

=head1 COPYING

(C) Copyright 2003, Simon Wistow

Distributed under the same terms as Perl itself.

This software is under no warranty and will probably ruin your life,
kill your friends, burn your house and bring about the apocalypse.

=head1 SEE ALSO

L<Email::LocalDelivery>, L<Email::Folder>

=cut
