#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://dl.bintray.com/jfrog/jfrog-cli-go/1.38.4/jfrog-cli-windows-amd64/jfrog.exe'
  checksum64             = '476c18e8f7dd1109a50f19a4ce635fc12b2edc1a9ad09687034ddff8a5e9f6a1'
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
