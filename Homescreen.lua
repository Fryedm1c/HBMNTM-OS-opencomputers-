local component = require("component")
local event = require("event")
local gpu = component.gpu

local width, height = gpu.maxResolution()
gpu.setResolution(math.min(40, width), math.min(16, height))

-- Device detection (customize these checks for your setup)
local hasReactor = component.isAvailable("redstone") -- Replace with real check if needed
local hasMissile = component.isAvailable("redstone") -- Replace with real check if needed

-- Function to draw the home screen
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
  local e, _, x, y, char, code = event.pull()
  if e == "touch" then
    if y == 5 and hasReactor then
      -- Open Reactor Control
      break
    elseif y == 7 and hasMissile then
      -- Open Missile Launch
      break
    elseif y == 9 then
      -- Open Settings
      break
    elseif y == 11 then
      -- Shutdown
      break
    end
  elseif e == "key_down" then
    if char == 49 and hasReactor then -- '1'
      -- Open Reactor Control
      break
    elseif char == 50 and hasMissile then -- '2'
      -- Open Missile Launch
      break
    elseif char == 51 then -- '3'
      -- Open Settings
      break
    elseif char == 52 then -- '4'
      -- Shutdown
      break
    end
  end
end
