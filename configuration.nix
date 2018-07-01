#Denver this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.timeout = 0;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.systemd-boot.enable = true; # or "nodev" for efi only

  networking.hostName = "nope-3"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.connman.enable = true;  # Enables wireless support via wpa_supplicant.

  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # libraries
    libffi
    # shell
    wget vim neovim git sbt scala zsh xclip ag iotop ntp socat cloc acpi light jekyll python3 python ruby 
    gcc stdenv gnumake automake autoconf file cargo binutils mono unzip SDL2 cabal-install ghc 
    hlint travis jq cowsay ncurses green-pdfviewer ghostscript gdb nodejs visualvm graphviz
    # term emulator
    rxvt_unicode
    # nonfree/GUI
    vscode firefox discord lastpass-cli scrot connman-gtk p7zip mupdf xpdf obs-studio
  ];

  virtualisation.virtualbox.host.enable = true;

  fonts.fonts = with pkgs; [
    font-droid
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
    iosevka
    fixedsys-excelsior
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.java.enable = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  # ipfs

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.apcupsd.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.synaptics.enable = true;
  services.xserver.layout = "us";

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPackages: with haskellPackages; [ 
      haskellPackages.xmobar 
    ];
  };

  services.xserver.windowManager.default = "xmonad";
  services.xserver.displayManager.sessionCommands = with pkgs; lib.mkAfter ''
    syndaemon -i 0.4 -R -d
    synclient PalmDetect=1
    synclient PalmMinWidth=1
    synclient PalmMinZ=20
    synclient VertEdgeScroll=0
    synclient HorizEdgeScroll=0
    setxkbmap -option ctrl:nocaps
    # exec ${haskellPackages.xmonad}/bin/xmonad
  '';

  services.xserver.desktopManager.xterm.enable = false;

  programs.ssh.startAgent = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.nope = {
    isNormalUser = true;
    shell = pkgs.zsh;
    home = "/home/nope";
    extraGroups = [ "wheel" ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}
