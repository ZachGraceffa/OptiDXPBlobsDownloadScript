param (
    [Parameter(Mandatory)][string]$ProjectId,
    [Parameter(Mandatory)][string]$ClientKey,
	[Parameter(Mandatory)][string]$ClientSecret
 )
 
Write-Output "Setting execution policy to 'Bypass'"
Set-ExecutionPolicy Bypass

Write-Output "Setting PSRepository name to 'PSGallery' and InstallationPolicy to 'Trusted'"
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

Write-Output "Installing EpiCloud module for the current user by force"
Install-Module -Name EpiCloud -Scope CurrentUser -Force

Write-Output "Connecting to EpiCloud via input arguments"
Connect-EpiCloud -ClientKey $ClientKey -ClientSecret $ClientSecret -ProjectId $ProjectId

Write-Output "Getting integration storage container"
Get-EpiStorageContainer -Environment "Integration"

Write-Output "Getting SasLink for Integration"
$link = Get-EpiStorageContainerSasLink -Environment "Integration" -StorageContainer "mysitemedia" -RetentionHours 1 | Format-Table sasLink -AutoSize -Wrap

Write-Output "Link is set to"
Write-Output $link

Write-Output "Getting link contents"
azcopy copy $link . --recursive
