#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.21.1%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '33DB1F822AD1832C539ADA7796BDE663D9361C06AA225E0849641530E3BB7D8D1A79DA051B7F77F17DBBBA89DF9B7FF3CCEC15EA3DCE823FC74E768E9EBF7A9B' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
