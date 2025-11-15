{
  pkgs,
  inputs,
  ...
}: {
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here; defaults will
      # be deep merged with these attributes.

      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];

        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "ScreenRecorder";
            }
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            {
              id = "Bluetooth";
            }
            {
              id = "NightLight";
            }
          ];
        };
      };

      bar = {
        backgroundOpacity = "0.78";
        density = "compact";
        floating = true;
        position = "top";
        marginHorizontal = 1;
        marginVertical = 0.78;
        showCapsule = false;
        widgets = {
          left = [
            {
              customIconPath = "";
              icon = "";
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              characterCount = 2;
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
            }
            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "Taskbar";
              onlyActiveWorkspaces = true;
              onlySameOutput = true;
            }
          ];
          right = [
            {
              hideMode = "hidden";
              id = "MediaMini";
              maxWidth = 175;
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = true;
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              displayMode = "onhover";
              id = "Volume";
            }
          ];
          center = [
            {
              hideWhenZero = true;
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
            {
              customFont = "";
              formatHorizontal = "h:mm AP MM/dd";
              formatVertical = "HH mm - dd MM";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
          ];
        };
      };

      colorSchemes = {
        predefinedScheme = "Noctalia (Default)";
        darkMode = true;
        generateTemplatesForPredefined = true;
        matugenSchemeType = "scheme-content";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        schedulingMode = "off";
        useWallpaperColors = true;
      };

      dock = {
        enabled = false;
      };

      general = {
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "/home/jlc/Pictures/Icons/jlc.png";
        compactLockScreen = false;
        dimDesktop = false;
        forceBlackScreenCorners = true;
        language = "";
        lockOnSuspend = true;
        radiusRatio = 0.62;
        scaleRatio = 1;
        screenRadiusRatio = 1.6600000000000001;
        showScreenCorners = true;
      };

      location = {
        analogClockInCalendar = false;
        showCalendarEvents = true;
        showWeekNumberInCalendar = false;
        use12hourFormat = true;
        useFahrenheit = true;
        weatherEnabled = true;
        monthBeforeDay = true;
        name = "Philadelphia, USA";
      };

      notifications = {
        criticalUrgencyDuration = 15;
        doNotDisturb = false;
        location = "top";
        lowUrgencyDuration = 3;
        monitors = [
        ];
        normalUrgencyDuration = 5;
        overlayLayer = true;
        respectExpireTimeout = true;
      };

      network = {
        wifiEnabled = false;
      };

      osd = {
        autoHideMs = 2000;
        enabled = true;
        location = "top_right";
        monitors = [
        ];
        overlayLayer = true;
      };

      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "/home/jlc/Videos/";
        frameRate = 60;
        quality = "very_high";
        showCursor = false;
        videoCodec = "h264";
        videoSource = "portal";
      };

      appLauncher = {
        backgroundOpacity = 0.9;
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipboardHistory = true;
        pinnedExecs = [
        ];
        position = "center";
        sortByMostUsed = true;
        terminalCommand = "ghostty -e";
        useApp2Unit = false;
      };

      audio = {
        cavaFrameRate = 60;
        mprisBlacklist = [
        ];
        preferredPlayer = "";
        visualizerType = "wave";
        volumeOverdrive = false;
        volumeStep = 5;
      };

      settingsVersion = 16;
      setupCompleted = true;
      templates = {
        discord = false;
        discord_armcord = false;
        discord_dorion = false;
        discord_equibop = false;
        discord_lightcord = false;
        discord_vesktop = true;
        discord_webcord = false;
        enableUserTemplates = false;
        foot = false;
        fuzzel = false;
        ghostty = true;
        gtk = true;
        kcolorscheme = true;
        kitty = false;
        pywalfox = false;
        qt = true;
        vicinae = true;
      };

      ui = {
        fontDefault = "Montserrat Thin";
        fontDefaultScale = 1;
        fontFixed = "AtkynsonMono Nerd Font Mono";
        fontFixedScale = 1;
        panelsOverlayLayer = true;
        tooltipsEnabled = true;
      };

      wallpaper = {
        defaultWallpaper = "/home/jlc/Pictures/wallpapers/tokyo_night-04.png";
        directory = "/home/jlc/Pictures/wallpapers";
        enableMultiMonitorDirectories = false;
        enabled = true;
        fillColor = "#000000";
        fillMode = "crop";
        monitors = [
          {
            directory = "/home/jlc/Pictures/wallpapers";
            name = "DP-3";
            wallpaper = "";
          }
        ];
        randomEnabled = true;
        randomIntervalSec = 4140;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.15;
        transitionType = "disc";
      };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
  };
}
