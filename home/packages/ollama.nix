{ config, ... }:

{
  home.file."${config.xdg.configHome}/ollama/qwen3_5-cold.modelfile" = {
    text = ''
      FROM qwen3.5:9b-q4_K_M
      PARAMETER temperature 0.7
    '';
  };
}
