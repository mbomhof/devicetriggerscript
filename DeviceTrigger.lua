function DeviceOnOff(device,action)

if otherdevices[device] == action then
    print(tostring(device) .." staat al ".. tostring(action))
    else
        commandArray[device] = action
        print(tostring(device).." " ..tostring(action).. " gezet")
    end

end

commandArray = {}

for deviceName,deviceValue in pairs(devicechanged) do
    if (deviceName=='Donker t/m 00:30') then
        if deviceValue == "On" then
            print("*** Het is donker ***")
            if (otherdevices["Persoon1 Thuis"] == "On" or otherdevices["Persoon2 Thuis"] == "On") then
                print("*** Er is iemand thuis, lampen aan ***")
                DeviceOnOff("Lampen naast TV", "On")
                DeviceOnOff("Lampen achter", "On")
                DeviceOnOff("Garderobe", "On")
                DeviceOnOff("Kast Keuken", "On")
                DeviceOnOff("Keukenkastje", "On")
                DeviceOnOff("Kerstboom", "On")
                if (os.date("%H%M") <= "2330" and os.date("%H%M") >= "0300") then
                    DeviceOnOff("Tuin", "On")
                end
            else
                print("*** Niets doen, er is niemand thuis ***")
            end
        end
    end
    if (deviceName=='Persoon1 Thuis') then
        if deviceValue == "On" then
            print("*** Persoon1 is home ***")
            if (otherdevices["Persoon2 Thuis"] == "On") then
                print("*** Niets doen, Persoon2 is al thuis ***")
            else
                if (otherdevices["Donker t/m 00:30"] == "On") then
                    -- Als het donker is en Persoon1 is thuis moet dit gebeuren
                    print("*** Het is donker, lampen aan ***")
                    DeviceOnOff("Lampen naast TV", "On")
                    DeviceOnOff("Lampen achter", "On")
                    DeviceOnOff("Garderobe", "On")
                    DeviceOnOff("Kast Keuken", "On")
                    DeviceOnOff("Keukenkastje", "On")
                    DeviceOnOff("Kerstboom", "On")
                    if (os.date("%H%M") <= "2330" and os.date("%H%M") >= "0300") then
                        DeviceOnOff("Tuin", "On")
                    end
                    -- Einde
                else
                    print("*** Niets doen, het is nog niet donker ***")
                end
            end
        end
        if deviceValue == "Off" then
            print("*** Persoon1 has left the premises ***")
            if (otherdevices["Persoon2 Thuis"] == "Off") then
                -- Als Persoon1 het huis verlaat en Persoon2 is ook niet thuis dan moet dit gebeuren
                print("*** Persoon2 is niet thuis, lampen uit ***")
                DeviceOnOff("Garderobe", "Off")
                DeviceOnOff("Kast Keuken", "Off")
                DeviceOnOff("Keukentafel", "Off")
                DeviceOnOff("Keukenkastje", "Off")
                DeviceOnOff("Lampen achter", "Off")
                DeviceOnOff("Woonkamer", "Off")
                DeviceOnOff("Tuin", "Off")
                DeviceOnOff("Kerstboom", "Off")
                if (otherdevices["Donker t/m 00:30"] == "Off") then
                    DeviceOnOff("Lampen naast TV", "Off")
                end
                if (otherdevices["Donker t/m 00:30"] == "On") then
                    DeviceOnOff("Lampen naast TV", "On")
                end
                -- Einde
            else
                print("*** Niets doen, Persoon2 is nog thuis ***")
            end
        end
    end
    if (deviceName=='Persoon2 Thuis') then
        if deviceValue == "On" then
            print("*** Persoon2 is home ***")
            if (otherdevices["Persoon1 Thuis"] == "On") then
                print("*** Niets doen, Persoon1 is al thuis ***")
            else
                if (otherdevices["Donker t/m 00:30"] == "On") then
                    -- Als het donker is en Persoon2 is thuis moet dit gebeuren
                    print("*** Het is donker, lampen aan ***")
                    DeviceOnOff("Lampen naast TV", "On")
                    DeviceOnOff("Lampen achter", "On")
                    DeviceOnOff("Garderobe", "On")
                    DeviceOnOff("Kast Keuken", "On")
                    DeviceOnOff("Keukenkastje", "On")
                    DeviceOnOff("Kerstboom", "On")
                    if (os.date("%H%M") <= "2330" and os.date("%H%M") >= "0300") then
                        DeviceOnOff("Tuin", "On")
                    end
                    -- Einde
                else
                    print("*** Niets doen, het is nog niet donker ***")
                end
            end
        end
        if deviceValue == "Off" then
            print("*** Persoon2 has left the premises ***")
            if (otherdevices["Persoon1 Thuis"] == "Off") then
                -- Als Persoon2 het huis verlaat en Persoon1 is ook niet thuis dan moet dit gebeuren
                print("*** Persoon1 is niet thuis, lampen uit ***")
                DeviceOnOff("Garderobe", "Off")
                DeviceOnOff("Kast Keuken", "Off")
                DeviceOnOff("Keukentafel", "Off")
                DeviceOnOff("Keukenkastje", "Off")
                DeviceOnOff("Lampen achter", "Off")
                DeviceOnOff("Woonkamer", "Off")
                DeviceOnOff("Tuin", "Off")
                DeviceOnOff("Kerstboom", "Off")
                if (otherdevices["Donker t/m 00:30"] == "Off") then
                    DeviceOnOff("Lampen naast TV", "Off")
                end
                if (otherdevices["Donker t/m 00:30"] == "On") then
                    DeviceOnOff("Lampen naast TV", "On")
                end
                -- Einde
            else
                print("*** Niets doen, Persoon1 is nog thuis ***")
            end
        end
    end
end

return commandArray