{pkgs, ...}: {
  home.packages = with pkgs; [
    fishPlugins.tide #prompt
    fishPlugins.sponge #filters out typos
    fishPlugins.puffer #text expansions
    fishPlugins.plugin-sudope #input ``sudo`` with ``esc+esc``
    fishPlugins.fzf-fish # fzf keybindings
    fishPlugins.fish-you-should-use #alias reminder
    fishPlugins.fish-bd #command to go up in directory
    fishPlugins.colored-man-pages #does what it says
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "microfetch";
  };
}
