#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://dl.bintray.com/jfrog/jfrog-cli-go/1.34.1/jfrog-cli-windows-amd64/jfrog.exe'
  checksum64             = '78e0222fd7d3aa42d6f8b9602e1794a6a987217965fa47eb67edd1b9b744c43d'
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
