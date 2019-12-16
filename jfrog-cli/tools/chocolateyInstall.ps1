#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://dl.bintray.com/jfrog/jfrog-cli-go/1.32.2/jfrog-cli-windows-amd64/jfrog.exe'
  checksum64             = 'c0eed518e1812297ed0bf8205a74af7c1b4b9e1226d91b4e8dbb9b9c89a5409b'
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
