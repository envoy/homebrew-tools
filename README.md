# Homebrew Tools

Refer to this [article](https://docs.brew.sh/Formula-Cookbook) to learn how to custom homebrew your organization tools.

#### Homebrew Tap

> Command to tap all the formulas built at Envoy

```
brew tap envoy/tools
```

#### Brew commands

| | Command |
| --- | --- |
| Update all package definitions | `brew update` |
| List outdate local installed packages | `brew outdated` |
| Upgrade all formulas | `brew upgrade` |
| Upgrade a specific formula | `brew upgrade <formula-name>` |
| Remove a formula | `brew cleanup <formula-name>` and then `brew remove --force <formula-name>` |

### Tools

* [otsecret](otsecret.md)
* [k8sconfig](k8sconfig.md)
* [eta](eta.md)
