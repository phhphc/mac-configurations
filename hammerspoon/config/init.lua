-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
--   hs.alert.show("Hello, World!")
-- end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
  hs.notify.new({ title = "Hammerspoon", informativeText = "Hello World" }):send()
end)

hs.loadSpoon("AClock")
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "C", function()
  spoon.AClock:toggleShow()
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "S", function()
  local laptopScreen = "Built-in Retina Display"
  local windowLayout = {
    { "Safari",  nil,          laptopScreen, hs.layout.left50,    nil, nil },
    { "Mail",    nil,          laptopScreen, hs.layout.right50,   nil, nil },
    { "Preview", nil,          laptopScreen, hs.layout.maximized, nil, nil },
    { "iTunes",  "MiniPlayer", laptopScreen, nil,                 nil, hs.geometry.rect(0, -48, 400, 48) },
  }
  hs.layout.apply(windowLayout)
end)

local function cleanPasteboard()
  -- local pb = hs.pasteboard.contentTypes()
  -- local contains = hs.fnutils.contains
  -- if contains(pb, "com.apple.webarchive") and contains(pb, "public.rtf") then
  --   hs.pasteboard.setContents(hs.pasteboard.getContents())
  -- end
  hs.alert.show("Messages focus")
end
local messagesWindowFilter = hs.window.filter.new(false):setAppFilter("Messages")
messagesWindowFilter:subscribe(hs.window.filter.windowFocused, cleanPasteboard)

-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
--   hs.reload()
-- end)
-- hs.alert.show("Config loaded")

-- function reloadConfig(files)
--   doReload = false
--   for _, file in pairs(files) do
--     if file:sub(-4) == ".lua" then
--       doReload = true
--     end
--   end
--   if doReload then
--     hs.reload()
--   end
-- end
--
-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
-- hs.alert.show("Config loaded")

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

function cycle_safari_agents()
  hs.application.launchOrFocus("Safari")
  local safari = hs.appfinder.appFromName("Safari")

  local str_default = { "Develop", "User Agent", "Default (Automatically Chosen)" }
  local str_edge = { "Develop", "User Agent", "Microsoft Edge — macOS" }
  local str_chrome = { "Develop", "User Agent", "Google Chrome — Windows" }

  local default = safari:findMenuItem(str_default)
  local edge = safari:findMenuItem(str_edge)
  local chrome = safari:findMenuItem(str_chrome)

  if default and default["ticked"] then
    safari:selectMenuItem(str_edge)
    hs.alert.show("Edge")
  end
  if edge and edge["ticked"] then
    safari:selectMenuItem(str_chrome)
    hs.alert.show("Chrome")
  end
  if chrome and chrome["ticked"] then
    safari:selectMenuItem(str_default)
    hs.alert.show("Safari")
  end
end

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "7", cycle_safari_agents)

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setTitle("AWAKE")
  else
    caffeine:setTitle("SLEEPY")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

function applicationWatcher(appName, eventType, appObject)
  if eventType == hs.application.watcher.activated then
    if appName == "Finder" then
      -- Bring all Finder windows forward when one gets activated
      appObject:selectMenuItem({ "Window", "Bring All to Front" })
    end
  end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

hs.hotkey.bind({ "cmd", "alt" }, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

mouseCircle = nil
mouseCircleTimer = nil
function mouseHighlight()
  -- Delete an existing highlight if it exists
  if mouseCircle then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
  end
  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.absolutePosition()
  -- Prepare a big red circle around the mouse pointer
  mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
  mouseCircle:setStrokeColor({ ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 1 })
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(5)
  mouseCircle:show()

  -- Set a timer to delete the circle after 3 seconds
  mouseCircleTimer = hs.timer.doAfter(3, function()
    mouseCircle:delete()
    mouseCircle = nil
  end)
end

hs.hotkey.bind({ "cmd", "alt", "shift" }, "D", mouseHighlight)

hs.urlevent.bind("someAlert", function(eventName, params)
  hs.alert.show("Received someAlert")
end)
