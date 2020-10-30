###Run this if not install Az module##############################################################################################################################################
###Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
##################################################################################################################################################################################
$Subscription = "<SubscriptionID>"
$TenantID = "<TenantID>"
$csv = Import-Csv .\ResourceGroups.csv
$location = "southeastasia"
az login --allow-no-subscriptions -t $TenantID
az account set -s $Subscription
foreach ($line in $csv) {
$RG = $line.Name
Write-Host "Creating Resource Groups " -NoNewline -ForegroundColor Red
Write-Host $RG -NoNewline -ForegroundColor Red
Write-Host "..." -ForegroundColor Red
az group create -l $location -n $RG
}
Write-Host "Finish Create all RG!" -ForegroundColor Blue
