{...}: {
  programs.niri.settings = {
    overview = {
      workspace-shadow = {
        enable = true;
        spread = 60;
        softness = 80;
      };
    };
  };
}
