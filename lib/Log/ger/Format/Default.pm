package Log::ger::Format::Default;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

sub get_hooks {
    my %conf = @_;

    return {
        create_formatter => [
            __PACKAGE__, # key
            50,          # priority
            sub {        # hook
                my %hook_args = @_; # see Log::ger::Manual::Internals/"Arguments passed to hook"

# INSERT_BLOCK_FROM_MODULE: Log::ger::Heavy default_formatter

            }],
    };
}

1;
# ABSTRACT: Use default Log::ger formatting style

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Log::ger::Format 'Default';
 use Log::ger;

 log_debug "Printed as is";
 # will format the log message as: Printed as is

 log_debug "Data for %s is %s", "budi", {foo=>'blah', bar=>undef};
 # will format the log message as: Data for budi is {bar=>undef,foo=>"blah"}


=head1 DESCRIPTION

This is the default Log::ger formatter, which: 1) passes the argument as-is if
there is only a single argument; or, if there are more than one argument, 2)
treats the arguments like sprintf(), where the first argument is the template
and the rest are variables to be substituted to the conversions inside the
template. In the second case, reference arguments will be dumped using
L<Data::Dmp> or L<Data::Dumper> by default (but the dumper is configurable by
setting C<$Log::ger::_dumper>; see for example L<Log::ger::UseDataDump> or
L<Log::ger::UseDataDumpColor>).

The same code is already included in Log::ger distribution (inside
L<Log::ger::Heavy>); this distribution just repackages it so it's more reusable.
It is not part of the standard Log::ger distribution.


=head1 SEE ALSO

L<Log::ger>
