{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

  ];

  

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bugbook";

  # Enable networking
  networking.networkmanager.enable = true;

  #Desktop Environment
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  programs.river.enable = true;
  programs.xwayland.enable = true;

  
  services.libinput.enable = true; 
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.touchpad.middleEmulation = true; 
  services.libinput.touchpad.tapping = true; 

  # Set your time zone.
  time.timeZone = "Europe/London";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.bug = {
    isNormalUser = true;
    description = "bug";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	wayland
	xwayland
  yambar
	kitty
	fuzzel
	vscodium
  libinput
  hyprpicker
  slurp
  grim
  wl-clipboard
  nerdfetch
  brightnessctl
  prismlauncher
  steam
  lutris
  qbittorrent
  wine
  winetricks
  unrar
  ark
  unzip
  swww
  gtk3
  gtk4
  themechanger
  pamixer

  ayu-theme-gtk

  ];

  programs.thunar.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
  ];


  system.stateVersion = "24.11"; # Did you read the comment?

}
