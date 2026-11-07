{ ... }:

{
  services.kmscon = {
    enable = true;
    useXkbConfig = true;
    config = {
      hwaccel = true;
    };
  };
}
