workflow Stop-Start-VMSS
{
    Param
    (   
        [Parameter(Mandatory=$true)]
        [String]
        $AzureResourceGroup,
	[Parameter(Mandatory=$true)][ValidateSet("Start","Stop")]
        [String]
	$Action
    )
    
    $credential = Get-AutomationPSCredential -Name 'AzureCredential'
    Login-AzureRmAccount -Credential $credential
    $selectedsubscription = Get-AutomationVariable -Name 'AzureSubscriptionId'

    Select-AzureRmSubscription -SubscriptionId $selectedsubscription

    if($Action -eq "Stop")
    {
		Write-Output "Stopping VMSS in '$($AzureResourceGroup)' resource group";
        foreach -parallel ($name in (Get-AzureRmVmss -ResourceGroupName $AzureResourceGroup).Name)
        {
            Stop-AzureRmVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Force -Verbose
        }
    }
    else
    {
		Write-Output "Starting VMSS in '$($AzureResourceGroup)' resource group";
        foreach -parallel ($name in (Get-AzureRmVmss -ResourceGroupName $AzureResourceGroup).Name)
        {
            Start-AzureRmVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Verbose
        }
    }
}