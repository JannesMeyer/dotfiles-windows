function Get-Admin {
	$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
	$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

	return $principal.IsInRole($adminRole)
}

# Check the admin status and set a global variable for the text color
if (Get-Admin) {
	$promptColor = "Red"
} else {
	$promptColor = "Green"
}

function Prompt {
	# Change the window title
	$host.UI.RawUI.WindowTitle = Split-Path -Leaf $pwd
	
	# Replace user directory with ~
	$beautifiedPath = $pwd.Path.Replace($HOME, '~')
	# Replace backslash with forward slash
	$beautifiedPath = $beautifiedPath.Replace("\", "/")
	
	# Print the current location
	Write-Host $beautifiedPath -NoNewline -ForegroundColor $promptColor
	' > '
}

# su
function Elevate-PowerShell {
	$p = New-Object System.Diagnostics.ProcessStartInfo
	$p.FileName = 'powershell.exe'
	$p.Arguments = "-NoLogo -NoExit -Command Set-Location -LiteralPath '$pwd'"
	$p.Verb = 'runas'
	[System.Diagnostics.Process]::Start($p) | Out-Null
}
Set-Alias su Elevate-PowerShell

# up
function Get-Uptime {
	$lastBoot = [System.Management.ManagementDateTimeconverter]::ToDateTime((Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime)
	#$lastBoot = ([WMI]"").ConverttoDateTime((Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime)
	$uptime = (Get-Date) - $lastBoot
	Write-Host "System has been up for" $uptime.Days "Days" $uptime.Hours "Hrs" $uptime.Minutes "Min"
}
Set-Alias up Get-Uptime

# subl
function Open-SublimeText {
	& "${Env:ProgramW6432}\Sublime Text 3\subl.exe" $args
}
Set-Alias subl Open-SublimeText

# open
Set-Alias open Invoke-Item

# which
Set-Alias which Get-Command

# ls | Format-List *