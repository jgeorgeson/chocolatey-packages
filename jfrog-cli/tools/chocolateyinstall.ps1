#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'jfrog-cli'
  fileType               = 'EXE'
  url64bit               = 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.21.1%2Fjfrog-cli-windows-amd64%2Fjfrog.exe'
  checksum64             = '33DB1F822AD1832C539ADA7796BDE663D9361C06AA225E0849641530E3BB7D8D1A79DA051B7F77F17DBBBA89DF9B7FF3CCEC15EA3DCE823FC74E768E9EBF7A9B'
  checksumType64         = 'sha512'
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
