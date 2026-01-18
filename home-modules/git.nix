{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Stu Small";
        email = "stuart.alan.small@gmail.com";
        signingkey = "8FA9614D70EC620FBE9D6750843722273ACC53E5";
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
