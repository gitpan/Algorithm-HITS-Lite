#!/usr/bin/perl

use Test::More tests => 2;

use Algorithm::HITS::Lite;

my $adjm = {
    alice => { bob => 1 },
};

my $ah = Algorithm::HITS::Lite->new($adjm);

my ($hub,$auth) = $ah->iterate;

ok($auth->{bob} == 1);
ok($hub->{alice} == 1);
