$jfrogDir = "$env:ProgramData\Jfrog"
if(Test-Path -Path "$jfrogDir\jfrog.exe" -ErrorAction SilentlyContinue)
{
    Remove-Item -Path $jfrogDir -Force -Recurse > $null
}
else
{
    Write-Warning ("Cannot locate jfrog.exe at $jFrogDir.")
}

$jfrogDir = $jfrogDir -replace '\\','\\' #this formats the path to work with -replace
$path     = "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$oldPath  = (Get-ItemProperty -Path $path -Name PATH).Path
if($oldPath | Select-String -Pattern 'jfrog')
{
    $newPath  = $oldPath -replace ";$jfrogDir\\",";"
    Set-ItemProperty -Path $path -Name PATH –Value $newPath

    &"C:\ProgramData\Chocolatey\bin\RefreshEnv.cmd"
}
else
{
    Write-Warning ('Cannot locate jfrog in PATH variable.')   
}