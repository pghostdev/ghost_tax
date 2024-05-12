local QBcore = nil

TriggerEvent('qb-core:GetObject', function(obj) QBcore = obj end)

RegisterNetEvent('qbcore:client:ShowTaxNotification')
AddEventHandler('qbcore:client:ShowTaxNotification', function(taxAmount)
    QBcore.Functions.Notify('' .. taxAmount .. '$ taxes have been deducted from your account.')
end)

RegisterNetEvent('qbcore:client:ReceiveConfigFromServer')
AddEventHandler('qbcore:client:ReceiveConfigFromServer', function(receivedConfig)
    config = receivedConfig
end)
