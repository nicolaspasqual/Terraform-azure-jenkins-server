<h1>Create a Jenkins server on Azure</h1> 

> Project status: :heavy_check_mark: Done

## Description 

<p align="justify">
  This project was made to create a simple Jenkins server on Azure using a virtual machine. 
</p>

## Functionalities

Create the resource group on Azure
Create the virtual network on Azure  
Create the network security group on Azure
Create the network interfaces on Azure
Create the public IPs on Azure
Create the virtul machine 
install de jenkins server

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
:heavy_check_mark: location
:heavy_check_mark: RG
:heavy_check_mark: vm-name
:heavy_check_mark: vm-size
:heavy_check_mark: admin-user
:heavy_check_mark: os_publicher
:heavy_check_mark: os-offer
:heavy_check_mark: os-version
:heavy_check_mark: vnet-name
:heavy_check_mark: subnet-name
:heavy_check_mark: adress_space
:heavy_check_mark: adress_prefix
:heavy_check_mark: nsg-name
:heavy_check_mark: source_address_prefix

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
ssh terraform@Server-IP
```

You can check if the jenkins service is up running:

```
sudo systemctl status jenkins

```

You can also check if the jenkins is up on the browser:

```
http://<server-ip>:8080/

```
## Use cases

Related to the use of Jenkins to implement CI\CD

## Licence

The [MIT License]() (MIT)

Copyright :copyright: 2023 - Create kubernetes cluster on Azure VMs