# Requirements 
- Vagrant/Virtualbox
- Git

# Installation for DEVELOPMENT ON LOCAL MACHINE **(Not Raspbian)**

> The **project** directory is the directory where the README and Vagrantfile are located.

> The **MagicMirror** (or MM ) directory is the MagicMirror folder within the project directory.

- Clone this project using git.
- Enter the project directory and run `vagrant up`
- Enter the vagrant box with `vagrant ssh`
- Make sure you install all dependencies from within the vagrant box: 
  - `sudo apt-get install -y curl git jq libgtk-3-dev libxss1 libgconf-2-4 libnss3 libasound2`
- Install NodeJs next: `curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -` and then run `sudo apt-get install -y nodejs`
- Navigate to the project directory in the vagrant box (Probably /var/project) and clone the MagicMirror project : `git clone https://github.com/MichMich/MagicMirror`
- Enter the cloned folder and install dependencies: 
  - `cd MagicMirror && npm install`
- Locate the config folder and copy the `config.js.sample` to `config.js` or use your own (One is located in the project root). 
  - NOTE : The config.js can hold API keys or other credentials for certain services, so make sure you don't add this to version control!
- Start the MagicMirror in server only mode: `node serveronly`
- Navigate to the domain or ip address configured in the Vagrantfile with port 8080 (example: dev.magicmirror.com:8080)

## Installing https 
If modules you would like to install voice commands or such, you would need to access the mirror via https to allow most browsers to allow these inputs. Most default browsers automatically deny access and settings can't be altered.
Creating a self-signed certificate will allow https access.
- Create a directory `https` in `MagicMirror/js/` and navigate to it.
- Create a self-signed certificate using `openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes`
- Follow the instructions on the comment here to setup https in `js/server.js` : https://forum.magicmirror.builders/post/42690
- Access the mirror via https://dev.magicmirror.com:8080

# Installing modules
I've made a script to install all of your currently used modules:

- Navigate to **project directory** in the vagrant box and run `install_modules.sh`
- Configure the module in the config.js as per the documentation in the module repository if you haven't already.

It's important to keep track of your installed modules with the `modules.json` file located in the project directory. This file is used to install all of your modules.

# Troubleshooting
- If you navigate from your local machine to the ip/domain where the mirror is located, you can get the error : 
```
This device is not allowed to access your mirror. 
Please check your config.js or config.js.sample to change this.
```
Solution: in the `config.js` set the `address` property to `0.0.0.0` and add your private ip ( from the box ) to the `ipWhitelist` array. ( Check the node logs for the ip that gets blocked. )

For more information about the MagicMirror project or troubleshooting, please refer to the MagicMirror repository and wiki.