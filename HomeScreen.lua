-- OpenComputers Home Screen --

local component = require("component")
local event = require("event")
local gpu = component.gpu

-- Detect if we have redstone (for both reactor and missile)
local hasReactor = component.isAvailable("redstone") -- Replace with more specific check as needed
local hasMissile = component.isAvailable("redstone") -- Replace with more specific check as needed

local width, height = gpu.maxResolution()
gpu.setResolution(math.min(40, width), math.min(16, height))

function drawHome()
  gpu.fill(1, 1, 40, 16, " ")
  gpu.set(15, 2, "HBM Control OS")
  gpu.set(10, 5, (hasReactor and "[1] Reactor Control") or "(no reactor)")
  gpu.set(10, 7, (hasMissile and "[2] Missile Launch") or "(no missile)")
  gpu.set(10, 9, "[3] Settings")
  gpu.set(10, 11, "[4] Shutdown")
  gpu.set(8, 14, "Touch or press number to select")
end

drawHome()

while true do
  local e, _, x, y, char = event.pull()
  if e == "touch" then
    if y == 5 and hasReactor then
      gpu.set(1, 16, "Selected: Reactor Control      ")
      -- placeholder: call app loader here
    elseif y == 7 and hasMissile then
      gpu.set(1, 16, "Selected: Missile Launch      ")
      os.execute("Missilelaunchapp.lua")
    elseif y == 9 then
      gpu.set(1, 16, "Selected: Settings            ")
      -- placeholder: call app loader here
    elseif y == 11 then
      gpu.set(1, 16, "Selected: Shutdown            ")
      -- placeholder: call app loader here
    end
  elseif e == "key_down" then
    if char == 49 and hasReactor then -- '1'
      gpu.set(1, 16, "Selected: Reactor Control      ")
      -- placeholder: call app loader here
    elseif char == 50 and hasMissile then -- '2'
      gpu.set(1, 16, "Selected: Missile Launch      ")
      -- placeholder: call app loader here
    elseif char

