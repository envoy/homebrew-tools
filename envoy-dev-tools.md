### Envoy Dev Tools

> A tool for setting up developer tools for Envoy 

#### Source repository

https://github.com/envoy/envoy-dev-tools/

> Readme: https://github.com/envoy/envoy-dev-tools/#readme

#### How to install?

> The installation needs your personal GitHub PAT token, since the repository is internal to Envoy. Homebrew download strategy needs the GitHub PAT to download the repository package from the internal release.

```
export HOMEBREW_GITHUB_API_TOKEN=<use your personal PAT that has permissions to read PACKAGE> 
brew tap envoy/tools
brew install envoy-dev-tools
```

#### Post Installation

After installation, you must run the tool to complete the setup:

```
envoy-dev-tools
```

The setup process will configure your environment for Envoy development. This may involve modifying configuration files in your home directory.

#### Requirements

- macOS (Intel or Apple Silicon)