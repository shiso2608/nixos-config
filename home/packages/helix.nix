{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        line-number = "absolute";
        cursorline = true;
        indent-guides.render = true;
        end-of-line-diagnostics = "hint";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        soft-wrap = {
          enable = true;
          wrap-at-text-width = true;
        };

        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "error";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }
      ];

      language-server = {
        nixd = {
          command = "nixd";
          config.nixd.formatting.command = [ "nixfmt" ];
        };
      };
    };
  };
}
