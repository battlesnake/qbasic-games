#!/bin/bash

set -eu

function extract {
	local -r in="$1"
	local -r out="$2"
	find -name "*.$in" -exec bash -c \
		"
		set -eu
		declare -r in='{}'
		declare -r out=\"\$(echo \"\$in\" | perl -pe 's(\\Q.$in)(.$out); s(\Q./DISK\E./)();')\"
		mkdir -p \"\$(dirname \"\$out\")\"
		echo \"unpack \$in \$out\"
		echo \"del \$in\"
		" \;
}

rm -rf qb45
mkdir -p qb45
cd qb45
unzip ../qb45.zip

# trap 'rm -f INS.BAT' EXIT ERR

(
rm phatcode.exe
echo 'COPY DISK2/UNPACK.EXE ./'
extract 'EX$' 'EXE'
extract 'CO$' 'COM'
extract 'OB$' 'OBJ'
extract 'LI$' 'LIB'
extract 'QL$' 'QLB'
extract 'HL$' 'HLP'
extract 'BA$' 'BAS'
extract 'DA$' 'DAT'
extract 'PI$' 'PIF'
extract 'BI$' 'BI'
) | perl -pe 's(/)(\\)g' > INS.BAT

dosbox INS.BAT -exit

echo 'Did not decompress:'
find -name '*.*$'
echo ''

mv -v DISK?/* ./
rm -r DISK?/
