#!/bin/bash
# Run every PLanet program in ./Planet and store its printed output in
# ./Planet/outputs/<program>.out, reporting the wall time of each run.
#
# Usage:  PYTHON=/path/to/python ./collect_program_output.sh
# PYTHON must be able to `import planet` (e.g. a virtualenv with planet-lang
# installed, or set PYTHONPATH=<planet-lang>/src). Defaults to python3.
PYTHON="${PYTHON:-python3}"
INPUT_DIR="./Planet"
OUTPUT_DIR="./Planet/outputs"

mkdir -p "$OUTPUT_DIR"
rm -f "$OUTPUT_DIR"/*.out

for file in "$INPUT_DIR"/*.py; do
  filename=$(basename "$file")
  output_file="$OUTPUT_DIR/${filename}.out"
  start_time=$(date +%s)
  "$PYTHON" "$file" > "$output_file"
  status=$?
  end_time=$(date +%s)
  echo "$filename: exit $status, $((end_time - start_time)) s"
done
