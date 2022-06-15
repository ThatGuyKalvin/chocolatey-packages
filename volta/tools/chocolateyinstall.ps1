$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/volta-cli/volta/releases/download/v1.0.7/volta-1.0.7-windows-x86_64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Volta'

  checksum      = '5DF252F4EC9B83958C6541EA8383F361A64384CAD1608F5DF0EC4858548B3A72'
  checksumType  = 'sha256'

  silentArgs    = "/qn /L*vx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs