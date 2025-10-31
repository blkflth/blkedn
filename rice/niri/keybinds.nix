{ config, lib, pkgs, inputs, ... }:

  let
    noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
    ] ++ (pkgs.lib.splitString " " cmd);
  in

{

    # okay let's try this
    programs.niri.settings.binds = with config.lib.niri.actions; {
              # <name>.hotkey-overlay.title = ""; # Custom Titling
              # noctalia bindings first

            # "Mod+Space".action.spawn = noctalia "launcher toggle";
            # "Mod+Space".hotkey-overlay.title = "App Launcher";

              "Mod+S".action.spawn = noctalia "controlCenter toggle";
              "Mod+S".hotkey-overlay.title = "Control Center";

              "Mod+Comma".action.spawn = noctalia "settings toggle";
              "Mod+Comma".hotkey-overlay.title = "Settings";

              "Mod+V".action.spawn = noctalia "launcher clipboard";
              "Mod+V".hotkey-overlay.title = "Clipboard";

              "Mod+Escape".action.spawn = noctalia "lockScreen lock";
              "Mod+Escape".hotkey-overlay.title = "Lock";

              "Mod+Insert".action.spawn = noctalia "screenRecorder toggle";
              "Mod+Insert".hotkey-overlay.title = "Screen Recording";

              "Mod+Home".action.spawn = noctalia "notifications toggleDND";
              "Mod+Home".hotkey-overlay.title = "Toggle Do-Not-Disturb";

              "Mod+Delete".action.spawn = noctalia "notifications clear";
              "Mod+Delete".hotkey-overlay.title = "Clear Notifications";

              "Mod+End".action.spawn = noctalia "notifications dismissAll";
              "Mod+End".hotkey-overlay.title = "Dismiss Notifications";

              "Mod+Prior".action.spawn = noctalia "bar toggle";
              "Mod+Prior".hotkey-overlay.title = "Toggle Bar";

              "Mod+Next".action.spawn = noctalia "wallpaper random";
              "Mod+Next".hotkey-overlay.title = "Random Wallpaper";

              # and now niri's

              "Mod+Grave".action = show-hotkey-overlay;

              "Mod+1".action = focus-workspace 1;
              "Mod+2".action = focus-workspace 2;
              "Mod+3".action = focus-workspace 3;
              "Mod+4".action = focus-workspace 4;
              "Mod+5".action = focus-workspace 5;
              "Mod+6".action = focus-workspace 6;
              "Mod+7".action = focus-workspace 7;
              "Mod+8".action = focus-workspace 8;
              "Mod+9".action = focus-workspace 9;
              "Mod+0".action = focus-workspace 10;

              "Mod+Tab".action = toggle-overview;
              "Mod+Shift+W".action = close-window;
              "Mod+R".action = switch-preset-column-width-back;
              "Mod+Shift+R".action = switch-preset-window-height-back;

              "Mod+C".action = center-column;
              "Mod+Shift+C".action = center-visible-columns;


              "Mod+Alt+F".action = maximize-column;
              "Mod+Shift+F".action = fullscreen-window;

              "Mod+L".action = focus-column-right;
              "Mod+H".action = focus-column-left;
              "Mod+K".action = focus-window-or-workspace-up;
              "Mod+J".action = focus-window-or-workspace-down;

              "Mod+Shift+L".action = move-column-right;
              "Mod+Shift+H".action = move-column-left;
              "Mod+Shift+K".action = move-column-to-workspace-up;
              "Mod+Shift+J".action = move-column-to-workspace-down;

              "Mod+BracketLeft".action = consume-or-expel-window-left;
              "Mod+BracketRight".action = consume-or-expel-window-right;


              "Mod+Return".action.spawn = [ "ghostty" "-e" "zsh" "microfetch" ];
              "Mod+Return".hotkey-overlay.title = "Open Terminal";

              "Mod+Shift+Return".action.spawn = [ "ghostty" "cd" "Nix" ];
              "Mod+Shift+Return".hotkey-overlay.title = "Open ~/Nix Directory";

              "Mod+E".action.spawn = [ "ghostty" "-e" "superfile" ]; #open TUI file explorer
              "Mod+E".hotkey-overlay.title = "Open File Explorer";

              "Mod+Alt+S".action.spawn = [ "ghostty" "-e" "btm" ]; #open system monitor
              "Mod+Alt+S".hotkey-overlay.title = "Open System Monitoring";

              "Mod+Shift+S".action.spawn = [ "ghostty" "-e" "microfetch" ];
              "Mod+Shift+S".hotkey-overlay.title = "Show System Info";

              "Mod+Space".action.spawn = [ "vicinae" "toggle" ];
              "Mod+Space".hotkey-overlay.title = "App Launcher";

    };

}
