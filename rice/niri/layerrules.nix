{...}: {
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [{namespace = "^noctalia-overview*";}];
        place-within-backdrop = true;
      }
      {
        matches = [{namespace = "^quickshell$";}];
        place-within-backdrop = true;
      }
    ];
  };
}
