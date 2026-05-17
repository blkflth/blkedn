{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  makeWrapper,
  makeDesktopItem,
  copyDesktopItems,
  python3,
  nodejs,
  pnpm,
  electron_39,
  imagemagick,
  dart-sass,
  writableTmpDirAsHomeHook,
  fetchPnpmDeps,
  pnpmConfigHook,
  desktopToDarwinBundle,
  nix-update-script,
  fetchpatch,
}: let
  electron = electron_39;
in
  stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "horizon";
    version = "2.1.4";

    src = fetchFromGitHub {
      owner = "Fchat-Horizon";
      repo = "Horizon";
      rev = "v${finalAttrs.version}";
      hash = "sha256-BSqr7zC01Lwv9yUFsn4GzFo9irElMej3pGI7kTcpPxg=";
    };

    pnpmWorkspaces = ["horizon-electron"];

    pnpmDeps = fetchPnpmDeps {
      inherit
        (finalAttrs)
        pname
        version
        src
        pnpmWorkspaces
        ;
      fetcherVersion = 3;
      hash = "sha256-Cf0QTHBAUhrG+wQzAQAVeG9VCHbHy+gPVMNaHBsQpdc=";
    };

    patches = [
      /*
      (fetchpatch {
        name = "wilted-rose-theme";
        url = "https://github.com/Fchat-Horizon/Horizon/commit/50e9a0cd2623b9bc945d67f16e83ba47228e1b08.patch";
        hash = "sha256-2W8jmf6qnmgBV6IJsCwq1IjNF5lGwRJ8q7ciH9OMZcw=";
      })
      */
    ];

    nativeBuildInputs =
      [
        makeWrapper
        python3
        nodejs
        pnpm
        pnpmConfigHook
        imagemagick
        copyDesktopItems
        writableTmpDirAsHomeHook
      ]
      ++ lib.optionals stdenvNoCC.isDarwin [
        desktopToDarwinBundle
      ];

    env = {
      ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
    };

    buildInputs = [];

    buildPhase = ''
      runHook preBuild

      # force the sass npm dependency to use our own sass binary instead of the bundled one
      substituteInPlace node_modules/sass-embedded/dist/lib/src/compiler-path.js \
        --replace-fail 'compilerCommand = (() => {' 'compilerCommand = (() => { return ["${lib.getExe dart-sass}"];'

      pnpm --filter horizon-electron run webpack:prod

      pnpm exec electron-builder build \
          --projectDir ./electron \
          --dir \
          -c.electronDist=${electron.dist} \
          -c.electronVersion=${electron.version}

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/lib/${finalAttrs.pname}
      cp -r electron/dist/*-unpacked/{locales,resources{,.pak}} $out/share/lib/${finalAttrs.pname}

      pushd electron/build
      for i in 16 24 48 64 96 128 256; do
        mkdir -p $out/share/icons/hicolor/''${i}x''${i}/apps
        magick icon.png -background none -resize ''${i}x''${i} $out/share/icons/hicolor/''${i}x''${i}/apps/${finalAttrs.pname}.png
      done
      popd

      makeWrapper ${electron}/bin/electron $out/bin/${finalAttrs.pname} \
        --add-flags $out/share/lib/${finalAttrs.pname}/resources/app.asar \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}" \
        --inherit-argv0

      runHook postInstall
    '';

    desktopItems = [
      (makeDesktopItem {
        name = "${finalAttrs.pname}";
        exec = "${finalAttrs.pname} %u";
        icon = "${finalAttrs.pname}";
        desktopName = "Horizon";
        genericName = "F-Chat Client";
        comment = finalAttrs.meta.description;
        categories = ["Network" "Chat" "Adult"];
        startupWMClass = "horizon-electron";
      })
    ];

    passthru = {
      updateScript = nix-update-script {};
    };

    meta = with lib; {
      description = "The Best F-Chat 3.0 Client, No exceptions!";
      homepage = "https://horizn.moe/";
      changelog = "https://github.com/Fchat-Horizon/Horizon/blob/v${finalAttrs.version}/CHANGELOG.md";
      license = licenses.gpl3;
      maintainers = with lib.maintainers; [
        #whitehusky
      ];
      inherit (electron.meta) platforms;
      mainProgram = "${finalAttrs.pname}";
    };
  })
