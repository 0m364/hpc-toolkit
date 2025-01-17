/**
 * Copyright 2022 Google LLC
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

locals {
  runner_install_htcondor = {
    "type"        = "ansible-local"
    "source"      = "${path.module}/files/install-htcondor.yaml"
    "destination" = "install-htcondor.yaml"
    "args" = join(" ", [
      "-e enable_docker=${var.enable_docker}",
      "-e condor_version=${var.condor_version}",
    ])
  }

  runner_install_autoscaler_deps = {
    "type"        = "ansible-local"
    "content"     = file("${path.module}/files/install-htcondor-autoscaler-deps.yml")
    "destination" = "install-htcondor-autoscaler-deps.yml"
  }

  runner_install_autoscaler = {
    "type"        = "data"
    "content"     = file("${path.module}/files/autoscaler.py")
    "destination" = "/usr/local/htcondor/bin/autoscaler.py"
  }

  required_apis = [
    "compute.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}
