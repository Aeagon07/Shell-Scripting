#!/bin/bash

<< task 
Deploy a django app and handle the code with errors
task


code_clone() {
	echo "Clonning the Django App..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirement() {
	echo "Installing Dependancie..."
	sudo apt-get install docker.io nginx -y docker-compose
}

required_restart() {
	# getting the permission error of the docker demon so give the permission to user
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
}

deploy() {
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	docker compose up -d --build
}

echo "************ DEPLOYMENT STARTED ***************"

#Now we do some error handling

if ! code_clone; then
	echo "directory is already exist"
	cd django-notes-app
fi

if ! install_requirement; then
	echo "Installation Failed"
	exit 1
fi

if ! required_restart; then
	echo "System Failure"
	exit 1
fi

if ! deploy; then
	echo "Deployment Error"
	exit 1
fi

echo "************ DEPLOYMENT DONE ******************"	 

