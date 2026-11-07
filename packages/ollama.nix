{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    rocmOverrideGfx = "11.0.0";

    loadModels = [
      "qwen3.5:9b-q4_K_M"
    ];
  };
}
