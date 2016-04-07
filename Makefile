##
## create vagrant running docker inside
##  on circleic, use aws installed by circleci.yml
##
all: all-echo

include color.mk

vagrant_1.8.1_x86_64.deb:
	$(call colorecho, "download $@")
	#wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb

all-echo: vagrant_1.8.1_x86_64.deb
	$(call colorecho, "test make commands")
	echo "test make commands"
