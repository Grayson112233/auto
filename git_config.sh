# Script to configure git and ssh keys for GitHub

git config --global user.name "Grayson112233"
git config --global user.email "graysonpike@gmail.com"

# Generate a new ssh key if it doesn't already exist
FILE=~/.ssh/id_rsa.pub
if test -f "$FILE"; then
    ssh-keygen -t rsa -b 4096 -C "graysonpike@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

# cat the key for GitHub
echo "Copy the following key to GitHub:"
cat ~/.ssh/id_rsa.pub

read -p "Press enter when you're done."
