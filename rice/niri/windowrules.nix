{...}:

{

  programs.niri.settings = {
    window-rules = [
      {
        matches = [{is-focused = false;}];
        opacity = 0.90;
      }
      {
        matches = [{is-urgent = true;}];
        opacity = 1.0;
      }
      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 4.5;
          top-right = 4.5;
          bottom-left = 4.5;
          bottom-right = 4.5;
        };
      }
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "^Firestorm$";
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
        default-column-width = { proportion = 0.25; };
      }
      {
        matches = [
          {
            app-id = "vesktop$";
          }
        ];
        default-column-width = { proportion = 0.33333; };
        open-focused = true;
      }
      {
        matches = [
          {
            title = "^btm$";
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
