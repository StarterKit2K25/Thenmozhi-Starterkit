#Assigining the parameters for the environment
param(
[string] $rg,
[string] $functionAppName
)

# This command cleans the build output of the specified project using the Release configuration.
# Generates full paths in the output, and suppresses the summary in the console logger
dotnet clean src/azure.functionapp --configuration Release /property:GenerateFullPaths=true /consoleloggerparameters:NoSummary

#Package the function app including the functions into a folder for deployment
dotnet publish ./src/azure.functionapp --configuration Release --output ./publishFunctions

#Compressing the publish folder into a zip file
Compress-Archive -Path ./publishFunctions/* -DestinationPath ./funcapp.zip -Update

# deploying the zip to the functionapp
az functionapp deployment source config-zip --resource-group $rg --name $functionAppName --src ./funcapp.zip