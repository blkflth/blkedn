{ pkgs, inputs, config, ... }:

  let
    noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
    ] ++ (pkgs.lib.splitString " " cmd);
  in

{

    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # okay let's try this
    programs.niri = {
      settings = {
          binds = with config.lib.niri.actions; {
              #noctalia bindings first
              "Mod+Space".action.spawn = noctalia "launcher toggle";
              "Mod+S".action.spawn = noctalia "controlCenter toggle";
              "Mod+Comma".action.spawn = noctalia "settings toggle";
              "Mod+V".action.spawn = noctalia "launcher clipboard";
              "Mod+Escape".action.spawn = noctalia "lockScreen lock";
              "Mod+Insert".action.spawn = noctalia "screenRecorder toggle";
              "Mod+Home".action.spawn = noctalia "notifications toggleDND";
              "Mod+Del".action.spawn = noctalia "notifications clear";
              "Mod+End".action.spawn = noctalia "notifications dismissAll";
              "Mod+PageUp".action.spawn = noctalia "bar toggle";
              "Mod+PageDown".action.spawn = noctalia "wallpaper random";

              #And now niri's

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
            # "Mod+W".action = close-window; #disabled so i don't accidentally trigger while setting up
              "Mod+R".action = switch-preset-column-width-back;
              "Mod+C".action = center-column;
              "Mod+Shift+C".action = center-visible-columns;
              "Mod+BracketLeft".action = consume-or-expel-window-left;
              "Mod+BracketRight".action = consume-or-expel-window-right;
            # "Mod+F".action = maximize-column;
              "Mod+F".action = toggle-windowed-fullscreen;
              "Mod+Shift+F".action = fullscreen-window;

              "Mod+Return".action = spawn-sh [ "ghostty" "-e" "fish" ]; #should spawn a terminal ?
              "Mod+Shift+Return".action = spawn-sh [ "ghostty" "-e" "fish" "cd" "/Nix" ]; #should spawn a terminal in the ~/Nix directory?

              "Mod+Tilde".action = show-hotkey-overlay;

              "Mod+L".action = focus-column-right;
              "Mod+H".action = focus-column-left;
              "Mod+K".action = focus-window-or-workspace-up;
              "Mod+J".action = focus-window-or-workspace-down;
              "Mod+Shift+L".action = move-column-right;
              "Mod+Shift+H".action = move-column-left;

              "Mod+Shift+K".action = move-column-to-workspace-up;
              "Mod+Shift+J".action = move-column-to-workspace-down;

            };
        };
    };

}
