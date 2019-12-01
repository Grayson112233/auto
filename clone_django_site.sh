# Script to clone the Django site from GitHub
# This script assumes that the site has not already been cloned.
# If the script fails halfway through, make sure to rm -rf the repo dir.

read -p "Enter repo name:" REPO_NAME
read -p "Enter django project name:" PROJ_NAME
read -p "Enter server name:" SERVER_NAME

sudo ufw allow 'Nginx Full'

cd ~
git clone git@github.com:Grayson112233/$REPO_NAME.git
cd $REPO_NAME

# Set up venv
python3 -m venv env
source env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Django stuff
cd $PROJ_NAME
python manage.py collectstatic
python manage.py migrate
cd ..

# Create gunicorn service and socket
cd ~/auto
sudo cp resources/gunicorn_service_template.txt /etc/systemd/system/gunicorn-$REPO_NAME.service
sudo sed -i "s/REPO_NAME/$REPO_NAME/g" /etc/systemd/system/gunicorn-$REPO_NAME.service
sudo sed -i "s/PROJ_NAME/$PROJ_NAME/g" /etc/systemd/system/gunicorn-$REPO_NAME.service
sudo cp resources/gunicorn_socket_template.txt /etc/systemd/system/gunicorn-$REPO_NAME.socket
sudo sed -i "s/REPO_NAME/$REPO_NAME/g" /etc/systemd/system/gunicorn-$REPO_NAME.socket
sudo sed -i "s/PROJ_NAME/$PROJ_NAME/g" /etc/systemd/system/gunicorn-$REPO_NAME.socket

# Create nginx site and enable it
sudo cp resources/nginx_site_template.txt /etc/nginx/sites-available/$REPO_NAME
sudo sed -i "s/REPO_NAME/$REPO_NAME/g" /etc/nginx/sites-available/$REPO_NAME
sudo sed -i "s/PROJ_NAME/$PROJ_NAME/g" /etc/nginx/sites-available/$REPO_NAME
sudo sed -i "s/SERVER_NAME/$SERVER_NAME/g" /etc/nginx/sites-available/$REPO_NAME
sudo ln -s /etc/nginx/sites-available/$REPO_NAME /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx