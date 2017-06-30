$msbuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
$path = (Resolve-Path .\).Path + "\DataBaseConnection.sln /p:Configuration=""Release"""
$build = $msbuild + " " + $path
Write-host $build
#$msbuild DataBaseConnection.sln /t:"DataBaseConnection" /p:Configuration="Release" 
Invoke-Expression $build
