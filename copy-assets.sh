#!/bin/sh

# copy-assets.sh
# This is a script to copy slide assets (images, etc.) from src to dist directory.

: "Setup" && {
	SRC_DIR="src"
	DIST_DIR="dist"
}

: "Check src directory" && {
	[ -d "${SRC_DIR}" ] || {
		echo "ERROR: ${SRC_DIR} is not found"
		exit 1
	}
	echo "Copying images to ${DIST_DIR} directory..."
}

: "Search for images directories under src and copy to dist" && {
	find "${SRC_DIR}" -type d -name images | while read -r img_dir; do
		target_dir="${DIST_DIR}/${img_dir#"${SRC_DIR}/"}"
		echo "Copying...: ${img_dir} -> ${target_dir}"
		mkdir -p "${target_dir}" || exit 1
		cp -r "${img_dir}/." "${target_dir}/" || exit 1
	done
}
