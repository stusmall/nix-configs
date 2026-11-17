{ pkgs, ... }:
{
  services.llama-cpp.enable = true;
  services.llama-cpp.package = pkgs.llama-cpp-rocm;
  services.llama-cpp.settings = {
    hf-repo = "unsloth/gemma-4-E2B-it-GGUF:UD-Q2_K_XL";
    ctx-size = 128000;
    temp = 1.0;
    top-p = 0.95;
    top-k = 64;
  };
}
