#!/bin/bash

rm adblock_mikrotik.rsc
echo "# Blocking ads at DNS level for MikroTik
/ip dns static remove [find type=NXDOMAIN]
# Blocking ads at DNS level for MikroTik
/ip dns static">>adblock_mikrotik.rsc

# Basic Android ads
echo "# AdAway default blocklist
# Blocking mobile ad providers and some analytics providers
#
# Project home page:
# https://github.com/AdAway/adaway.github.io/
#
# Fetch the latest version of this file:
# https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
#
# License:
# CC Attribution 3.0 (http://creativecommons.org/licenses/by/3.0/)
#
# Contributions by:
# Kicelo, Dominik Schuermann.
# Further changes and contributors maintained in the commit history at
# https://github.com/AdAway/adaway.github.io/commits/master
#
# Contribute:
# Create an issue at https://github.com/AdAway/adaway.github.io/issues
#">>adblock_mikrotik.rsc

rm hosts*
wget https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
prefix="127.0.0.1 "
while IFS= read -r line; do
    if [[ "$line" != *localhost* ]]; then
        [[ "$line" =~ "$prefix" ]] && echo "add type=NXDOMAIN name=\"${line#"$prefix"}\"" >>adblock_mikrotik.rsc
    fi
done < hosts.txt

# Windows spyware
echo "### WindowsSpyBlocker - Hosts spy rules
### License: MIT
### Updated: 2022-05-16T13:25:00Z02:12
### Donate: https://github.com/sponsors/crazy-max ; https://www.paypal.me/crazyws
### More info: https://github.com/crazy-max/WindowsSpyBlocker">>adblock_mikrotik.rsc

rm spy*
wget https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
prefix="0.0.0.0 "
while IFS= read -r line; do
    [[ "$line" =~ "$prefix" ]] && echo "add type=NXDOMAIN name=\"${line#"$prefix"}\"" >>adblock_mikrotik.rsc
done < spy.txt

# EasyPrivacy
echo "# Easyprivacy, parsed and mirrored by https://firebog.net
# Updated 25NOV22 from https://easylist-downloads.adblockplus.org/easyprivacy.txt

# This is sourced from an "adblock" style list which may contain mistakes in how it is parsed
# Please bring any such issues up at https://github.com/WaLLy3K/wally3k.github.io/issues

# List corrections can be requested at https://github.com/easylist/easylist#list-issues">>adblock_mikrotik.rsc

rm Easyprivacy*
wget https://v.firebog.net/hosts/Easyprivacy.txt
dos2unix -n Easyprivacy.txt Easyprivacy_unix.txt
while IFS= read -r line; do
    if [ "$line" != "" ] && [[ "$line" != \#* ]]; then
        echo "add type=NXDOMAIN name=\"${line}\"" >>adblock_mikrotik.rsc
    fi
done < Easyprivacy_unix.txt

# Malicious sites
echo "# Title: 💊 Dandelion Sprout's Anti-Malware List («hosts» file version)
# Version: 23November2022v1
# Expires: 2 days
# Description: This list goes the extra kilometer to prevent more malware than other mainstream anti-malware lists. It blocks heavily abused top-level domains (and even search engine results for them), blocks domains used in malware redirection trains and in domain parking schemes, blocks sponsored Windows PUP nags on PC guide articles, uses mass blocking of domains belonging to bad IPs, and has many other subcategories that give it a solid advantage over similar lists out there."

rm AntiMalwareHosts*
wget https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
dos2unix -n AntiMalwareHosts.txt AntiMalwareHosts_unix.txt
prefix="127.0.0.1 "
while IFS= read -r line; do
    [[ "$line" =~ "$prefix" ]] && echo "add type=NXDOMAIN name=\"${line#"$prefix"}\"" >>adblock_mikrotik.rsc
done < AntiMalwareHosts_unix.txt
