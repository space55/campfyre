#!/bin/bash

for f in *.excalidraw; do
  jq '.elements |= map(select(.isDeleted != true))' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done
