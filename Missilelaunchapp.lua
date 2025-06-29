local component = require("component")
local term = require("term")
local event = require("event")

local function launchMissile()
  local redstone = component.redstone
  -- Change the side as appropriate (e.g., "back", "left", etc.)
  local missileSide = "back"
  print("Preparing to launch missile...")
  redstone.setOutput(missileSide, 15) -- Activate redstone signal
  os.sleep(1) -- Signal duration
  redstone.setOutput(missileSide, 0)  -- Deactivate redstone signal
  print("Missile launched!")
end

local function main()
  term.clear()
  print("=== Missile Launch Application ===")
  print("Press [Enter] to launch missile or [Ctrl+C] to exit.")
  while true do
    local _, _, char = event.pull("key_down")
    if char == 28 then -- Enter key
      launchMissile()
    elseif char == 46 then -- C key (Ctrl+C)
      print("Exiting Missile Launch Application.")
      return
    end
  end
end

main()
