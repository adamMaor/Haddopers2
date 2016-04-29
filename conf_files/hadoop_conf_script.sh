# set ENVIRONMENT vars
sudo cat /vagrant/conf_files/bashrc_env_variables >> /home/vagrant/.bashrc
# set owner
sudo chown -R vagrant /home/vagrant/hadoop-2.7.2/
# make dirs for nodes
sudo mkdir -p /home/vagrant/hadoop-2.7.2/hadoop_data/hdfs/namenode
sudo mkdir -p /home/vagrant/hadoop-2.7.2/hadoop_data/hdfs/datanode

sudo chown -R vagrant /home/vagrant/hadoop-2.7.2/
#copy configuration files
sudo cp -r /vagrant/conf_files/hadoop_xmls/. /home/vagrant/hadoop-2.7.2/etc/hadoop/