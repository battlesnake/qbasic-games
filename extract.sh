#!/bin/bash

set -eu

declare dir=

for zip in *.zip; do
	dir=${zip%.zip}
	(
		mkdir -p "$dir"
		cd "$dir"
		unzip "../$zip"
	)
done
