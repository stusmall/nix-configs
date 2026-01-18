{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    settings = {
      show_startup_tips = false;
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    }
    // (lib.attrsets.optionalAttrs pkgs.stdenv.isDarwin {
      copy_command = "pbcopy";
    });
  };
}
