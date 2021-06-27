$ResourceGroupName = Read-Host -Prompt 'Enter Resource Group Name'
$TemplateLocation = Read-Host -Prompt 'Enter Azure Template File Location'
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateLocation




