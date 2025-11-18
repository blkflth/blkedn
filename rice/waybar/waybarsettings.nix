{
  programs.waybar = {
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = [
          "custom/nix"
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
          "niri/language"
          "clock"
        ];
        modules-right = [
          "disk"
          "cpu"
          "memory"
          "bluetooth"
          "network"
          "privacy"
          "wireplumber"
        ];

        "disk" = {
        };
        "cpu" = {
        };
        "memory" = {
        };
        "bluetooth" = {
        };
        "network" = {
        };
        "privacy" = {
        };
        "wireplumber" = {
        };

        "custom/nix" = {
          format = "󱄅";
          on-click = noctalia "controlCenter toggle";
          tooltip = false;
        };

        "niri/workspace" = {
          format = "value";
          disable-click = true;
        };
        "niri/window" = {
          format = "";
        };
        "niri/lnaguage" = {
          format = "Lang: {}";
          format-en = "EN";
          format-jp = "JP";
        };
        clock = {
          format = "{%I:Mp%a%d}";
          timezones = ["America/New_York" "Asia/Tokyo" "Europe/London"];
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = "3";
            weeks-pos = "right";
            on-scroll = "1";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = ["tz_up" "shift_up"];
            on-scroll-down = ["tz_down" "shift_down"];
          };
        };
      };
    };
  };
}
