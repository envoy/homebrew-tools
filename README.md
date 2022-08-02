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

#### Prerequisite

`otsecret` relies on One Password CLI to store and share sensitive secrets. You need to install One Password CLI before you can use the app.

* To install 1Password CLI (mac) - refer [here](https://1password.com/downloads/mac/)
* To get started with 1Password CLI - refer [here](https://developer.1password.com/docs/cli/get-started/)
* To add an account to 1Password CLI - refer [here](https://developer.1password.com/docs/cli/get-started/#sign-in-to-your-account)
* Configure 1Password CLI biometric unlock - refer [here](https://developer.1password.com/docs/cli/get-started/#turn-on-biometric-unlock)

#### Get help

```
otsecret -h
```

#### Configure

The tool needs a yaml configuration as shown below

```
vault: set the vault id where the secrets will be maintained and shared
sendgrid-api-key: set Sendgrid API Key to send emails
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
