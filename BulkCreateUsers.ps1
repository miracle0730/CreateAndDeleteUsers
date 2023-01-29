# Import the Azure AD module
Import-Module AzureAD

# Connect to Azure AD
Connect-AzureAD

# Get the list of users from the CSV file
$Users = Import-Csv -Path ".\Users.csv"

# Loop through each user in the CSV file
foreach ($User in $Users) {
    # Create the user in Azure AD
    New-AzureADUser -DisplayName $User.DisplayName `
                    -UserPrincipalName $User.UserPrincipalName `
                    -MailNickname $User.MailNickname `
                    -AccountEnabled $True `
                    -PasswordProfile @{Password=$User.Password} `
                    -UsageLocation $User.UsageLocation
}

# Disconnect from Azure AD
Disconnect-AzureAD
