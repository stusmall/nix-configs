{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      show_startup_tips = false;
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };
}
