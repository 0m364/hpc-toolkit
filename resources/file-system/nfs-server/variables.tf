/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

variable "deployment_name" {
  description = "Name of the HPC deployment, used as name of the filestore instace if no name is specified."
  type        = string
}

variable "zone" {
  description = "The name of the Filestore zone of the instance."
  type        = string
}

variable "disk_size" {
  description = "Storage size gb"
  type        = number
  default     = "100"
}

variable "type" {
  description = "The service tier of the instance."
  type        = string
  default     = "pd-ssd"
}

variable "image_family" {
  description = "the VM image used by the nfs server"
  type        = string
  default     = "centos-7"
}

variable "auto_delete_disk" {
  description = "Whether or not the nfs disk should be auto-deleted"
  type        = bool
  default     = false
}

variable "network_name" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  type        = string
  default     = "default"
}

variable "machine_type" {
  description = "Type of the VM instance to use"
  type        = string
  default     = "n2d-standard-2"
}

# network_project for shared vpc 

variable "labels" {
  description = "Labels to add to the NFS instance. List key, value pairs."
  type        = any
}
