package Email::FolderType;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

require Exporter;
@ISA       = qw(Exporter);
@EXPORT_OK = qw(folder_type);

$VERSION = '0.2';

=head1 NAME

Email::FolderType - return type of a mail folder

=head1 SYNOPSIS

  use Email::FolderType qw(folder_type);


  print folder_type "~/mymbox";     # prints 'Mbox'
  print folder_type "~/a_maildir/"; # prints 'Maildir'
  print folder_type "some_mh/.";    # prints 'MH' 	


=head1 SUBROUTINES

=head2 folder_type <file path>

Automatically detects what type of mail archive the 
file path is and returns the name.

=cut

sub folder_type ($) 
{
    my $folder = shift;
    return unless -e $folder;
    return "Maildir" if $folder =~ m{/$};
    return "MH"      if $folder =~ m{/\.$};
    return "Maildir" if -d $folder;
    return "Mbox";
}
 
=head1 DESCRIPTION

Provides a utility module for detecting the type of 
a given mail box. 

=head1 BUGS

Currently only handles mbox and maildir

=head1 AUTHOR

Simon Wistow <simon@thegestalt.org>

=head1 COPYING

(C)opyright 2003, Simon Wistow 

Distributed under the same terms as Perl itself. 

This software is under no warranty and will probably ruin your life, kill your friends, burn your house and bring about the apocalypse 


=head1 SEE ALSO

L<Email::LocalDelivery>, L<Email::Folder>

=cut
