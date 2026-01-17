{...}: {
  programs.niri.settings = {
    window-rules = [
      {
        matches = [{is-focused = false;}];
        opacity = 0.92;
      }
      {
        matches = [{is-urgent = true;}];
        opacity = 1.0;
      }
      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
      }
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.5;};
        open-floating = true;
        open-focused = false;
      }
      {
        matches = [
          {
            app-id = "^feh$";
          }
        ];
        open-floating = true;
        open-focused = true;
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.5;};
      }
      {
        matches = [
          {
            app-id = "^xarchiver$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "thunar$";
            title = "^Rename ";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "^dot\.floating\.thunar$";
          }
        ];
        open-floating = true;
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.5;};
      }
      {
        matches = [
          {
            app-id = "^thunar-bulk-rename$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "^thunar-volman$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "^steam";
          }
        ];
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.5;};
        open-floating = true;
        open-focused = false;
      }
      {
        matches = [
          {
            app-id = "^ghostty$";
          }
        ];
        open-focused = true;
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.5;};
      }
      {
        matches = [
          {
            app-id = "^bottom.desktop";
          }
        ];
        default-column-width = {proportion = 0.33333;};
        default-window-height = {proportion = 0.33333;};
        open-focused = false;
      }
      {
        matches = [
          {
            title = "^VSCodium";
          }
        ];
        default-column-width = {proportion = 0.5;};
        open-focused = true;
      }
      {
        matches = [
          {
            title = "^Affinity";
          }
        ];
        default-column-width = {proportion = 0.5;};
        open-focused = true;
        block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^Blender";
          }
        ];
        default-column-width = {proportion = 0.5;};
        open-focused = true;
        #block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^Davinci";
          }
        ];
        open-maximized = true;
        open-focused = true;
        block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^vencord";
          }
        ];
        default-column-width = {proportion = 0.33333;};
        open-focused = true;
        block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^Proton$";
          }
        ];
        open-focused = true;
        block-out-from = "screencast";
        default-column-width = {proportion = 0.66667;};
      }
      {
        matches = [
          {
            app-id = "^fcha";
          }
        ];
        open-focused = false;
        block-out-from = "screencast";
        default-column-width = {proportion = 0.66667;};
      }
      {
        matches = [
          {
            title = "^Firestorm";
          }
        ];
        open-maximized = true;
        open-focused = true;
        block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^JHe";
          }
        ];
        open-focused = false;
        open-floating = true;
        block-out-from = "screencast";
        default-column-width = {proportion = 0.66667;};
      }
    ];
  };
}
