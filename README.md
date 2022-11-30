# Theos

Master Terraform project to rule them all. 

Hosted and managed from Terraform Cloud.

Manages `xyz.tfstate` for all projects developed under the Naiama domain. Each `xyz` is a built into a separate module. Theos also creates prerequisites for each project, including backends resources, service accounts, and enabling APIs. Each project is then responsible for creating its needed resources.

Currently managed projects:
* Phanes, a simple GCP project with AWS backend
* Thalassa, experiment to push secrets to a Terraform Cloud workspace
* Zeus, a K8S for managing other K8S clusters within Naiama
* Ladon, the GCP backbone config project, w/ Azure Backend

TODO: Implement a secret manager, from Azure probably.
TODO: `dev`, `test`, `stage` branches, totaling 4 env so mess in production is less likely.
