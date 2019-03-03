import-module au

$pkgurl = 'https://api.bintray.com/packages/jfrog/jfrog-cli-go/jfrog-cli-windows-amd64'
$fileurl = 'https://dl.bintray.com/jfrog/jfrog-cli-go/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $pkg = Invoke-RestMethod -Uri "$pkgurl"
    write-debug "package: $pkg"
    $file = Invoke-RestMethod -Uri "$pkgurl/versions/$($pkg.latest_version)/files" `
        | foreach-object { if ($_.name -eq "jfrog.exe") { $_ } }
    write-debug "file: $file"

    @{
        URL64   = $fileurl + $file.path
        Checksum64 = $file.sha256
        Version = $pkg.latest_version
    }
}

update -ChecksumFor none -NoCheckUrl $true
