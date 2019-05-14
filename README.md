## Create a new chocolatey package

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

- Install Chocolatey
- Create a new folder with the same name as the chocolatey package you intend to create
- Follow the same structure as regular chocoately packages inside that folder (see gauge for example or follow [this]( https://github.com/chocolatey/choco/wiki)) 
- Once you have created the scripts test them by packing the chocolatey package using "cpack"
- Once install and uninstall are tested - Commit the scripts here and upload your package to [Chocolatey](http://chocolatey.org)
- Edit this README file to add details of your chocolatey package

## Building package

- ensure Chocolatey is installed.
- `$env:version = <version>`
- `choco pack --version=<version>`
- `choco push "gauge.<version>.nupkg" -k="<api-key>"`

## Current packages created from this repository
### [Gauge](http://getgauge.io/)
To install Gauge via Chocolatey just run 

```
choco install gauge
```
