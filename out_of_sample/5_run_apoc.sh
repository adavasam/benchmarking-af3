#!/bin/bash

BASE_DIR="${1:-finished_outputs}"
APOC_BIN="/path/to/apoc/executable"

for SUBDIR in "$BASE_DIR"/*/; do
	[ -d "$SUBDIR" ] || continue

	if [[ ! -f "${SUBDIR}af3_model_pocket_added.pdb" ]] || [[ ! -f "${SUBDIR}ref_complex_pocket_added.pdb" ]]; then
		echo "Missing af3_model_pocket_added.pdb or ref_complex_pocket_added.pdb in ${SUBDIR#*/}, skipping."
		continue
	fi

	apoc_output="${SUBDIR}apoc_output.txt"
	${APOC_BIN} "${SUBDIR}ref_complex_pocket_added.pdb" "${SUBDIR}af3_model_pocket_added.pdb" -fa 0 -plen 5 > "$apoc_output"

done
echo "Done"
