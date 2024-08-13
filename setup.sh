#!/usr/bin/env bash

# ensure submodules are updated
git submodule init
git submodule update

# dirs that should be installable by all users, including root
base=(
	bash
	bin
	vim
	ratpoison
	emacs
	xorg
)

# dirs that should only be installed for the local user
useronly=(
	git
)

# run stow command nicely for directory and app
stowit() {
	dir=$1
	app=$2
	# -v verbose, -R restow, -t target
	stow -v -R -t ${dir} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to users and root(base)
for app in ${base[@]}; do
	stowit "${HOME}" $app
done

# install apps available to only local users(useronly)
for app in ${useronly[@]}; do
	if [ $(id -u) -ne 0 ]; then
		stowit "${HOME}" $app
	fi
done

echo ""
echo "##### ALL DONE #####"
