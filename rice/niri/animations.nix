{...}:

{

  programs.niri.settings = {
    animations = let
      anim = {
        enable = true;
        kind.easing = {
          duration-ms = 270;
          curve = "cubic-bezier";
          curve-args = [
            0.26
            0.38
            0.3
            1.28
          ];
        };
      };
    in {
      slowdown = 1.0;
      workspace-switch = anim;
      overview-open-close = anim;
      horizontal-view-movement = anim;
      window-movement = anim;
      window-resize = anim;
      window-open = anim;
      window-close = anim;
    };
  };

}
