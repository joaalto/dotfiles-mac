local application = require "mjolnir.application"  
local hotkey = require "mjolnir.hotkey"  
local window = require "mjolnir.window"  
local fnutils = require "mjolnir.fnutils" 
local alert = require "mjolnir.alert"
local appfinder = require "mjolnir.cmsj.appfinder"
local screen = require "mjolnir.screen"

local gobig = {x = 0, y = 0, w = gw, h = gh}
local center = {x = 200, y = 0, w = 2200, h = 1300}

local layout1 = {
    iTerm = center,
    Slack = center,
    Atom = center,
    ["Google Chrome"] = center,
    ["IntelliJ IDEA 14 CE"] = screen.mainscreen():frame()
--    [appfinder.app_from_name("InteliJ IDEA 14")] = screen.mainscreen():frame()
}

local fullApps = {
    "Google Chrome", "iTerm", "Mail", "Slack", "IntelliJ IDEA"
}

hotkey.bind({"cmd", "shift"}, "J", function()
  local win = window.focusedwindow()
--  local f = win:frame()
--  f.x = f.x + 10
  win:setframe(center)
end)

function applyPlace(win, place)
  --local scrs = screen:allscreens()
  --local scr = scrs[place[1]]
  --grid.set(win, place[2], scr)
  win:setframe(center)
end

function centerWindow()
    fnutils.each(fullApps, function(appName)
        local app = appfinder.app_from_name(appName)
        app = {1, center}
    end)
end

hotkey.bind({"cmd", "shift"}, "K", centerWindow())

function applyFrame(frame)
  return function()
    for i, appName in ipairs(fullApps) do
      local app = appfinder.app_from_name(appName)
      if app then
        for i, win in ipairs(app:allwindows()) do
          win:setframe(frame)
        end
      end
    end
  end
end

function applyLayout(layout)
  return function()
    for appName, place in pairs(layout) do
      local app = appfinder.app_from_name(appName)
      if app then
        for i, win in ipairs(app:allwindows()) do
          --applyPlace(win, place)
          win:setframe(place)
        end
      end
    end
  end
end

function maximizeCurrentWindow()
  return function()
    window.focusedwindow():maximize()
  end
end

hotkey.bind({"cmd", "shift"}, "I", applyLayout(layout1))
hotkey.bind({"cmd", "shift"}, "O", applyFrame(center))
hotkey.bind({"cmd", "shift"}, ".", maximizeCurrentWindow())

function init()
    applyLayout(layout1)
end

init()
