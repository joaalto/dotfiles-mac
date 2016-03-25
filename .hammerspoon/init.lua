--package.path = package.path .. ';/usr/local/Cellar/lua/5.2.4_3/share/lua/5.2/?.lua'
--package.cpath = package.cpath .. ';/usr/local/lib/lua/5.2/?.so'

local center = {x = 200, y = 0, w = 2200, h = 1300}
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
      local app = appfinder.app_from_name(appName)
      if app then
        for i, win in ipairs(app:allwindows()) do
          win:setframe(place)
        end
      end
    end
  end
end

function maximizeAppWindows()
  return function()
    fnutils.each(apps, function(appName)
      local app = appfinder.app_from_name(appName)
      if app then
        fnutils.each(app:allwindows(), function(win)
          win:maximize()
        end)
      end
    end)
  end
end

hs.hotkey.bind({"cmd", "shift"}, "I", applyLayout(layout1))
hs.hotkey.bind({"cmd", "shift"}, "-", maximizeAppWindows())

-- Maximize current window
hs.hotkey.bind({"cmd", "shift"}, ".", function()
  window.focusedwindow():maximize()
end)

-- Toggle current window fullscreen
hs.hotkey.bind({"cmd", "shift"}, "'", function()
  local toggle = not window.focusedwindow():isfullscreen()
  window.focusedwindow():setfullscreen(toggle)
end)

-- Center current window
hs.hotkey.bind({"cmd", "shift"}, "¨", function()
  window.focusedwindow():setframe(center)
end)

-- Show app title
hs.hotkey.bind({"cmd", "shift"}, "´", function()
    alert.show(window.focusedwindow():application():title())
end)

function init()
    applyLayout(layout1)
end

hs.hotkey.bind({"cmd", "shift"}, "i", function()
    hs.spotify.displayCurrentTrack()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

init()
