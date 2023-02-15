resource "github_repository_file" "file" {
  count = length(var.files)
  repository          = "devops-hometasks"
  branch              = "main"
  file                = "13-terraform/${element(var.files, count.index)}"
  content             = file("/vagrant/terraform/${element(var.files, count.index)}")
  commit_message      = "Managed by Terraform"
  commit_author       = "EygeneDruzhynin"
  commit_email        = "eu.druzhynin@gmail.com"
  overwrite_on_create = true
}