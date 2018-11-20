import-module au

$releases = 'https://github.com/jfrog/jfrog-cli-go/releases/latest'
$url = 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path='

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $latest = Invoke-WebRequest -Uri $releases -headers @{"accept"="application/json"} `
        | ConvertFrom-Json

    @{
        URL64   = $url + $latest.tag_name + '%2Fjfrog-cli-windows-amd64%2Fjfrog.exe'
        ChecksumType64 = 'sha512'
        Version = $latest.tag_name
    }
}

update -ChecksumFor 64
