{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  #imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];

  networking.hostName = "nope-7";
  
  time.timeZone = "America/Toronto";

  users.mutableUsers = true;

  users.extraUsers.nope = {
    isNormalUser = true;
    shell = pkgs.zsh;
    home = "/home/nope";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    #displayManager.sddm.autoLogin = {
      #enable = true;
      #relogin = true;
      #user = "demo";
    #};
    desktopManager.plasma5.enable = true;
    libinput.enable = true; # for touchpad support on many laptops
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.daemon.config.flat-volumes = "no";

  environment.systemPackages = with pkgs; [
    # libraries
    libffi 
    # shell
    wget vim neovim zsh xclip ag iotop ntp socat cloc light jekyll python3 python ruby 
    gcc stdenv gnumake automake autoconf file cargo binutils mono unzip SDL2 cabal-install haskell.compiler.ghc865
    gtk3
    hlint travis jq ncurses ghostscript gdb nodejs graphviz
    gnupg tree libglvnd unrar pciutils glxinfo zlib.dev
    xlibs.xev
    xlibs.xmodmap
    appimage-run
    watchexec
    # term emulator
    # rxvt_unicode
    # nonfree/GUI
    lastpass-cli scrot connman-gtk p7zip mupdf xpdf obs-studio
    renpy deluge libreoffice hamster-time-tracker gnome2.GConf uget 
    simplenote 
    redshift
    sqlite
    postgresql
    postgresql.lib
    texlive.combined.scheme-medium
    kile
    zoom-us
    # extra fonts, for some reason
  ];

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

  programs.bash.enableCompletion = true;
  programs.java.enable = true;
  services.postgresql.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    autoResize = true;
    fsType = "ext4";
  };

  boot.growPartition = true;
  boot.loader.grub.device = "/dev/sda";

  virtualisation.virtualbox.guest.enable = true;

  services.xserver.videoDrivers = [ "virtualbox" "vmware" "cirrus" "vesa" "modesetting" ];

  powerManagement.enable = false;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  programs.ssh.startAgent = true;

  # Let demo build as a trusted user.
# nix.trustedUsers = [ "demo" ];

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome3.enable = true;

# Set your time zone.
# time.timeZone = "Europe/Amsterdam";

# List packages installed in system profile. To search, run:
# \$ nix search wget
# environment.systemPackages = with pkgs; [
#   wget vim
# ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
