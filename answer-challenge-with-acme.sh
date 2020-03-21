#!/usr/bin/env bash
# answer-dns-challenge-with-acme.sh
# clones acme.sh from the repo and sets up the challenge
# author: Brian King
# copyright: 2019
# license: Apache
/bin/bash /root/acme.sh/acme.sh --home /root/.acme.sh --renew --dns --yes-I-know-dns-manual-mode-enough-go-ahead-please -d $domain  >> /var/log/cert_renew.log
cert="$(cat /root/.acme.sh/$domain/$domain.cer)"
chain="$(cat /root/.acme.sh/$domain/fullchain.cer)"
privkey="$(cat /root/.acme.sh/$domain/$domain.key)"
echo "$cert;$chain;$privkey"