#!/usr/local/bin/fish

# ensure submodules are updated
git submodule init
git submodule update

# dirs that should be installable by all users, including root
set base "bin" "xorg"

# dirs that should only be installed for the local user
set useronly "git" "config"

function stowit -a dir app
	# -v verbose, -R restow, -t target
	stow -v -R -t $dir $app
end

# install apps available to users and root(base)
for app in $base
	stowit $HOME $app
end

# install apps available to only local users(useronly)
for app in $useronly
	if test (id -u) != 0
		stowit $HOME $app
	end
end
