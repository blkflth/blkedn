{pkgs ? import <nixpkgs> {}}:
with pkgs;
  stdenv.mkDerivation rec {
    pname = "firestorm-viewer";
    version = "7.2.3";
    src = fetchurl {
      url = "https://downloads.firestormviewer.org/release/linux/Phoenix-Firestorm-Releasex64_AVX2-7-2-3-80036.tar.xz";
      hash = "sha256-PzhvN3Gw+nJpIcahZpWV7Mhqy6osdnTjGCTHjso4f2o=";
    };

    meta = {
      description = "Viewer for the Second Life Virtual World";
      homepage = "https://www.firestormviewer.org/";
      downloadPage = "https://www.firestormviewer.org/linux/";
      mainProgram = "firestorm";
      platforms = ["x86_64-linux"];
    };

    desktopItem = makeDesktopItem {
      name = "firestorm";
      desktopName = "Firestorm Viewer";
      comment = "Firestorm Viewer for Second Life";
      exec = "firestorm";
      icon = "${placeholder "out"}/firestorm/firestorm_icon.png";
      categories = ["Game"];
    };

    nativeBuildInputs = [
      autoPatchelfHook
      makeWrapper
    ];
    autoPatchelfIgnoreMissingDeps = [];
    buildInputs = [
      # To figure the package out when autoPatchelf complains about a missing library:
      #  nix run github:nix-community/nix-index-database library.so
      alsa-lib
      at-spi2-atk
      cups.lib
      expat
      glib
      libdrm
      libgbm
      libgcc.lib
      libGLU
      libuuid
      libx11
      libxcomposite
      libxcrypt-legacy
      libxdamage
      libxkbcommon
      libxrandr
      nspr
      nss
      pango
    ];
    unpackPhase = ''
      mkdir -p "$out"
      tar --strip-components=1 -xf "${src}" -C "$out"
    '';
    installPhase = ''
      wrapProgram "$out"/firestorm --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          # newview/desktopnotifierlinux.cpp
          libnotify
          # For SDL to pick the pulseaudio backend.
          pulseaudio
          # [0100/000000.554252:ERROR:zygote_linux.cc(623)] Zygote could not fork: process_type gpu-process numfds 3 child_pid -1
          udev
        ]
      }

      mkdir -p "$out"/{bin,share/firestorm}
      ln -s ../firestorm "$out"/bin/firestorm
      ln -s ${desktopItem}/share/applications $out/share/
    '';
  }
