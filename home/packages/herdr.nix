{ ... }:

{
  programs.herdr = {
    enable = true;

    settings = {
      onboarding = false;

      theme = {
        name = "vesper";
      };

      ui = {
        sidebar_start_collapsed = true;
      };
    };
  };
}
