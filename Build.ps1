#$msbuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
#$msbuild = (Resolve-Path .\).Path + "\Files\msbuild.exe"

$msbuild = 'C:\ConnectorTest\Files\msbuild.exe'
$path = 'C:\ConnectorTest\DataBaseConnection.sln /p:Configuration="Release" /p:DeployOnBuild=true /p:PublishProfile="FolderProfile" '
$build = $msbuild + " " + $path

Write-host (Resolve-Path .\).Path
Invoke-Expression $build 

If ($LastExitCode -eq 0) {
	Remove-Item C:\Inetpub\wwwroot\* -recurse	
	$releaseFolder = 'C:\ConnectorTest\DataBaseConnection\bin\Release\PublishOutput\*'
	Move-Item $releaseFolder 'C:\Inetpub\wwwroot'
}


