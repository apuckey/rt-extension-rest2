package RTx::REST::Resource::User;
use strict;
use warnings;

use Moose;
use namespace::autoclean;

extends 'RTx::REST::Resource';
with 'RTx::REST::Resource::Role::Record';

sub forbidden {
    my $self = shift;
    return 0 if not $self->record->id;
    return 0 if $self->record->id == $self->current_user->id;
    return 0 if $self->record->CurrentUserHasRight("AdminUsers");
    return 1;
}

__PACKAGE__->meta->make_immutable;

1;