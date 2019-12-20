#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://dl.bintray.com/jfrog/jfrog-cli-go/1.32.3/jfrog-cli-windows-amd64/jfrog.exe'
  checksum64             = 'ceb83d46bd16d7a4e6f661d2b52f5cbe5f1518f892e0f598a401bfc5ceac4884'
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
