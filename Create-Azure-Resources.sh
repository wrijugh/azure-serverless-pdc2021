rg="az-serverless-pdc2021"
loc="eastus"

az group create -n $rg -l $loc 

#---------------------Storage Account
storesku="Standard_LRS"
storageaccountname="wgpdc2021"

az storage account create -n $storageaccountname -g $rg --sku $storesku

#--------------Function
funcappname="pdcfunc"

az functionapp create -n $funcappname -g $rg -s $storageaccountname \
    --consumption-plan-location $loc \
    --functions-version=3 --os-type=Linux \
    --runtime=dotnet --disable-app-insights=true

#---------------CosmosDB
cosmosdb="cosmosdbpdc2021"
az cosmosdb create -n 