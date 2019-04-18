#!/usr/bin/env bash
# get-dns-challenge-with-acme.sh
# clones acme.sh from the repo and sets up the challenge
# author: Brian King
# copyright: 2019
# license: Apache
# making dir manually due to https://github.com/Neilpang/acme.sh/issues/2223
mkdir -p /root/.acme.sh
touch /root/.acme.sh/account.conf
pkgs="git"
yum -q -y install $pkgs > /dev/null 2>&1
git clone https://github.com/Neilpang/acme.sh.git /root/acme.sh/ > /dev/null 2>&1
cd /root/acme.sh
./acme.sh --issue --dns -d de06.rackesc.net --yes-I-know-dns-manual-mode-enough-go-ahead-please 2>&1 | tee /tmp/results
grep "TXT value" /tmp/results | awk -F\' '{print $2}'
