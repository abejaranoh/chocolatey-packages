﻿$packageName = 'midori-browser'
#$packageName = '{{PackageName}}'
$installerType = 'EXE'
$silentArgs = '/S'
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try {

	if ($is64bit) {
		$unpath = "${Env:ProgramFiles(x86)}\Midori\uninst.exe"
	} else {
		$unpath = "$Env:ProgramFiles\Midori\uninst.exe"
	}
  
	Uninstall-ChocolateyPackage $packageName $installerType $silentArgs $unpath -validExitCodes $validExitCodes
    
	Write-ChocolateySuccess $packageName
	
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw 
}
