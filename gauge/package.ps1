gc ..\version | % {
    Write-Host "Templating Chocolatey package for Gauge version $_"

    $packageDir = "..\..\deploy"
    $package = "gauge-$_-windows.x86.zip"
    $package64 = "gauge-$_-windows.x86_64.zip"

    $checksum = (Get-FileHash -Path (Join-Path $packageDir $package) -Algorithm SHA256).Hash.ToLower()
    $checksum64 = (Get-FileHash -Path (Join-Path $packageDir $package64) -Algorithm SHA256).Hash.ToLower()

    (Get-Content tools\chocolateyInstall.ps1.template) `
        -replace '{{url}}', "https://github.com/getgauge/gauge/releases/download/v$_/$package" `
        -replace '{{checksum}}', "$checksum" `
        -replace '{{url64}}', "https://github.com/getgauge/gauge/releases/download/v$_/$package64" `
        -replace '{{checksum64}}', "$checksum64" `
            | Set-Content tools\chocolateyInstall.ps1;

    Write-Host "Templating done. Packaging..."
    choco pack --version=$_
    if ($LastExitCode -ne 0) {
        throw "Choco pack failed"
    }
}
