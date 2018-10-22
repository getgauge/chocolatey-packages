$version = $args[0]
(Get-Content tools\chocolateyInstall.ps1.template).replace('{{version}}', $version) | Set-Content tools\chocolateyInstall.ps1;
choco pack --version=$version
