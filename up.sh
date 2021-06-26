#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

export GITHUB_TOKEN="${1}"
github-release release \
--user 'icebluey' \
--repo 'test' \
--tag v$(date -u +%Y-%m-%d_%H-%M) \
--name v$(date -u +%Y-%m-%d_%H-%M)

