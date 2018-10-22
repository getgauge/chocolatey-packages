$version = $args[0]
(Get-Content tools\chocolateyInstall.ps1.template).replace('{{version}}', $version) | Set-Content tools\chocolateyInstall.ps1;
if ($LastExitCode -ne 0) {
     throw "Failed to replace version in template"
}

choco pack --version=$version
if ($LastExitCode -ne 0) {
     throw "Choco pack failed"
}
