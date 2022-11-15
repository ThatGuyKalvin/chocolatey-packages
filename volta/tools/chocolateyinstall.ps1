$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/volta-cli/volta/releases/download/v1.1.0/volta-1.1.0-windows-x86_64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Volta'

  checksum      = 'f1ce50bc3ef25eb619ee435dfc3739571ed6b8d546239d7a2f5b0edf966a5574'
  checksumType  = 'sha256'

  silentArgs    = "/qn /L*vx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs