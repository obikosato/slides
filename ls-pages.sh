#!/bin/sh

BASE_URL="https://obikosato.github.io/slides"

find src -name "index.md" -type f | while read -r md_file; do
	FOLDER_NAME=$(echo "${md_file}" | sed -E 's|^src/(.*)/index\.md$|\1|')
	TITLE=$(grep '^title:' "${md_file}" | sed -E 's/^title: *"?(.+)"?$/\1/')

	echo "- [${TITLE}](${BASE_URL}/${FOLDER_NAME}/)"
done
