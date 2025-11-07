{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  noctalia = cmd:
    [
      "noctalia-shell"
      "ipc"
      "call"
    ]
    ++ (pkgs.lib.splitString " " cmd);
in {
  # okay let's try this
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # <name>.hotkey-overlay.title = ""; # Custom Titling
    # noctalia bindings first

    # "Mod+Space".action.spawn = noctalia "launcher toggle";
    # "Mod+Space".hotkey-overlay.title = "App Launcher";

    "Mod+Alt+S".action.spawn = noctalia "controlCenter toggle";
    "Mod+Alt+S".hotkey-overlay.title = "Control Center";

    "Mod+Alt+Comma".action.spawn = noctalia "settings toggle";
    "Mod+Alt+Comma".hotkey-overlay.title = "Settings";

    "Mod+Shift+Comma".action.spawn = noctalia "sessionMenu toggle";
    "Mod+Shift+Comma".hotkey-overlay.title = "Show Session Menu";

    "Mod+Alt+V".action.spawn = noctalia "launcher clipboard";
    "Mod+Alt+V".hotkey-overlay.title = "Clipboard";

    "Mod+Alt+Escape".action.spawn = noctalia "lockScreen lock";
    "Mod+Alt+Escape".hotkey-overlay.title = "Lock Screen";

    "Mod+Shift+Alt+Escape".action.spawn = noctalia "sessionMenu lockAndSuspend";
    "Mod+Shift+Alt+Escape".hotkey-overlay.title = "Suspend System";

    "Mod+Insert".action.spawn = noctalia "screenRecorder toggle";
    "Mod+Insert".hotkey-overlay.title = "Screen Recording";

    "Mod+Home".action.spawn = noctalia "notifications toggleDND";
    "Mod+Home".hotkey-overlay.title = "Toggle Do-Not-Disturb";
    "Mod+Home".allow-when-locked = true;

    "Mod+Delete".action.spawn = noctalia "notifications clear";
    "Mod+Delete".hotkey-overlay.title = "Clear Notifications";
    "Mod+Delete".allow-when-locked = true;

    "Mod+End".action.spawn = noctalia "notifications dismissAll";
    "Mod+End".hotkey-overlay.title = "Dismiss Notifications";
    "Mod+End".allow-when-locked = true;

    "Mod+Prior".action.spawn = noctalia "bar toggle";
    "Mod+Prior".hotkey-overlay.title = "Toggle Bar";

    "Mod+Next".action.spawn = noctalia "wallpaper random";
    "Mod+Next".hotkey-overlay.title = "Random Wallpaper";
    "Mod+Next".allow-when-locked = true;

    "Mod+Alt+Next".action.spawn = noctalia "wallpaper toggle";
    "Mod+Alt+Next".hotkey-overlay.title = "Select Wallpaper";

    "Mod+Shift+Next".action.spawn = noctalia "wallpaper toggleAutomation";
    "Mod+Shift+Next".hotkey-overlay.title = "Toggle Wallpaper Cycling";

    # and now niri's

    "Mod+Grave".action = show-hotkey-overlay;

    "Mod+Print".action.screenshot = {show-pointer = false;};
    "Mod+Alt+Print".action.screenshot-window = {write-to-disk = true;};

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

    "Mod+Alt+Tab".action = toggle-window-floating;
    "Mod+Shift+Tab".action = switch-focus-between-floating-and-tiling;
    "Mod+Tab".action = toggle-overview;
    "Mod+Shift+Q".action = close-window;

    "Mod+R".action = switch-preset-column-width-back;
    "Mod+Alt+R".action = switch-preset-window-height-back;

    "Mod+Shift+C".action = center-column;
    "Mod+Alt+C".action = center-visible-columns;
    "Mod+Shift+Alt+C".action = toggle-column-tabbed-display;

    "Mod+Alt+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;

    "Mod+L".action = focus-column-right-or-first;
    "Mod+H".action = focus-column-left-or-last;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+J".action = focus-window-or-workspace-down;

    "Mod+Alt+L".action = move-column-right;
    "Mod+Alt+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-to-first;
    "Mod+Shift+H".action = move-column-to-last;

    "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
    "Mod+Alt+K".action = move-column-to-workspace-up;
    "Mod+Alt+J".action = move-column-to-workspace-down;

    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;

    "Mod+Shift+Return".action.spawn = ["ghostty" "-e" "zsh"];
    "Mod+Shift+Return".hotkey-overlay.title = "Open Terminal";

    #  "Mod+Shift+Return".action.spawn = [ "ghostty" "cd Nix" ];
    #  "Mod+Shift+Return".hotkey-overlay.title = "Open ~/Nix Directory";

    "Mod+E".action.spawn = ["ghostty" "-e" "superfile"]; #open TUI file explorer
    "Mod+E".hotkey-overlay.title = "Open File Explorer";

    "Mod+Ctrl+S".action.spawn = ["ghostty" "-e" "btm"]; #open system monitor
    "Mod+Ctrl+S".hotkey-overlay.title = "Open System Monitoring";

    # "Mod+Shift+S".action.spawn = [ "ghostty" "microfetch" ];
    # "Mod+Shift+S".hotkey-overlay.title = "Show System Info";

    "Mod+Space".action.spawn = ["vicinae" "toggle"];
    "Mod+Space".hotkey-overlay.title = "App Launcher";
  };
}
