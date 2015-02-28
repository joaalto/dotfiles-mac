local application = require "mjolnir.application"  
local hotkey = require "mjolnir.hotkey"  
local window = require "mjolnir.window"  
local fnutils = require "mjolnir.fnutils" 
local alert = require "mjolnir.alert"
local appfinder = require "mjolnir.cmsj.appfinder"
local screen = require "mjolnir.screen"

local center = {x = 200, y = 0, w = 2200, h = 1300}
local maxSize = screen.mainscreen():frame()

local layout1 = {
    Atom = center,
    ["Google Chrome"] = center,
    ["IntelliJ IDEA"] = maxSize,
    iTerm = maxSize,
    Mail = center,
    Slack = center
}

local apps = {
    "Atom", "Google Chrome", "IntelliJ IDEA", "iTerm", "Mail", "Slack"
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

hotkey.bind({"cmd", "shift"}, "I", applyLayout(layout1))
hotkey.bind({"cmd", "shift"}, "-", maximizeAppWindows())

-- Maximize current window
hotkey.bind({"cmd", "shift"}, ".", function()
  window.focusedwindow():maximize()
end)

-- Toggle current window fullscreen
hotkey.bind({"cmd", "shift"}, "'", function()
  local toggle = not window.focusedwindow():isfullscreen()
  window.focusedwindow():setfullscreen(toggle)
end)

-- Center current window
hotkey.bind({"cmd", "shift"}, "J", function()
  window.focusedwindow():setframe(center)
end)

-- Show app title
hotkey.bind({"cmd", "shift"}, "´", function()
    alert.show(window.focusedwindow():application():title())
end)

function init()
    applyLayout(layout1)
end

init()
