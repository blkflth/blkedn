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
      }
      {
        matches = [
          {
            title = "^btm";
          }
        ];
        default-column-width = { proportion = 0.33333; };
        default-window-height = { proportion = 0.33333; };
        open-focused = false;
      }
      {
        matches = [
          {
            title = "bottom";
          }
        ];
        default-column-width = { proportion = 0.33333; };
        default-window-height = { proportion = 0.33333; };
        open-focused = false;
      }
    ];
  };

}
