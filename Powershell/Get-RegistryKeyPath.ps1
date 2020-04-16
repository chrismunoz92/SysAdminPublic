<#   
.SYNOPSIS   
Script that returns the Registy Key Path for the Software Name you pass as a parameter.
     
.PARAMETER Software
The Software whose Registry Key Path you need.

.NOTES   
Name: Get-RegistyKeyPath.ps1
Author: Christopher Munoz
DateCreated: 04/16/2020

.EXAMPLE
	.\Get-RegistryKey.ps1 -Software Symantec
#>


param(
    [string]$Software
)

$Software = "Symantec"

$PATHS = @("HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall",
               "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")


ForEach ($path in $PATHS) {
    $installed = Get-ChildItem -Path $path |
        ForEach { Get-ItemProperty $_.PSPath } |
        Where-Object { $_.DisplayName -match $Software } |
        Select-Object -Property PSPath

    ForEach ($app in $installed) {
        $Key = "$($app.PSPath)"
    }
}

$Key = $Key.Split("::")
$Key
