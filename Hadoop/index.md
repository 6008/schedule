---
title       : A Introduction of Hadoop Cluster
subtitle    : 
author      : Wei Cui
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Introduction

- The Cluster
- Hadoop
- Installation
- Configuration
- Application
- TODO

---

## The Cluster

- 1 Head Node : Raspberry Pi Model B with 1 core@900MHz 512MB memory and 8GB MicroSD card 
- 3 Computing Node : Raspberry Pi 2 with 4 cores@1GHz 1GB memory and 16GB MicroSD card
- Network : Wireless router
- Power : 50W USB power
- ssh hduser@138.23.57.146 to access. PASSWORD: cuilab

---

## Hadoop

- HDFS : Big block size and multiple replications
- Map Reduce : simple and efficient parallel computing solution

---

## Installation

- Download the package from <br/> http://apache.mirrors.spacedump.net/hadoop/core/hadoop-1.2.1/hadoop-1.2.1.tar.gz
- unzip
- move all the files to /opt/hadoop directory or anywhere you want
- change the owner of /opt/hadoop to hduser (or any other)

---

## Configuration

- System Environment
- Hadoop Environment
- Hadoop Settings
- Clone to other nodes
- Configure SSH
- Configure head node
- Ready? Go!

---

## System Environment

- Make sure Java is installed
- Setting environment variable JAVA_HOME
- Setting environment variable HADOOP_INSTALL
- Setting environment variable PATH

---

## System Environment (Continue)

In file /etc/bash.bashrc (need root privilege): <br/>
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") <br/>
export HADOOP_INSTALL=/opt/hadoop <br/>
export PATH=$PATH:$HADOOP_INSTALL/bin <br/>
save and run command source /etc/bash.bashrc

---

## Hadoop Environment

In file /opt/hadoop/conf/hadoop-env.sh uncomment and change the following lines (need root privilege): <br/>
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") <br/>
export HADOOP_HEAPSIZE=250 <br/>
export HADOOP_DATANODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_DATANODE_OPTS <font color="red">-client</font>"

---

## Hadoop Settings
- sudo mkdir -p /hdfs/tmp
- change owner to hduser
- change mode to 750 <br/>
In directory /opt/hadoop/conf/
- core-site.xml Basic settings of Hadoop
- mapred-site.xml Settings of Map-Reduce
- hdfs-site.xml Settings of HDFS
- masters: change from localhost to node0

---

## core-site.xml

\<configuration\>\<property\> <br/>
    \<name\>hadoop.tmp.dir\</name\> <br/>
    \<value\>/hdfs/tmp\</value\> <br/>
  \</property\>\<property\> <br/>
    \<name\>fs.default.name\</name\> <br/>
    \<value\>hdfs://node0:9000\</value\> <br/>
  \</property\>\</configuration\> <br/>
hadoop files' storage and the NAMENODE. node0 is the head node.

---

## mapred-site.xml

\<configuration\>\<property\> <br/>
    \<name\>mapred.job.tracker\</name\> <br/>
    \<value\>node0:9001\</value\>\</property\>\<property\> <br/>
    \<name\>mapred.tasktracker.map.tasks.maximum\</name\> <br/>
    \<value\>4\</value\>\</property\>\<property\> <br/>
    \<name\>mapred.tasktracker.reduce.tasks.maximum\</name\> <br/>
    \<value\>4\</value\>\</property\>\</configuration\> <br/>
Set job tracker to head node.

---

## hdfs-site.xml

\<configuration\>\<property\> <br/>
    \<name\>dfs.replication\</name\> <br/>
    \<value\>2\</value\>\</property\>\<property\> <br/>
    \<name\>dfs.block.size\</name\> <br/>
    \<value\>4194304\</value\>\</property\>\</configuration\> <br/>
Set the replication number as 2 and block size as 4MB. In real cluster, the replication number should be no less than 3 and block size should no less than 64MB.

---

## Clone to other nodes

If all machines are new for Hadoop, we can clone the storage of the head node to others.

If not, we have to repeat all the steps above to every machine. 

---

## Configure SSH

- Add every node's name-adress pair to all nodes' file /etc/hosts <br/>
192.168.0.100   node0 <br/>
192.168.0.101   node1 <br/>
192.168.0.102   node2 <br/>
192.168.0.103   node3 <br/>
- generate public key for every node <br/>
ssh-keygen -t rsa -P ""
- add this key to every nodes' file ~/.ssh/authorized_keys
- ssh every node from all nodes using node's name (include itself)

---

## Configure head node

In directory /opt/hadoop/conf/ 
- slaves: <br/>
node1 \<Enter\> node2 \<Enter\> node3 
- mapred-site.xml: <br/>
DELETE the task number setting. <br/><br/>
Restart the head node after the operations.

---

## Ready? Go!

Let's make hadoop work. <br/>
On head node run commands: <br/>
hadoop namenode -format <br/>
start-dfs.sh <br/>
start-mapred.sh <br/>
Actually, you can use "start-all.sh" instead of "start-dfs.sh" and "start-mapred.sh"

---

## Application

- Example: wordcount
- Must learn JAVA?

---

## Example: wordcount

Steps of using Map-Reduce

- Set the Mapper
- Set the Reducer
- Upload data files into HDFS
- RUN
- Download the result files from HDFS

---

## Example: wordcount (Continue)

Hadoop has some examples in  /opt/hadoop/hadoop-examples-1.2.1.jar which includes mapper and reducer (so we do not need to configure). The simplest one is wordcount. We have a file named "bigfile.txt" in home directory. <br/>
hadoop dfs -copyFromLocal ./bigfile.txt /big <br/>
hadoop jar /opt/hadoop/hadoop-examples-1.2.1.jar wordcount /big /big-out <br/>
hadoop dfs -copyToLocal /big-out ~/ <br/>
You can check the status of nodes by access http://138.23.57.146:50070/ <br/>
You can check the status of jobs by access http://138.23.57.146:50030/ 

---

## Must learn JAVA?

Although Hadoop is based on JAVA, you can use almost any language to realize mapper and reducer and then run hadoop as streaming. And yes, you can use R.

---

## TODO

- Ambari
- Mahout
- Cassandra
- Spark
- ......



