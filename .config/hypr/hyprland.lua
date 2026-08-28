-- Hyprland configuration

require("env")
local programs = require("bind")

-- Monitors
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1080@75",
    position = "auto",
    scale    = "auto",
})

-- Autostart
-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
  -- Start notification system
  hl.exec_cmd(programs.notification_system)

  -- Start status bar
  hl.exec_cmd(programs.status_bar)

  -- Start polkit authentication daemon
  -- https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/
  local polkit_deamon = "systemctl --user start hyprpolkitagent"
  hl.exec_cmd(polkit_deamon)

  -- Set background image
  -- https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/
  hl.exec_cmd("hyprpaper")
end)




-- Config
-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    layout = "dwindle",

    gaps_in = 2,
    gaps_out = 2,
    border_size = 1,

    resize_on_border = true,
    extend_border_grab_area = 2,

    col = {
      active_border   = "rgba(FA913CEE)",
      inactive_border = "rgba(2B2826EE)",
    },

    -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
    allow_tearing = true,
  },

  decoration = {
    blur = {
      enabled = false
    }
  },

  animations = {
    enabled = true,
  },

  input = {
    kb_layout = "br",
    kb_variant = "abnt2",
    kb_model = "abnt2",

    touchpad = {
      disable_while_typing = true,
      natural_scroll = false,
      clickfinger_behavior = true,
    },
  },

  misc = {
      vrr = 2,
      disable_autoreload = true,
      disable_hyprland_logo = true,
      disable_splash_rendering = true,
      force_default_wallpaper = 0,
  },
})
