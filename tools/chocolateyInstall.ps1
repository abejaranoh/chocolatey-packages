$packageName = 'midori-browser'
#﻿$packageName = '{{PackageName}}'
$installerType = 'EXE'
$url = 'https://github.com/goastian/midori-desktop/releases/download/v11.2.2/midori-11.2.2.win64.installer.exe'
#$url = '{{DownloadUrl}}'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try {

	choco install $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes
 	#Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes
	
	Write-Output $packageName
 	#Write-ChocolateySuccess $packageName
	
} catch {
	#Write-ChocolateyFailure $packageName $($_.Exception.Message)
 	Write-Output $packageName $($_.Exception.Message)
	throw 
}
