<img src="https://img.shields.io/static/v1?label=number+of+entries&message=33330&color=green?style=plastic&logo=appveyor" />  

# MikroTik_Privacy  
This script builds an updated RouterOS script that adds various block lists as dns static to NXDOMAIN.  

You must run the script manually from time to time in order to update them.

## Sources:
### AdAway default blocklist  
Blocking mobile ad providers and some analytics providers  
Fetch the latest version of this file:
https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt

License:
CC Attribution 3.0 (http://creativecommons.org/licenses/by/3.0/)

Contributions by:
Kicelo, Dominik Schuermann.
Further changes and contributors maintained in the commit history at
https://github.com/AdAway/adaway.github.io/commits/master

### WindowsSpyBlocker - Hosts spy rules
More info: https://github.com/crazy-max/WindowsSpyBlocker
License: MIT

### Easyprivacy, parsed and mirrored by https://firebog.net
This is sourced from an adblock style list which may contain mistakes in how it is parsed

### Title: 💊 Dandelion Sprout's Anti-Malware List («hosts» file version)
Description: This list goes the extra kilometer to prevent more malware than other mainstream anti-malware lists. It blocks heavily abused top-level domains (and even search engine results for them), blocks domains used in malware redirection trains and in domain parking schemes, blocks sponsored Windows PUP nags on PC guide articles, uses mass blocking of domains belonging to bad IPs, and has many other subcategories that give it a solid advantage over similar lists out there.
