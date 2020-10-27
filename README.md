Stop-Start-VMSS(VM Scalesets)
=============================

            

DESCRIPTION


This PowerShell Workflow runbook connects to Azure using an Automation Run As account and Starts/Stops all VMScalesets (VMSS) in a resource group in-parallel. You could add a recurring schedule to this runbook to run it at a specific time.


REQUIRED


1. A **AzureResourceGroup **input parameter value that allows scoping VMSSs to a particular resource group. 


2. An **Action **to perform. Stop - to stop the VM ScaleSets; Start - to start the VM Scalesets


NOTES:


1. **SubscriptionId **- Is added as an variable under Shared Resources at the Automation Account level.


2. **AzureCredential **- Is added as an credential under Shared Resources at the Automation Account level.


 


 

 

        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
