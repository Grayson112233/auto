# Script to ensure the machine has the required dependencies and is ready
# to deploy a Django site


read -p "Enter your GitHub username:" GITHUB_NAME
read -p "Enter your GitHub-associated email:" GITHUB_EMAIL
sudo apt-get update
sudo apt-get install -y vim tree git
bash ./git_config.sh
bash ./install_dotfiles.sh
# bash ./cleanup.sh
