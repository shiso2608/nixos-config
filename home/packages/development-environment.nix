{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    nixd
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    gcc
  ];
}
