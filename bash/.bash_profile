# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

echo -e "\nWelcome to your cyberdeck, ${USER}. Your set reminders are: \n$(cat /home/${USER}/.reminders.data)\n"
# Add .NET Core SDK tools
export PATH="$PATH:/home/lucas/.dotnet/tools"
