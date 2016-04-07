##
## create vagrant running docker inside
##  on circleic, use aws installed by circleci.yml
##
all: all-vbox

all-vbox: install-vbox add-vbox up-vbox

include color.mk

install-vbox: install-vagrant
	$(call colorecho, "install virtualbox")
	#dpkg-query -W -f='$${Status} $${Version}\n' virtualbox || sudo apt-get -y install virtualbox virtualbox-dkms

install-vagrant: vagrant_1.8.1_x86_64.deb
	$(call colorecho, "install vagrant")
	#vagrant --version || sudo dpkg -i vagrant_1.8.1_x86_64.deb
	#dpkg-query -W -f='$${Status} $${Version}\n' sshpass || sudo apt-get -y install sshpass
	#vagrant plugin list | grep vagrant-global-status || vagrant plugin install vagrant-global-status

vagrant_1.8.1_x86_64.deb:
	$(call colorecho, "download $@")
	#wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb

add-vbox: install-vagrant trusty-server-cloudimg-amd64-vagrant-disk1.box
	$(call colorecho, "box list")
	#vagrant box list
	$(call colorecho, "box add")
	#vagrant box list | grep ubuntu:14.04 || vagrant box add ubuntu:14.04 trusty-server-cloudimg-amd64-vagrant-disk1.box

up-vbox:
	$(call colorecho, "vagrant up")
	#vagrant up
	$(call colorecho, "vagrant reload")
	#vagrant reload
	$(call colorecho, "vagrant status")
	#vagrant status

all-echo:
	echo "test make commands"
