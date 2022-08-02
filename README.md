# Homebrew Tools

Refer to this [article](https://docs.brew.sh/Formula-Cookbook) to learn how to custom homebrew your organization tools.

#### How to Homebrew Tap

```
brew tap envoy/tools
```

### otsecret

> A tool used by the Infrastructure team to share sensitive data and secrets with Engineering or any other team. 

#### How to install?

```
export HOMEBREW_GITHUB_API_TOKEN=<use your personal PAT that has premissions to read PACKAGE> 
brew install otsecret
```
