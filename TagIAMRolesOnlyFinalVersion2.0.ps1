# Provide the path to your CSV file
$CSV_FILE = "C:\Users\fnjoh\AWS CSV files And Scripts\IAMNottagged2024Folder\IAMRoleUntaggedSamplequotesMode.txt"

# Read the CSV file and add tags to IAM roles
Get-Content $CSV_FILE | ForEach-Object {
    # Split CSV columns into variables
    $roleName, $tags = $_ -split ','

       # Print the tags for debugging
    Write-Host "Role: $roleName, Tags: $tags"

    # Add tags to IAM role
    aws iam tag-role --role-name $roleName  --tags Key=zotec:team,Value="Information Security" --profile Prod
}