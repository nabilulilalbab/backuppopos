{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "korteks";
  home.homeDirectory = "/home/korteks";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    git
    neofetch
    hoppscotch
    bat    
    hoppscotch
    htop
    unzip
    speedtest-cli
    ripgrep
    wine

    nodePackages.live-server

    nodejs_22
    go
    gcc
    go
    python312
    python312Packages.pip
    lua
    lua-language-server
    alacritty 
  
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
     (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/korteks/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    icons = true;
  };
  programs.fish = {
     enable = true;
     shellAliases = {
       ls = "eza";
       la = "eza -a";
       ll = "eza -l";
       "project" = "cd /media/korteks/'New Volume'";
       # Alias untuk melihat proses yang menggunakan port terten
        "portcheck"= "sudo lsof -i -P -n | grep LISTEN";

# Alias untuk melihat proses yang menggunakan port tertentu (misalnya, 'port 80')
        "port"= "sudo lsof -i :";
# Alias untuk menghentikan proses berdasarkan PID
        "killpid"= "sudo kill -9";

# Alias untuk menghentikan proses yang menggunakan port tertentu (misalnya, 'killport 80')
         "killport" ="sudo fuser -k";

# Alias tambahan untuk menampilkan port yang digunakan oleh semua layanan
         "ports" =  "sudo ss -tuln" ;

        };
  };
 
}
