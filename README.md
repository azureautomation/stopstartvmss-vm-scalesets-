Stop-Start-VMSS(VM Scalesets)
=============================

            

**DESCRIPTION** 


This PowerShell Workflow runbook connects to Azure using Managed Identity and Starts/Stops all VMScalesets (VMSS) in a resource group in-parallel. You could add a recurring schedule to this runbook to run it at a specific time.


**REQUIRED**

1. You have to create a managed identity for your automation account.
2. A **AzureResourceGroup **input parameter value that allows scoping VMSSs to a particular resource group. 
3. An **Action **to perform. Stop - to stop the VM ScaleSets; Start - to start the VM Scalesets.


**AUTHOR**

Chetan Kaur

**LAST EDIT**

30-08-2023

**RELEASE NOTES**

2023-08-30 : Updated runbook with Managed Identity authentication
 

 

        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
