-- SetWeaponsNoAutoreload(true)
-- 	SetWeaponsNoAutoswap(true)
--Name: praca | 2022-12-05T15:47:30Z
local zonaPraca = PolyZone:Create({
    vector2(162.18391418457, -1010.094543457),
    vector2(156.4813079834, -1008.2532348633),
    vector2(155.56526184082, -1007.3936157227),
    vector2(153.45297241211, -1002.188293457),
    vector2(152.17083740234, -1001.1607055664),
    vector2(130.00897216797, -993.54711914062),
    vector2(127.38561248779, -991.91522216797),
    vector2(126.0626449585, -989.68121337891),
    vector2(126.06882476807, -985.87506103516),
    vector2(161.5164642334, -889.08929443359),
    vector2(165.2420501709, -883.52221679688),
    vector2(172.05583190918, -872.58575439453),
    vector2(184.12646484375, -843.07275390625),
    vector2(186.50291442871, -840.98846435547),
    vector2(189.27177429199, -839.87438964844),
    vector2(191.86068725586, -840.21313476562),
    vector2(193.5319519043, -841.60754394531),
    vector2(194.41519165039, -843.49169921875),
    vector2(196.1360168457, -845.47265625),
    vector2(247.05229187012, -863.90991210938),
    vector2(249.02323913574, -864.04406738281),
    vector2(251.27206420898, -862.77746582031),
    vector2(253.45881652832, -862.66668701172),
    vector2(259.6376953125, -864.78082275391),
    vector2(262.90493774414, -866.98052978516),
    vector2(265.86364746094, -870.79241943359),
    vector2(266.06729125977, -874.01690673828),
    vector2(265.76284790039, -877.66925048828),
    vector2(213.12359619141, -1021.9828491211),
    vector2(210.4969329834, -1024.7579345703),
    vector2(205.30494689941, -1024.8724365234),
    vector2(195.86450195312, -1021.2305908203),
    vector2(192.39102172852, -1014.9453125),
    vector2(169.53373718262, -1007.1228027344)
}, {
    name = "praca",
    minZ = 29.090732574463,
    maxZ = 31.065549850464
})

local inZone = false

local function BlockWeaponThread()
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        while inZone do
            SetPedConfigFlag(ped, 186, true)
            if GetCurrentPedWeapon(ped) ~= `weapon_unarmed` then
                GiveWeaponToPed(ped, `weapon_unarmed`, 0, false, true)
            end
            Wait(0)
        end
        SetPedConfigFlag(ped, 186, false)
    end)
end

zonaPraca:onPlayerInOut(function(naZona, _)
    inZone = naZona
    if inZone then
        BlockWeaponThread()
    end
end)
