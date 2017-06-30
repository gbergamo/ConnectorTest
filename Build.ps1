$msbuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
$path = (Resolve-Path .\).Path + "\DataBaseConnection.sln /p:Configuration=""Release"" /p:DeployOnBuild=true /p:PublishProfile=""FolderProfile"" "
$build = $msbuild + " " + $path

Invoke-Expression $build

If ($LastExitCode -eq 0) {
Write-host "OK"
}


