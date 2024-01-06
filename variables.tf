#-------------------------------------------------------------------------------
#               VM Variables
#-------------------------------------------------------------------------------

variable "location" {
  type        = string
  description = "Location to deploy the resource"
  default     = "Brazil South"
}

variable "rg" {
  type        = string
  description = "Resource group to deploy the resource"
  default     = "RG-Jenkins-server"
}

variable "vm-name" {
  type        = string
  description = "name of the virtual machine"
  default     = "Jenkins-server"
}

variable "vm_size" {
  type        = string
  description = "SKU of the virtual machine"
  default     = "Standard_B2s"
}

variable "admin_user" {
  type        = string
  description = "Name of the admin user to the virtual machine"
  default     = "terraform"
}

variable "os_publicher" {
  type        = string
  description = "version of the ubuntu linux machine"
  default     = "Canonical"
}

variable "os_offer" {
  type        = string
  description = "version of the ubuntu linux machine"
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_version" {
  type        = string
  description = "version of the ubuntu linux machine"
  default     = "22_04-lts"
}

#-------------------------------------------------------------------------------
#               Network Variables
#-------------------------------------------------------------------------------

variable "vnet-name" {
  type        = string
  description = "Name of the V-net"
  default     = "jenkins-vnet"
}

variable "subnet-name" {
  type        = string
  description = "Name of the subnet"
  default     = "jenkins-subnet"
}

variable "adress_space" {
  description = "adress space of the subnet"
  default     = ["10.0.0.0/16"]
}

variable "adress_prefix" {
  description = "adress prefix of the subnet"
  default     = ["10.0.1.0/24"]
}

variable "nsg-name" {
  type        = string
  description = "Name of the network security group"
  default     = "jenkins-nsg"
}

variable "source_address_prefix" {
  type        = string
  description = "ip that will connect to the virtual machine"
  default     = "your home ip here"
}