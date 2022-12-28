### Envoy Terraform Applier

> A tool used by the Infrastructure team to do initial AWS and Terraform configuration to plan and apply Terraform resources.

#### Source repository

https://github.com/envoy/eta/

> Readme: https://github.com/envoy/eta/#readme

#### How to install?

> The installation needs your personal GitHub PAT token, since the repository is internal to Envoy. Homebrew download strategy needs the GitHub PAT to download the repository package from the internal release.

```
export HOMEBREW_GITHUB_API_TOKEN=<use your personal PAT that has premissions to read PACKAGE> 
brew install eta
```
