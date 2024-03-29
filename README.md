<h1>Create a Jenkins server on Azure</h1> 

> Project status: :heavy_check_mark: Done

## Description 

<p align="justify">
  This project was made to create a simple Jenkins server on Azure using a virtual machine. 
</p>

## Functionalities

:heavy_check_mark: Create the resource group on Azure

:heavy_check_mark: Create the virtual network on Azure  

:heavy_check_mark: Create the network security group on Azure

:heavy_check_mark: Create the network interfaces on Azure

:heavy_check_mark: Create the public IPs on Azure

:heavy_check_mark: Create the virtul machine 

:heavy_check_mark: install de jenkins server

## Prerequisites

:warning: [Terraform]

:warning: [Linux OS]

:warning: [Azure account with active subscription]

## How to run :arrow_forward:

On the terminal, clone the project: 

```
git clone https://github.com/nicolaspasqual/Terraform-azure-jenkins-server.git
```

Generate the Azure credentials to use on Terraform:

```
https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash

```

On the variables file configure:

```
* location
* RG
* vm-name
* vm-size
* admin-user
* os_publicher
* os-offer
* os-version
* vnet-name
* subnet-name
* adress_space
* adress_prefix
* nsg-name
* source_address_prefix

```

On the main.tf file, configure your backend resource to save your terraform.state, you can also remove the entire backend session if you will not use a remote state folder.


On the project folder, execute the following commands to create the environment:

```
Terraform init
Terraform plan
Terraform apply
```
... 

## How to test the configuration

You will receive the IPs at the end of the run, and now you can connect on the jenkins server:

``` 
ssh terraform@<server-ip>
```

You can check if the jenkins service is up running:

```
sudo systemctl status jenkins

```

You can also check if the jenkins is up on the browser:

```
http://<server-ip>:8080/

```
You can get the admin password running the following command on the server:

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

## Use cases

Related to the use of Jenkins to implement CI\CD

## Licence

The [MIT License]() (MIT)

Copyright :copyright: 2023 - Create kubernetes cluster on Azure VMs
