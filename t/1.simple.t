#!/usr/bin/perl

use Test::More tests => 6;

use Algorithm::HITS::Lite;

my $adjm = {
    alice => { bob => 1 },
};

my $ah = Algorithm::HITS::Lite->new($adjm);

my ($hub,$auth) = $ah->iterate;

ok($auth->{bob} == 1);
ok($hub->{alice} == 1);

($hub,$auth) = $ah->iterate(20);
ok($auth->{bob} == 1);
ok($hub->{alice} == 1);

my $adjm2 = {
    alice => {},
    bob => {}
};

$ah = Algorithm::HITS::Lite->new($adjm2);
($hub,$auth) = $ah->iterate(20);
ok($auth->{bob} == 0);
ok($hub->{alice} == 0);
