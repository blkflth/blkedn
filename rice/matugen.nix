{inputs, ...}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];
  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    palette = "default";
  };
  # xdg.configFile."<path>".source = "${config.programs.matugen.theme.files}/<template_output_path>";

  xdg.configFile."gtk-4.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";
}
