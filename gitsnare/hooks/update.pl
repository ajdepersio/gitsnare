#!/bin/perl
use strict;
use warnings;
use feature qw(say);

sub ReadVersionFile {
    open FILE, $_[0];
    my @fileContents = <FILE>;
    close FILE;
    return $fileContents[0];
}

sub UpdateAvailable {
    my @currentVersion = split( '\.', $_[0] );
    my @repoVersion    = split( '\.', $_[1] );

    for ( my $i = 0 ; $i < scalar @currentVersion ; $i++ ) {
        if ( $repoVersion[$i] > $currentVersion[$i] ) {
            return 1;
        }
        elsif ( $currentVersion[$i] > $repoVersion[$i] ) {
            return 0;
        }
    }
    return 0;
}

sub UpdateHooks {
    say "Current Version: " . $_[0];
    say "Repo Version: " . $_[1];
    say "Updating Hooks";

    system("../../Resources/hooks/install.bat");
}

my $currentVersion = &ReadVersionFile("<version");
my $repoVersion = &ReadVersionFile("<../../Resources/hooks/files/version");

if ( &UpdateAvailable( $currentVersion, $repoVersion ) ) {
    &UpdateHooks( $currentVersion, $repoVersion );
}