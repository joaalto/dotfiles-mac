local application = require "mjolnir.application"  
local hotkey = require "mjolnir.hotkey"  
local window = require "mjolnir.window"  
local fnutils = require "mjolnir.fnutils" 
local alert = require "mjolnir.alert"
local appfinder = require "mjolnir.cmsj.appfinder"

local gobig = {x = 0, y = 0, w = gw, h = gh}
local center = {x = 200, y = 0, w = 2200, h = 1300}

local layout1 = {
    iTerm = {1, gobig},
    Slack = {1, gobig}
}

hotkey.bind({"cmd", "shift"}, "J", function()
  local win = window.focusedwindow()
--  local f = win:frame()
--  f.x = f.x + 10
  win:setframe(center)
end)

function applyLayout(layout)
  return function()
    for appName, place in pairs(layout) do
      local app = appfinder.app_from_name(appName)
      if app then
        for i, win in ipairs(app:allwindows()) do
          applyPlace(win, place)
        end
      end
    end
  end
end

local fullApps = {
    "Google Chrome", "iTerm", "Mail", "Slack", "IntelliJ IDEA"
}

function fullScreen()
    fnutils.each(fullApps, function(app)
        app = {1, gobig}
    end)
end

function init()
    fullScreen()
    applyLayout(layout1)
end

init()
