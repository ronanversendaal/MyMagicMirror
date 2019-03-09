# Make sure you install the following vagrant plugins:
# - vagrant plugin install vagrant-host-shell
# - vagrant plugin install vagrant-hostsupdater

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
 
    config.vm.box = "debian/stretch64"
 
    config.vm.network "private_network", ip: "192.168.13.12"

    #!! change the hostname!
    config.vm.hostname = "dev.magicmirror.com"

    # NFS. Much faster. Make sure to disable this ^ synced_folder line when using this
    config.vm.synced_folder ".", "/var/project", :nfs => { :mount_options => ["dmode=777","fmode=666","uid=1000","gid=1000"] }

    config.vm.provider "virtualbox" do |v|
        v.memory = 6144
        v.cpus = 4
        v.name = "magicmirrorbox"
    end
end
