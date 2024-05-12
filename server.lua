local QBcore = nil

TriggerEvent('qb-core:GetObject', function(obj) QBcore = obj end)

local config = {}

Citizen.CreateThread(function()
    while QBcore == nil do
        Citizen.Wait(10)
    end
    TriggerEvent('qb-core:GetConfig', function(cfg) config = cfg end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        print("^5[Lazy_TAX]^7 System started")
    end
end)

local function applyTax()
    for _, player in ipairs(QBcore.Functions.GetPlayers()) do
        local xPlayer = QBcore.Functions.GetPlayer(player)
        local accountBalance = xPlayer.PlayerData.money.bank
        local taxPercentage = config.taxPercentage or 1 -- Default is 1%
        local taxAmount = accountBalance * (taxPercentage / 100)
        xPlayer.Functions.RemoveMoney('bank', taxAmount)
        local notificationType = config.notificationType or 'qbcore'
        if notificationType == 'qbcore' then
            TriggerClientEvent('qb-core:client:Notify', player, 'You have been charged tax: $' .. taxAmount) -- Triggering QBcore notification
        elseif notificationType == 'chat' then
            TriggerClientEvent('chatMessage', player, '', {255, 0, 0}, string.format(config.taxNotification, taxAmount)) -- Triggering chat notification
        end
    end
end

-- Timer for applying tax
Citizen.CreateThread(function()
    while true do
        Citizen.Wait((config.taxInterval or 10) * 3600000) -- Milliseconds
        applyTax()
    end
end)

