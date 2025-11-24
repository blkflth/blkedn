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
            app-id = "^ghostty$";
          }
        ];
        open-focused = true;
        default-column-width = {proportion = 0.33333;};
      }
      {
        matches = [
          {
            title = "^vesktop";
          }
        ];
        default-column-width = {proportion = 0.33333;};
        open-focused = true;
        block-out-from = "screencast";
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
        default-column-width = {proportion = 0.66667;};
        open-focused = true;
      }
      {
        matches = [
          {
            title = "^Affinity";
          }
        ];
        open-maximized = true;
        open-focused = true;
        #block-out-from = "screencast";
      }
      {
        matches = [
          {
            title = "^Blender";
          }
        ];
        default-column-width = {proportion = 1.0;};
        open-maximized = true;
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
            title = "^F-Chat";
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
            title = "^JHenTai";
          }
        ];
        open-focused = false;
        block-out-from = "screencast";
        default-column-width = {proportion = 0.66667;};
      }
    ];
  };
}
