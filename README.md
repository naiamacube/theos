# Theos

Master Terraform project to rule them all. 

Hosted and managed from Terraform Cloud.

Manages `xyz.tfstate` for all projects developed under the Naiama domain. Each `xyz` is a built into a separate module. Theos also creates prerequisites for each project, including backends resources, service accounts, and enabling APIs. Each project is then responsible for creating its needed resources.

Currently managed projects:
* Phanes, a simple GCP project with AWS backend
* Thalassa, experiment to push secrets to a Terraform Cloud workspace
* Zeus, a Kubeflow deployment to GCP
<> (* Peristrofi, an implementation using a rotational KMS)
