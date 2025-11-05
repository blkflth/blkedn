{...}:

{

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
        default-column-width = { proportion = 0.33333; };
        default-window-height = { proportion = 0.5; };
        open-floating = true;
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
            app-id = "^ghostty$";
          }
        ];
        open-focused = true;
        default-column-width = { proportion = 0.33333; };
      }
      {
        matches = [
          {
            title = "^vesktop";
          }
        ];
        default-column-width = { proportion = 0.33333; };
        open-focused = true;
        block-out-from = "screen-capture";
      }
      {
        matches = [
          {
            app-id = "^bottom.desktop";
          }
        ];
        default-column-width = { proportion = 0.33333; };
        default-window-height = { proportion = 0.33333; };
        open-focused = false;
      }
      {
        matches = [
          {
            app-id = "^code.desktop";
          }
        ];
        default-column-width = { proportion = 0.66667; };
        open-focused = true;
      }
      {
        matches = [
          {
            app-id = "^net.lutris.affinity-canva-30.desktop";
          }
        ];
        default-column-width = { proportion = 0.66667; };
        open-focused = true;
      }
      {
        matches = [
          {
            app-id = "^net.lutris.affinity-photo-27.desktop";
          }
        ];
        default-column-width = { proportion = 0.66667; };
        open-focused = true;
      }
      {
        matches = [
          {
            app-id = "^blender.desktop";
          }
        ];
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "^davinci-resolve.desktop";
          }
        ];
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "^fchat-horizon.desktop";
          }
        ];
        open-focused = false;
        block-out-from = "screen-capture";
        default-column-width = { proportion = 0.66667; };
      }
    ];
  };

}

