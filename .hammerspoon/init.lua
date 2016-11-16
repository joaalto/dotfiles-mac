--package.path = package.path .. ';/usr/local/Cellar/lua/5.2.4_3/share/lua/5.2/?.lua'
--package.cpath = package.cpath .. ';/usr/local/lib/lua/5.2/?.so'

local center = {x = 200, y = 0, w = 2200, h = 1300}
local medium = {x = 350, y = 0, w = 2200, h = 1000}
local maxSize = hs.screen.mainScreen():frame()

local layout1 = {
    Atom = center,
    ["Google Chrome"] = center,
    HipChat = center,
    ["IntelliJ IDEA"] = maxSize,
    iTerm = maxSize,
    Mail = center,
    Slack = center,
    Spotify = center,
    ["Microsoft Outlook"] = center,
    Flowdock = center
}

local apps = {
    "Atom", "Google Chrome", "HipChat", "IntelliJ IDEA", "iTerm", "Mail", "Slack", "Spotify", "Microsoft Outlook", "Flowdock"
}

function applyLayout(layout)
  return function()
    for appName, place in pairs(layout) do
      local app = hs.appfinder.appFromName(appName)
      if app then
        for i, win in ipairs(app:allWindows()) do
          win:setFrame(place)
        end
      end
    end
  end
end

function maximizeAppWindows()
  return function()
    hs.fnutils.each(apps, function(appName)
      local app = hs.appfinder.appFromName(appName)
      if app then
        hs.fnutils.each(app:allWindows(), function(win)
          win:maximize()
        end)
      end
    end)
  end
end

hs.hotkey.bind({"cmd", "shift"}, "U", applyLayout(layout1))
hs.hotkey.bind({"cmd", "shift"}, "-", maximizeAppWindows())

-- Maximize current window
hs.hotkey.bind({"cmd", "shift"}, ".", function()
  hs.window.focusedWindow():maximize()
end)

-- Toggle current window fullscreen
hs.hotkey.bind({"cmd", "shift"}, "'", function()
  local toggle = not hs.window.focusedWindow():isFullScreen()
  hs.window.focusedWindow():setFullScreen(toggle)
end)

-- Center current window
hs.hotkey.bind({"cmd", "shift"}, "¨", function()
  hs.window.focusedWindow():setFrame(center)
end)

-- Medium window size
hs.hotkey.bind({"cmd", "shift"}, "+", function()
  hs.window.focusedWindow():setFrame(medium)
end)

-- Show app title
hs.hotkey.bind({"cmd", "shift"}, "´", function()
    hs.alert.show(hs.window.focusedWindow():application():title())
end)

function init()
    applyLayout(layout1)
end

hs.hotkey.bind({"cmd", "shift"}, "å", function()
    hs.spotify.displayCurrentTrack()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

init()
