{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Stu Small";
        email = "stuart.alan.small@gmail.com";
      };
      core = {
        editor = "hx";
        compression = 9;
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
