{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, fetchurl
, makeWrapper
, makeDesktopItem
, copyDesktopItems
, python3
, nodejs_22
, electron_37
, auto-patchelf
, imagemagick
}:

let
  electron = electron_37;
  nodejs = nodejs_22;
  pnpm = nodejs.pkgs.pnpm;
  pinData = import ./pin.nix;
  inherit (pinData.hashes) desktopSrcHash desktopPkgRootHash desktopPkgAppHash;
  inherit (pinData) version;
  revision = if ( pinData ? revision ) then pinData.revision else "v${version}";
  executableName = "fchat-horizon";
  windowClass = "horizon-electron";
  friendlyName = "F-Chat Horizon";
in
stdenv.mkDerivation rec {
  pname = executableName;
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "Fchat-Horizon";
    repo = "Horizon";
    rev = revision;
    hash = desktopSrcHash;
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

  pnpmDepsRoot = pnpm.fetchDeps {
    inherit
      version
      src;
    pname = "${pname}-root";
    hash = desktopPkgRootHash;
    fetcherVersion = 2;
  };

  pnpmDepsApp = pnpm.fetchDeps {
    inherit
      version
      src;
    pname = "${pname}-app";
    pnpmInstallFlags = ["--dir=electron"];
    hash = desktopPkgAppHash;
    fetcherVersion = 2;
  };

  nativeBuildInputs = [
    makeWrapper
    python3
    nodejs
    auto-patchelf
    pnpm
    imagemagick
  ] ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [ copyDesktopItems ];

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
  };

  buildInputs = [];

  postConfigure = ''
    # Because of multiple package.json's, we have to do our own pnpmConfigHook

    echo "Installing packages..."
    export HOME=$(mktemp -d)
    pushd ..
    pnpm config set manage-package-manager-versions false
    popd
    pnpm install \
      --store-dir=${pnpmDepsRoot} \
      --offline --ignore-scripts --frozen-lockfile
    pushd electron
    pnpm install \
      --store-dir=${pnpmDepsApp} \
      --offline --ignore-scripts --frozen-lockfile
    popd

    # And patch sass-embedded
    chmod -R +w ./node_modules/.pnpm/sass-embedded-linux-x64*
    auto-patchelf --paths ./node_modules/.pnpm/sass-embedded-linux-x64*
    chmod -R -w ./node_modules/.pnpm/sass-embedded-linux-x64*
  '';

  postBuild =
    lib.optionalString stdenv.hostPlatform.isDarwin ''
      cp -R ${electron.dist}/Electron.app Electron.app
      chmod -R u+w Electron.app
    ''
    + ''
    pushd electron
    pnpm build
    # using alternative method
    #pnpm exec electron-builder -- \
    #    --dir \
    #    -c.electronDist=${if stdenv.hostPlatform.isDarwin then "." else electron.dist} \
    #    -c.electronVersion=${electron.version}
    popd
  '';

  # TODO MACOS

  installPhase =
    ''
      runHook preInstall

    ''
    # WARNING WARNING WARNING macos is untested! Please help!
    + lib.optionalString stdenv.hostPlatform.isDarwin ''
      mkdir -p $out/{Applications,bin}
      mv -v electron/dist/*.app $out/Applications
      makeWrapper $out/Applications/${friendlyName}.app/Contents/MacOS/${friendlyName} $out/bin/${pname}
    ''
    + lib.optionalString (!stdenv.hostPlatform.isDarwin) ''
      mkdir -p $out/share/lib/${pname}
      #cp -r electron/dist/linux-unpacked/{locales,resources{,.pak}} $out/share/lib/${pname}
      cp -r electron/app/* $out/share/lib/${pname}

      pushd electron/build
      for i in 16 24 48 64 96 128 256; do
        mkdir -p $out/share/icons/hicolor/''${i}x''${i}/apps
        magick icon.png -background none -resize ''${i}x''${i} $out/share/icons/hicolor/''${i}x''${i}/apps/${pname}.png
      done

      popd
    ''
    + ''

      runHook postInstall
    '';

  postFixup = lib.optionalString (!stdenv.hostPlatform.isDarwin) ''
    # electron-builder needs to be fixed, using alternative
    # to be fixed: $out/share/lib/${pname}/resources/app.asar
    makeWrapper ${electron}/bin/electron $out/bin/${pname} \
      --add-flags $out/share/lib/${pname} \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}" \
      --set-default ELECTRON_FORCE_IS_PACKAGED 1 \
      --set-default ELECTRON_IS_DEV 0 \
      --inherit-argv0
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "${pname}";
      exec = "${pname} %u";
      icon = "${pname}";
      desktopName = "${friendlyName}";
      genericName = "F-Chat Client";
      comment = meta.description;
      categories = [ "Network" "Chat" "Adult" ];
      startupWMClass = "${windowClass}";
    })
  ];

  meta = with lib; {
    description = "A continuation of the heavily modified F-Chat Rising client.";
    homepage = "https://github.com/Fchat-Horizon/Horizon";
    changelog = "https://github.com/Fchat-Horizon/Horizon/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = licenses.gpl3;
    maintainers = ["Carlen White"];
    inherit (electron.meta) platforms;
    mainProgram = "${executableName}";
  };
}
