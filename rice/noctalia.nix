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
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = false;
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
        backgroundOpacity = "1.00";
        capsuleOpacity = 1;
        density = "default";
        floating = false;
        transparent = false;
        position = "top";
        marginHorizontal = 1;
        marginVertical = 0.47;
        showCapsule = true;
        showOutline = true;
        outerCorners = true;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              customIconPath = "";
              icon = "";
              useDistroLogo = true;
            }
            {
              id = "Tray";
            }
            {
              id = "Workspace";
              characterCount = 2;
              hideUnoccupied = false;
              labelMode = "index";
            }
            {
              id = "TaskbarGrouped";
              colorizeIcons = false;
              hideMode = "transparent";
              labelMode = "index";
              hideUnoccupied = true;
              showLabelsOnlyWhenOccupied = true;
            }
          ];
          center = [
            {
              id = "Clock";
              customFont = "AtkynsonMono NFP";
              formatHorizontal = "h:mm AP MM/dd";
              formatVertical = "h mm AP - MM dd";
              useCustomFont = true;
              usePrimaryColor = true;
            }
            {
              id = "NotificationHistory";
              hideWhenZero = true;
              showUnreadBadge = true;
            }
          ];
          right = [
            {
              id = "MediaMini";
              hideMode = "hidden";
              maxWidth = 175;
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = true;
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              id = "Volume";
              displayMode = "onhover";
            }
            {
              id = "SystemMonitor";
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              showMemoryAsPercent = true;
              showNetworkStats = false;
              usePrimaryColor = true;
              showDiskUsage = true;
              diskPath = [
                "/"
              ];
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
        screenRadiusRatio = 1.00;
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
        showCalendarWeather = true;
        firstDayOfWeek = -1;
        weatherShowEffects = true;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "timer-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
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
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
      };

      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        largeButtonsStyle = false;
        showNumberLabels = true;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = true;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
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
        enableClipboardHistory = false;
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
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };

      settingsVersion = 16;
      setupCompleted = true;
      templates = {
        discord = true;
        niri = true;
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
        code = true;
      };

      ui = {
        fontDefault = "AtkynsonMono NFP";
        fontDefaultScale = 1;
        fontFixed = "AtkynsonMono NFM";
        fontFixedScale = 1;
        panelsOverlayLayer = true;
        tooltipsEnabled = true;
        panelBackgroundOpacity = 0.93;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
      };

      wallpaper = {
        defaultWallpaper = "/home/jlc/Pictures/wallpapers/tokyo_night-02.png";
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
        randomIntervalSec = 1800;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.15;
        transitionType = "disc";
        panelPosition = "center";
        hideWallpaperFilenames = true;
        recursiveSearch = true;
        overviewEnabled = true;
      };

      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        tempPollingInterval = 3000;
        gpuPollingInterval = 3000;
        enableDgpuMonitoring = false;
        memPollingInterval = 3000;
        diskPollingInterval = 3000;
        networkPollingInterval = 3000;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
      };

      dock = {
        enabled = false;
        displayMode = "auto_hide";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [];
        pinnedApps = [];
        colorizeIcons = false;
        pinnedStatic = false;
        inactiveIndicators = false;
        deadOpacity = 0.6;
        animationSpeed = 1;
      };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
  };
}
