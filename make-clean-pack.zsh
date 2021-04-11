#!/bin/zsh
# set -x

# set some names
mc_default=default
mc_full=my_pack_full
mc_clean=my_pack_clean

# func to get hashes
mc_get_hash() {
	mc_path=$1
	cd $mc_path
	find . -type f -exec md5sum {} + | sort
	cd -
}

# get hashes
mc_get_hash $mc_default > cache/hash_base.txt
mc_get_hash $mc_full > cache/hash_mine.txt

# get changed files
local -a file_diff=(${(f)"$(comm -13 cache/hash_base.txt cache/hash_mine.txt | cut -c37-)"})

# allow array expansion
setopt RC_EXPAND_PARAM

# do the actual copy from full to clean
rsync -Rav $mc_full/./${file_diff} $mc_clean/

cd $mc_clean ; zip -rv ../my_pack_clean.zip * ; cd -
