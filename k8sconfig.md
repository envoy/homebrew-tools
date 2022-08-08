### K8s Config

> A tool used by the Product App or Integrations team to do initial App configuration to deploy into Kubernetes Cluster 

#### Source repository

https://github.com/envoy/k8sconfig/

> Readme: https://github.com/envoy/k8sconfig/#readme

#### How to install?

> The installation needs your personal GitHub PAT token, since the repository is internal to Envoy. Homebrew download strategy needs the GitHub PAT to download the repository package from the internal release.

```
export HOMEBREW_GITHUB_API_TOKEN=<use your personal PAT that has premissions to read PACKAGE> 
brew install k8sconfig
```

#### Prerequisite

`k8sconfig` relies on the following tools

* `curl`
* `git`


#### Configure

The tool needs a yaml configuration as shown below

```
jira-user: your jira account email ID
jira-token: your jira account API key
```

Store the file as `.k8sconfig` in the home directory

#### Example configuration

```
gp@mbp ~ % echo "jira-user: abc" >> ~/.k8sconfig
gp@mbp ~ % echo "jira-token: abc-token" >> ~/.k8sconfig
gp@mbp ~ % cat ~/.k8sconfig
jira-user: abc
jira-token: abc-token
```

> Replace `abc` and `abc-token` with your jira account values