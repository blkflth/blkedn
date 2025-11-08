{
settings = {
        mainbar = {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 0;
          modules-left = [ "clock" ];
          modules-center = [];
          modules-right = [
            "tray"
          ];
          tray = {
            icon-size = 13;
            spacing = 10;
          };
          clock = {
            format = " {:%R   %d/%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
        };
      };
}