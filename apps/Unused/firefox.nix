{ pkgs, ...}:

{
  # Module installs program and enables as default broswer
  home.packages = [ pkgs.firefox ];

  home.sessionVariables = {
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };


}