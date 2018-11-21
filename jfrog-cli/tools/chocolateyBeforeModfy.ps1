$jfrogDir = "$env:ProgramData\Jfrog"
if(Test-Path -Path "$jfrogDir" -ErrorAction SilentlyContinue)
{
    Write-Warning ("Removing legacy directory '$jFrogDir'.")
    Remove-Item -Path $jfrogDir -Force -Recurse > $null
}

$jfrogDir = $jfrogDir -replace '\\','\\' #this formats the path to work with -replace
$path     = "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$oldPath  = (Get-ItemProperty -Path $path -Name PATH).Path
if($oldPath | Select-String -Pattern 'jfrog')
{
    Write-Warning ("Removing legacy PATH entry '$jFrogDir'.")
    $newPath  = $oldPath -replace ";$jfrogDir\\",";"
    Set-ItemProperty -Path $path -Name PATH –Value $newPath

    &"C:\ProgramData\Chocolatey\bin\RefreshEnv.cmd"
}