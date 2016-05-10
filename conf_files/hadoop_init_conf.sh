# this script executes all the haddop deamons
/home/vagrant/hadoop-2.7.2/bin/hdfs namenode -format
/home/vagrant/hadoop-2.7.2/bin/hdfs datanode -format
/home/vagrant/hadoop-2.7.2/sbin/start-dfs.sh
/home/vagrant/hadoop-2.7.2/sbin/start-yarn.sh

