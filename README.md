# Homebrew Tools

Refer to this [article](https://docs.brew.sh/Formula-Cookbook) to learn how to custom homebrew your organization tools.

#### Homebrew Tap?

```
brew tap envoy/tools
```

#### Update all package definitions

```
brew update
```

#### List outdated local installed packages

```
brew outdated
```

#### Upgrade all formulas

```
brew upgrade
```

#### Upgrade a specific formula

```
brew upgrade formula-name

ex:
brew upgrade otsecret
```


#### Remove a formula

```
brew cleanup formula-name
brew remove --force formula-name
```

### Tools

* [otsecret](otsecret.md)
