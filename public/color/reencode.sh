# Iterate over all .jpg files in the directory
for FILE in *.jpg; do
  # Check if the file exists (in case no .jpg files are found)
  if [ ! -f "$FILE" ]; then
    echo "No .jpg files found in the directory."
    exit 1
  fi

  # Define output file name and extension
  OUTPUT="${FILE%.jpg}"

  # Re-encode the image using ffmpeg with 85% quality
  ffmpeg -i "$FILE" -q:v 2 "$OUTPUT"

  # Check if the re-encoding was successful
  if [ $? -eq 0 ]; then
    # Remove the original file if the re-encoding was successful
    rm "$FILE"
    echo "Processed $FILE -> $OUTPUT"
  else
    echo "Error processing $FILE"
  fi
done

echo "Re-encoding complete."
