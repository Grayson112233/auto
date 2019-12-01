# Script to configure git and ssh keys for GitHub

git config --global user.name "$GITHUB_NAME"
git config --global user.email "$GITHUB_EMAIL"

# Generate a new ssh key if it doesn't already exist
FILE=~/.ssh/id_rsa.pub
if test -f "$FILE"
then
	echo "ssh key already exists"
else
    ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -q -N "" -f "$HOME/.ssh/id_rsa"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

# cat the key for GitHub
echo "Copy the following key to GitHub as a new SSH key:"
cat ~/.ssh/id_rsa.pub

read -p "Press enter when you're done. This step must be completed before continuing."
