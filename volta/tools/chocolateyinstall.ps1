$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/volta-cli/volta/releases/download/v2.0.2/volta-2.0.2-windows-x86_64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Volta'

  checksum      = '104BF5518177990E4C4DE78097CAA747EB8F64E1149BFDFA9106F4A3D3E5F10B'
  checksumType  = 'sha256'

  silentArgs    = "/qn /L*vx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs