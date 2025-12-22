{...}: {
  programs.niri.settings = {
    layout = {
      gaps = 4;
      background-color = "00000000";
      center-focused-column = "on-overflow";
      preset-column-widths = [
        # { proportion = 0.25; }
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];
      preset-window-heights = [
        # { proportion = 0.25; }
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
        {proportion = 1.0;}
      ];
      struts = {
        bottom = 7;
        top = 7;
        left = 7;
        right = 7;
      };

      default-column-display = "tabbed";

      tab-indicator = {
        enable = true;
        hide-when-single-tab = true;
        place-within-column = true;
        position = "left";
        width = 4.0;
        length.total-proportion = 0.66667;
        corner-radius = 3.0;
        gap = 2.0;
        gaps-between-tabs = 0.2;
        active.color = "#72e25096";
        inactive.gradient.from = "#1c68e2e6";
        inactive.gradient.to = "#bb38dff6";
        urgent.color = "#e44949ed";
      };

      default-column-width.proportion = 0.33333;
      focus-ring = {
        enable = true;
        width = 1;
        #active.color = "#000000";
        #inactive.color = "#000000";
        urgent.color = "#e44949ed";
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
        width = 1.5;
      };
      shadow = {
        enable = true;
        spread = 8;
        softness = 28;
        draw-behind-window = true;
      };
    };
  };
}
#background: linear-gradient(225deg, #73E25196, #B5821F98);

