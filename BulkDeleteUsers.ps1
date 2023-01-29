# Import the Azure AD module
Import-Module AzureAD

# Connect to Azure AD
Connect-AzureAD

# Get the list of users from Azure AD
$Users = Get-AzureADUser | Out-GridView -Title "Select users to delete" -PassThru

# Loop through each selected user
foreach ($User in $Users) {
    # Delete the user from Azure AD
    Remove-AzureADUser -ObjectId $User.ObjectId
}

# Disconnect from Azure AD
Disconnect-AzureAD