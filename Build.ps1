#$msbuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
$msbuild = (Resolve-Path .\).Path + "\Files\msbuild.exe"
$path = (Resolve-Path .\).Path + "\DataBaseConnection.sln /p:Configuration=""Release"" /p:DeployOnBuild=true /p:PublishProfile=""FolderProfile"" "
$build = $msbuild + " " + $path

Invoke-Expression $build 

If ($LastExitCode -eq 0) {
	Remove-Item C:\Inetpub\wwwroot\* -recurse

	#Get-ChildItem -Path C:\Inetpub\wwwroot -Include *.* -File -Recurse | foreach { $_.Delete()}
	
	$releaseFolder = (Resolve-Path .\).Path + "\DataBaseConnection\bin\Release\PublishOutput\*"
	
	Move-Item $releaseFolder "C:\Inetpub\wwwroot"
}


