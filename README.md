Simple script to create a yum repository with the latest zoom rpm.

Create the following file in /etc/yum.repos.d/zoom.repo:

    [zoom]
    name=zoom
    baseurl=file:///var/tmp/yum_zoom
    enabled=1
    gpgkey=https://zoom.us/linux/download/pubkey
    gpgcheck=1

Based on https://github.com/mheffner/zoom-rpm-repo.
