{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "shiso2608";
        email = "254681157+shiso2608@users.noreply.github.com";
      };

      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
