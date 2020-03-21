#!/usr/bin/env bash
# get-dns-challenge-with-acme.sh
# clones acme.sh from the repo and sets up the challenge
# author: Brian King
# copyright: 2020
# license: Apache
pkgs="git"
yum -q -y install $pkgs > /dev/null 2>&1
git clone https://github.com/Neilpang/acme.sh.git /root/acme.sh/ > /dev/null 2>&1
/bin/bash /root/acme.sh/acme.sh --home /root/.acme.sh --issue --dns -d $domain --yes-I-know-dns-manual-mode-enough-go-ahead-please >> /var/log/cert_issue.log
grep "TXT value" /var/log/cert_issue.log | awk -F\' '{print $2}'
CT=$(grep "TXT value" /var/log/cert_issue.log | awk -F\' '{print $2}')
printf %s "${CT}"