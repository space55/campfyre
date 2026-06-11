#!/bin/bash

for f in *.excalidraw; do
  excalidraw-cli convert "$f" --no-export-background --format png --scale 3 --output "../img/${f%.excalidraw}.png"
done
