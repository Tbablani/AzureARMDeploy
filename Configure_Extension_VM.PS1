$ResourceGroupName = Read-Host -Prompt 'Enter Resource Group Name'
$scalesetname = Read-Host -Prompt 'Scale Set Name Which was created Earlier'
$vnetname = Read-Host -Prompt 'Enter VNet Name Created Earlier'

$customConfig = @{
  "fileUris" = (,"https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate-iis.ps1");
  "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File automate-iis.ps1"
}


# Get information about the scale set
$vmss = Get-AzVmss `
          -ResourceGroupName $ResourceGroupName `
          -VMScaleSetName $scalesetname

# Add the Custom Script Extension to install IIS and configure basic website
$vmss = Add-AzVmssExtension `
  -VirtualMachineScaleSet $vmss `
  -Name "customScript" `
  -Publisher "Microsoft.Compute" `
  -Type "CustomScriptExtension" `
  -TypeHandlerVersion 1.9 `
  -Setting $customConfig

# Update the scale set and apply the Custom Script Extension to the VM instances
Update-AzVmss `
  -ResourceGroupName $ResourceGroupName `
  -Name $scalesetname `
  -VirtualMachineScaleSet $vmss


