$path = "" + $(get-location) + "\files\NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
Start-Process -FilePath $path -ArgumentList "/q /norestart" -Wait -Verb RunAs