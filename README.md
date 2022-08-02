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

#### Get help

```
otsecret -h
```

#### Configure

The tool needs a yaml configuration as shown below

```
vault: set the vault id where the secrets will be maintained
sendgrid-api-key: set the key to send the emails
```

Store the file as `.otsecret` in the home directory

#### Example configuration

```
gp@mbp ~ % echo "vault: abc" >> ~/.otsecret
gp@mbp ~ % echo "sendgrid-api-key: abc" >> ~/.otsecret
gp@mbp ~ % cat ~/.otsecret
vault: abc
sendgrid-api-key: abc
```

> Replace `abc` with the actual values
