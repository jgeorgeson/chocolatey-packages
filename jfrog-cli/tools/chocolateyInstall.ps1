#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://dl.bintray.com/jfrog/jfrog-cli-go/1.22.1/jfrog-cli-windows-amd64/jfrog.exe'
  checksum64             = 'f3b7be12d2abd751b2d389d7ce5ab1691d3847d0b79eb5e1f83606b5ebea34d7'
  checksumType64         = 'sha256'
  silentArgs             = ''
  validExitCodes         = @(0)
  softwareName           = 'jfrog-cli'
}

Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$toolsDir\jfrog.exe" `
    -Url64 $packageArgs.url64bit `
    -Checksum64 $packageArgs.checksum64 `
    -ChecksumType64 $packageArgs.checksumType64 `
    -ForceDownload
