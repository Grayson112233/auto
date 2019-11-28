# Script to clone the Django site from GitHub

read -p "Enter repo name:" REPO_NAME

read -p "Enter django project name:" PROJ_NAME

cd ~
git clone git@github.com:Grayson112233/$REPO_NAME.git
cd $REPO_NAME


