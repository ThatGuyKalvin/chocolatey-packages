$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/volta-cli/volta/releases/download/v1.0.8/volta-1.0.8-windows-x86_64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Volta'

  checksum      = 'c975ecefb9a07b48ce5fa38fec9f3bc5c77c0b591570984021f41e49097e7de2'
  checksumType  = 'sha256'

  silentArgs    = "/qn /L*vx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs