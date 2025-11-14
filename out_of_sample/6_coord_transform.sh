#!/bin/bash

BASE_DIR="${1:-finished_outputs}"

for d in ${BASE_DIR}/*/; do
	python align_structures.py "$d"
done
