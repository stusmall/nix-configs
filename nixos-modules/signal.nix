{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ signal-desktop ];

  services.opensnitch.rules = {
    rule-500-signal = {
      name = "Allow Signal";
      enabled = true;
      action = "allow";
      duration = "always";
      operator = {
        type = "list";
        operand = "list";
        list = [
          {
            type = "regexp";
            sensitive = false;
            operand = "process.path";
            data = "^\\/nix\\/store\\/.*\\/libexec\\/electron\\/electron$";
          }
          {
            type = "regexp";
            operand = "dest.host";
            sensitive = false;
            data = "^([a-z0-9|-]+\\.)*signal\\.org$";
          }
        ];
      };
    };
  };
}
