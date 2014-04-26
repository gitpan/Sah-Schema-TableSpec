package Sah::Schema::TableSpec;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

our %SCHEMAS;

$SCHEMAS{field_spec} = [
    'hash', # XXX should be 'defhash' later
    keys => {

        # XXX from defhash
        summary   => [
            'str',
        ],

        # XXX from defhash
        description => [
            'str',
        ],

        # XXX from defhash
        tags => [
            'array',
        ],

        # XXX from defhash
        x => [
            'any',
        ],

        schema => [
            'any*' => {of=>['str*','array*']}, # XXX should be 'sah_schema' later
        ],

        pos => [
            'int*',
            min => 0,
            # XXX how to check contiguous and unique
        ],

        req => [
            bool => default=>0,
        ],

        sortable => [
            'bool' => default=>1,
        ],

        filterable => [
            'bool' => default=>1,
        ],

    },
    # XXX from defhash
    'allowed_keys_re' => qr/\A\w+(\.\w+)*\z/,
];

$SCHEMAS{table_spec} = [
    'hash', # XXX should be 'defhash' later
    keys => {

        # XXX from defhash
        summary   => [
            'str',
        ],

        # XXX from defhash
        description => [
            'str',
        ],

        # XXX from defhash
        tags => [
            'array',
        ],

        # XXX from defhash
        x => [
            'any',
        ],

        fields => [
            'array*',
            of => $SCHEMAS{field_spec}, # XXX should be 'field_spec*' (refer by name)
        ],

        pk => [
            'any*' => {of => ['str*', 'array*']},
            # XXX how to check that if string, is one of fields' key?
            # XXX how to check that if array, its element must all be in fields' keys?
        ],
    },
    'keys.restrict' => 0,

    req_keys => [qw/fields pk/],

    # XXX from defhash
    'allowed_keys_re' => qr/\A\w+(\.\w+)*\z/,
];

# XXX how to allow _ANYTHING and blah.blah._ANYTHING, but allow known TableSpec properties only?

1;
# ABSTRACT: Sah schemas to validate TableSpec

__END__

=pod

=encoding UTF-8

=head1 NAME

Sah::Schema::TableSpec - Sah schemas to validate TableSpec

=head1 VERSION

version 0.02

=head1 SYNOPSIS

 # schemas are put in the %SCHEMAS package variable

=head1 DESCRIPTION

This module contains L<Sah> schemas to validate L<SHARYANTO::TableSpec> specs.

=head1 SCHEMAS

=over

=item * table_spec

=item * field_spec

=back

=head1 SEE ALSO

L<Sah>, L<Data::Sah>

L<SHARYANTO::TableSpec>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
