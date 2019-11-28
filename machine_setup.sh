# Script to ensure the machine has the required dependencies and is ready
# to deploy a Django site

sudo apt-get update
sudo apt-get install python3 python3-pip python3-venv nginx vim tree git
bash ./git_config.sh
bash ./install_dotfiles.sh
sudo ufw allow 'Nginx Full'
