workflow Stop-Start-VMSS
{
    Param
    (   
        [Parameter(Mandatory=$true)]
        [String]
        $SubscriptionId,
        [Parameter(Mandatory=$true)]
        [String]
        $AzureResourceGroup,
	[Parameter(Mandatory=$true)][ValidateSet("Start","Stop")]
        [String]
	$Action
    )

    # Ensures you do not inherit an AzContext in your runbook
        Disable-AzContextAutosave -Scope Process

        try
        {
            "Logging in to Azure..."           

    # Connect to Azure with system-assigned managed identity. 
    # Please enable appropriate RBAC permissions to the system identity of this automation account. Otherwise, the runbook may fail...
            $AzureContext = (Connect-AzAccount -Identity).context

    # set and store context
            $AzureContext = Set-AzContext -Subscription $SubscriptionId
        }
        catch {
            Write-Error -Message $_.Exception
            throw $_.Exception
        }

    if($Action -eq "Stop")
    {
		Write-Output "Stopping VMSS in '$($AzureResourceGroup)' resource group";
        foreach -parallel ($name in (Get-AzVmss -ResourceGroupName $AzureResourceGroup).Name)
        {
            Stop-AzVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Force -Verbose
        }
    }
    else
    {
		Write-Output "Starting VMSS in '$($AzureResourceGroup)' resource group";
        foreach -parallel ($name in (Get-AzVmss -ResourceGroupName $AzureResourceGroup).Name)
        {
            Start-AzVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Verbose
        }
    }
}
