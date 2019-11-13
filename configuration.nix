# this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # For benchmarking.
  #powerManagement.cpuFreqGovernor = "performance";
  #
  #hardware.opengl.driSupport32Bit = true;

  boot.loader.timeout = 0;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.systemd-boot.enable = true; # or "nodev" for efi only

  networking.hostName = "nope-4"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.connman.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.extraHosts = 
    ''
      208.67.220.220 secure.datavalet.io
    '';

  time.timeZone = "America/Toronto";

  programs.adb.enable = true;
  users.users.nope.extraGroups = ["adbusers"];

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
    wget vim neovim git scala zsh xclip ag iotop ntp socat cloc acpi light jekyll python3 python ruby 
    gcc stdenv gnumake automake autoconf file cargo binutils mono unzip SDL2 cabal-install haskell.compiler.ghc865
    gtk3
    hlint travis jq cowsay ncurses green-pdfviewer ghostscript gdb nodejs graphviz
    gnupg tree wineFull winetricks libglvnd unrar pciutils glxinfo zlib.dev
    xlibs.xev
    xlibs.xmodmap
    appimage-run
    watchexec
    # term emulator
    rxvt_unicode
    # nonfree/GUI
    vscode firefox discord lastpass-cli scrot connman-gtk p7zip mupdf xpdf obs-studio
    renpy deluge evince libreoffice hamster-time-tracker gnome2.GConf vlc spotify uget calibre abiword
    simplenote discord
    redshift
    steam
    playonlinux
    android-studio
    sqlite
    postgresql
    postgresql.lib
    texlive.combined.scheme-medium
    kile
    zoom-us
    # extra fonts, for some reason
  ];

  services.physlock = {
    allowAnyUser = true;
    enable = true;
  };

  # virtualisation.virtualbox.host.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
    unifont
    league-of-moveable-type
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
  services.postgresql.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #
  services.acpid.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # services.apcupsd.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.daemon.config.flat-volumes = "no";

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.xserver.synaptics.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.tapping = false;
  services.xserver.libinput.tappingDragLock = false;
  services.xserver.layout = "us";

  services.xserver.exportConfiguration = true;

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPackages: with haskellPackages; [ 
      haskellPackages.xmobar 
    ];
  };

  services.xserver.windowManager.default = "xmonad";
  services.xserver.displayManager.sessionCommands = with pkgs; lib.mkAfter ''
    #two monitors, big one left of main
    xrandr --output eDP-1 --auto --output HDMI-1 --auto --left-of eDP-1
    #syndaemon -i 0.4 -R -d
    #synclient PalmDetect=1
    #synclient PalmMinWidth=1
    #synclient PalmMinZ=20
    #synclient VertEdgeScroll=0
    #synclient HorizEdgeScroll=0
    setxkbmap -option ctrl:nocaps
    xmodmap -e 'keycode 67='
    xmodmap -e 'keycode 68='
    xmodmap -e 'keycode 69='
    xmodmap -e 'keycode 70='
    xmodmap -e 'keycode 71='
    xmodmap -e 'keycode 72='
    xmodmap -e 'keycode 73='
    xmodmap -e 'keycode 74='
    xmodmap -e 'keycode 75='
    xmodmap -e 'keycode 76='
    xmodmap -e 'keycode 95='
    xmodmap -e 'keycode 96='
    xmodmap -e 'keycode 89='
    # exec ${haskellPackages.xmonad}/bin/xmonad
  '';

  services.xserver.desktopManager.xterm.enable = false;
  
  services.xserver.xautolock = {
    enable = true;
    enableNotifier = true;
    locker = ''${config.security.wrapperDir}/physlock'';
    notifier =
      ''${pkgs.libnotify}/bin/notify-send "Locking in 10 seconds"'';
  };
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
  system.stateVersion = "18.09"; # Did you read the comment?

  nixpkgs.config.glibc.installLocales = true;

  services.logind.extraConfig=''
  	HandlePowerKey=ignore
  '';

}
