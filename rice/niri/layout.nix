{...}:

{

  programs.niri.settings = {
    layout = {
      gaps = 4;
      background-color = "00000000";
      center-focused-column = "on-overflow";
      preset-column-widths = [
        { proportion = 0.25; }
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      struts = {
        bottom = 12;
        top = 12;
        left = 8;
        right = 8;
      };

      default-column-width.proportion = 0.33333;
      focus-ring = {
        enable = false;
        width = 2;
        active.color = "#009000";
        inactive.color = "#101010ff";
        urgent.color = "#dc5a5a";
      };
      border = {
        enable = true;
        active.color = "#be1c6c";
        inactive.color = "#101010ff";
        width = 2;
      };
      shadow = {
        enable = true;
        spread = 15;
        softness = 20;
        draw-behind-window = true;
      };
    };
  };

}
