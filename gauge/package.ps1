gc ..\version | % {
    (Get-Content tools\chocolateyInstall.ps1.template).replace('{{version}}', $_) | Set-Content tools\chocolateyInstall.ps1;
  
    choco pack --version=$_
    if ($LastExitCode -ne 0) {
        throw "Choco pack failed"
    }
}
