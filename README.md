## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/nsepeteri/Scripts/Diagram/azure_framework.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Scripts may be used to install only certain pieces of it, such as Filebeat.

  - Scripts

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting access to the network.

Load balancing provides relibale and redundant access to webservers, and mitigates risks of DDOS aatacks. Jump box provides secure and reliable access to the network via SSH. We used public keys to mitigate risks of brute force attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the resources, and system files.

- Filebeat watches log files, specified locations, collects log events, and forwards them to ELK stack.
- Metricbeat records system-level CPU usage, memory, file system, disk IO, and network IO statistics, as well as top-like statistics for every process running on the system.

The configuration details of each machine may be found below.

| Name      | Function   | LAN IP      | Operating System |
|-----------|------------|-------------|------------------|
| Jump Box  | Gateway    | 10.0.1.4    |   Linux          |
| ELK Server| Monitoring | 10.1.1.4    |   Linux          |
| Web 1     | DVWA       | 10.0.1.5    |   Linux          |
| Web 2     | DVWA       | 10.0.1.6    |   Linux          |
| Web 3     | DVWA       | 10.0.1.7    |   Linux          |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Head Office - 67.69.211.58, Home Office - 216.176.41.1

Machines within the network can only be accessed by jump box.
- Jump Box IP - 52.142.56.99

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible     | Allowed IP Addresses       |
|------------|-------------------------|----------------------------|
| Jump Box   | Yes                     | 10.0.1.0/24, 10.1.1.0/2    |
|            | Public IP 52.142.56.99  | 216.176.41.1, 67.69.211.58 |
|            |                         |                            |
| ELK Server | Yes                     | 10.0.1.0/24 10.1.1.0/24    |
|            | Public IP 52.177.124.97 | 216.176.41.1, 67.69.211.58 |
|            |                         |                            |
| Load       | Yes                     | 216.176.41.1, 67.69.211.58 |
| Balancer   | Public IP 23.96.49.67   |                            |
|            |                         |                            |
| Web 1      | No                      | 10.0.1.0/24 10.1.1.0/24    |
| Web 2      | No                      | 10.0.1.0/24 10.1.1.0/24    |
| Web 3      | No                      | 10.0.1.0/24 10.1.1.0/24    |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
deployment is automated, fast, and allows to be executed on multiple hosts simulteneously.

The playbook implements the following tasks:
- Install docker.io
- Install Python
- Increase allowed RAM usage
- Configure ELK server published ports
- Make ELK server persistent

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps command screenshot](https://github.com/nsepeteri/Scripts/Images/elk.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.1.5, 10.0.1.6, 10.0.1.7

We have installed the following Beats on these machines:
- Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events, and forwards them to ELK stack. Metricbeat records system-level CPU usage, memory, file system, disk IO, and network IO statistics, as well as top-like statistics for every process running on the system, and sends them to Elasticsearch.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk_script.yml file to /etc/ansible/roles
- Update the "/etc/ansible/hosts" file to include Web VMs IP addresses
- Run the playbook, and navigate to http://52.177.124.97:5601/ to check that the installation worked as expected.

Answer the following questions:
- Which file is the playbook? elk_script.yml Where do you copy it? /etc/ansible/roles/
- Which file do you update to make Ansible run the playbook on a specific machine? - /etc/ansible/hosts
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? [webservers] for Web VMs [elk] for ELK server
- Which URL do you navigate to in order to check that the ELK server is running? http://52.177.124.97:5601/
