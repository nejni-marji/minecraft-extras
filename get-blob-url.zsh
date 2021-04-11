#!/bin/zsh

get_blob_url() {
	curl --silent 'https://github.com/nejni-marji/minecraft-extras' \
		#
		#| grep -Po '(?<=href="/)nejni-marji/minecraft-extras/commit/[0-9a-fA-F]{40}(?="' \
		#| head -n1
}


get_blob_url

