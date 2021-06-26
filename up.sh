#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

cd /tmp
apt -y update
apt -y install wget bzip2
wget 'https://github.com/github-release/github-release/releases/download/v0.10.0/linux-amd64-github-release.bz2' -O /tmp/linux-amd64-github-release.bz2
bzip2 -d linux-amd64-github-release.bz2
install -v -c -m 0755 linux-amd64-github-release /usr/bin/github-release

export GITHUB_TOKEN="${1}"
github-release release \
--user 'icebluey' \
--repo 'test' \
--tag v$(date -u +%Y-%m-%d_%H-%M) \
--name v$(date -u +%Y-%m-%d_%H-%M)

