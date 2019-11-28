# Script to install dotfiles and general preferences

# Clone dotfiles
cd ~
git clone git@github.com:Grayson112233/dotfiles.git
cd dotfiles

# vimrc
cp resources/vimrc.txt ~/.vimrc

# Append custom lines to bashrc if not already done
if grep -q Custom "$HOME/.bashrc"
then
	echo "Custom bashrc lines already appended."
else
	cat resources/bashrc_append.txt >> ~/.bashrc
fi
