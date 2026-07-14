{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Aurora User";
    userEmail = "aurora@localhost";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "helix";
    };
  };

  # Git aliases
  home.shellAliases = {
    "g" = "git";
    "gs" = "git status";
    "ga" = "git add";
    "gc" = "git commit";
    "gp" = "git push";
    "gl" = "git log --oneline -10";
  };
}
