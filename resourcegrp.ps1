$ErrorActionPreference = "Stop"
$ResourceGroupName = Read-Host -Prompt 'Enter Resource Group Name'
$ResourceGroupLocation = Read-Host -Prompt 'Enter Location'
Connect-AzAccount
New-AzResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation