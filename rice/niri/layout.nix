{...}:

{

  programs.niri.settings = {
    layout = {
      gaps = 6;
      background-color = "00000000";
      center-focused-column = "on-overflow";
      preset-column-widths = [
      # { proportion = 0.25; }
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      preset-window-heights = [
      # { proportion = 0.25; }
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      struts = {
        bottom = 10;
        top = 10;
        left = 10;
        right = 10;
      };

      default-column-width.proportion = 0.33333;
      focus-ring = {
        enable = false;
        width = 2;
        active.color = "#000000";
        inactive.color = "#000000";
        urgent.color = "#e3383877";
      };
      border = {
        enable = true;
        /* 
        active.gradient.angle = 225;
        active.gradient.relative-to = "workspace-view";
        active.gradient.from = "#1c68e2e6";
        active.gradient.to = "#bb38dff6";
        */
        inactive.gradient.angle = 225;
        inactive.gradient.relative-to = "workspace-view";
        inactive.gradient.from = "#1c68e2e6";
        inactive.gradient.to = "#bb38dff6";
        active.color = "#72e25096";
        #inactive.color = "#000000";
        width = 2;
      };
      shadow = {
        enable = true;
        spread = 16;
        softness = 10;
        draw-behind-window = true;
      };
    };
  };

}

#background: linear-gradient(225deg, #73E25196, #B5821F98);