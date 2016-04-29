# set ENVIRONMENT vars
sudo cat /vagrant/conf_files/bashrc_env_variables >> ~/.bashrc
# make dirs for nodes
sudo mkdir -p $HADOOP_HOME/hadoop_data/hdfs/namenode
sudo mkdir -p $HADOOP_HOME/hadoop_data/hdfs/datanode
#copy configuration files
sudo cp -r /vagrant/conf_files/hadoop_xmls/. $HADOOP_HOME/etc/hadoop/