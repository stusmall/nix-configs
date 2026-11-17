{ pkgs, ... }:

{
  home.packages = with pkgs; [
    playwright-mcp
    mcp-proxy
  ];

  programs.codex = {
    enable = true;
    settings = {
      model = "unsloth/gemma-4-E2B-it-GGUF:UD-Q2_K_XL";
      model_provider = "local";
      model_providers = {
        local = {
          name = "local";
          base_url = "http://localhost:8080/v1";
          # wire_api = "responses";
        };
      };
      projects = {
        "/home/stusmall/Workspace/nix-configs" = {
          trust_level = "trusted";
        };
      };
    };
  };
}
