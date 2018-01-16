#############
#
#	removeBloat_v1.2.ps1
#	Author: Rob Thompson
#
#	Description:	Removes unnecessary bloatware from a base Win10 install; includes normal and provisioned apps.
#
#	Notes:		-"XBoxCallableUI" may error and not be removed. I have not found a solution to this specific app
#			
#			-If you want to keep a specific app, simply comment out the line contianing the app in the array below. Doing this will not affect the functionality.
#				--This script by default has kept Alarms, Calculator, MSPaint, Photos, and Sticky notes.
#				--Most of the apps names are pretty self explanatory. If you aren't sure, check online.
#			
#			-The second loop in this script removes PROVISIONED apps as well; to use, uncomment the section by removing the <# in the front, and #> at the end.
#
#			-WDS ADMINISTRATORS:	Do _not_ run this script prior to capturing the image! WDS determines the entire Windows
#						installation as invalid without all of the Apps listed in this script, and will not
#						capture the image.
#
#############


$bloatWare = @(`
"*3dbuilder*", ` 
#"*alarms*", `
"*appconnector*", `
"*appinstaller*", `
"*bing*", `
"*bingfinance*", `
"*bingnews*", `
"*bingsports*", `
"*bingweather*", `
#"*calculator*", `
"*camera*", `
"*commsphone*", `
"*communicationsapps*", `
"*connectivitystore*", `
"*feedback*", `
"*getstarted*", `
"*holographic*", `
"*maps*", `
"*messaging*", `
#"*mspaint*", `
"*officehub*", `
"*oneconnect*", `
"*onenote*", `
"*people*", `
"*phone*", `
#"*photos*", `
"*skypeapp*", `
"*solitaire*", `
"*soundrecorder*", `
#"*sticky*", `
"*sway*", `
"*wallet*", `
"*windowsphone*", `
"*windowsstore*", `
"*xbox*", `
"*zune*", `
"*zunemusic*", `
"*zunevideo*")

for ($i=0; $i -lt $bloatware.length; $i++) {
	Get-AppxPackage -name $bloatware[$i] | Remove-AppxPackage
}

<#for ($j=0; $j -lt $bloatWare.length; $j++) {
    Get-AppxProvisionedPackage -Online | Where-Object PackageName -like $bloatWare[$j] | Remove-AppxProvisionedPackage -Online
}#>
