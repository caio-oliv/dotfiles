-- Bindings
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local prog_terminal = "alacritty"
local prog_file_manager = "nautilus"
local prog_app_launcher = "hyprctl dispatch \"hl.dsp.exec_cmd(\\\"$(tofi-run)\\\")\""
local prog_notification_system = "mako"
local prog_status_bar = "waybar"
local prog_screenshot_window = "$XDG_CONFIG_HOME/hypr/screenshot-window.sh"
local prog_screenshot_region = "$XDG_CONFIG_HOME/hypr/screenshot-region.sh"

local programs = {
  terminal = prog_terminal,
  notification_system = prog_notification_system,
  status_bar = prog_status_bar,
  file_manager = prog_file_manager,
  app_launcher = prog_app_launcher,
  screenshot_window = prog_screenshot_window,
  screenshot_region = prog_screenshot_region,
}

local key_mod = "SUPER"
local key_ctrl = "CONTROL"
local key_shift = "SHIFT"
local key_enter = "RETURN"
local key_tab = "TAB"
local key_esc = "ESCAPE"
local key_space = "SPACE"
local key_print = "PRINT"

local key_mouse_lmb = "mouse:272"
local key_mouse_rmb = "mouse:273"
local key_mouse_up = "mouse_up"
local key_mouse_down = "mouse_down"


-- Program bindings
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(prog_terminal))
hl.bind("SUPER + P",     hl.dsp.exec_cmd(prog_app_launcher))
hl.bind("SUPER + F",     hl.dsp.exec_cmd(prog_file_manager))
hl.bind("PRINT",         hl.dsp.exec_cmd(prog_screenshot_region))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd(prog_screenshot_window))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Move window with SUPER + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Persistent workspaces
-- hl.workspace_rule({ workspace = "1", persistent = true })
-- hl.workspace_rule({ workspace = "2", persistent = true })
-- hl.workspace_rule({ workspace = "3", persistent = true })
-- hl.workspace_rule({ workspace = "4", persistent = true })
-- hl.workspace_rule({ workspace = "5", persistent = true })

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,          hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + " .. key_mouse_down,  hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + " .. key_mouse_up,    hl.dsp.focus({ workspace = "e-1" }))

-- Switch windows with SUPER + TAB
hl.bind("SUPER + TAB", hl.dsp.focus({ window = "e+1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + " .. key_mouse_lmb,  hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + " .. key_mouse_rmb,  hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + W",      hl.dsp.window.close({}))
hl.bind("SUPER + Z",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + SPACE",  hl.dsp.window.float({ action = "toggle" }))


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),  { locked = true, repeating = true })

-- XF86HomePage     Display user's home page
-- XF86Mail         Invoke user's mail program
-- XF86AudioRecord  Record audio application
-- XF86Calculator   Invoke calculator program
-- XF86Memo         Invoke Memo taking program
-- XF86ToDoList     Invoke To Do List program
-- XF86Calendar     Invoke Calendar program
-- XF86PowerDown    Deep sleep the system
-- XF86Battery      Display battery information
-- XF86Bluetooth    Enable/disable bluetooth

return programs
