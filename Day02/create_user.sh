#!/bin/bash

read -p "Enter username: " user

echo "You enter $user"

sudo useradd -m $user

echo "User is Added!"
