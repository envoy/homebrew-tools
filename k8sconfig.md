### K8s Config

> A tool used by the Product App or Integrations team to do initial App configuration to deploy into Kubernetes Cluster 

#### Source repository

https://github.com/envoy/k8sconfig/

> Readme: https://github.com/envoy/k8sconfig/#readme

#### How to install?

> The installation needs your personal GitHub PAT token, since the repository is internal to Envoy. Homebrew download strategy needs the GitHub PAT to download the repository package from the internal release.

```
export HOMEBREW_GITHUB_API_TOKEN=<use your personal PAT that has repo and workflow permissions> 
brew install k8sconfig
```

#### Prerequisite

`k8sconfig` relies on the following tools

* `curl`
* `git`


#### Configure

The tool needs a yaml configuration as shown below

> Create your JIRA api token here https://id.atlassian.com/manage-profile/security/api-tokens

```
jira-user: your jira account email ID
jira-token: your jira account API key
github-token: your Github PAT token (ensure it has permissions to "repo and workflow")
```

Store the file as `.k8sconfig` in the home directory

#### Example configuration

```
gp@mbp ~ % echo "jira-user: abc" >> ~/.k8sconfig
gp@mbp ~ % echo "jira-token: abc-token" >> ~/.k8sconfig
gp@mbp ~ % echo "github-token: your_github_token" >> ~/.k8sconfig
gp@mbp ~ % cat ~/.k8sconfig
jira-user: abc
jira-token: abc-token
github-token: your_github_token
```

> Replace `abc` and `abc-token` with your jira account values

#### Running k8sconfig
In your app directory run:
```bash
k8sconfig
```
