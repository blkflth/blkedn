<div align="center">
  <img src=".github/assets/nixos-dark-logo.svg" width="100">
  
  <h1>dotfiles</h1>
  
  <i>JLC's NixOS Dotfiles.</i>
</div>

<video src=".github/assets/ricing.mp4>" width="1280" height="720" controls>

### Highlights:

##### Window Manager

- [`Niri`](https://github.com/YaLTeR/niri)
  - _Fluid and Intuitive Windowing System that does away with the concept of a 'desktop' entirely._

##### Desktop Shell

- [`Noctalia`](https://github.com/noctalia-dev/noctalia-shell)
  - _Flexible and Powerful Environment optimized for Niri. Used as bar, notifications, wallpaper, and system control._

##### Launcher

- [`Vicinae`](https://github.com/vicinaehq/vicinae)
  - _Raycast Inspired/Compatible Launcher. Also used for clipboard and utility functions._

---

### To-Do:

- [ ] Tweak niri layout & window rules further
- [ ] Declare Vicinae Extensions
- [ ] Go through packages and move options into ``home-manager`` wherever possible
- [x] Locate and link AppIcons for various programs (Unneeded)
- [x] Swap GNOME File Manager for Dolphin or a TUI Solution like Superfile (Using ``thunar``)
- [x] Set up Japanese IME 
- [ ] Configure font-swtiching for Japanese
- [x] Declare MIME Types to prefer Affinity Suite and bespoke programs (opted to have MIME Types handled imperatively)
- [x] Investigate Bar options outside Noctalia (Keep Noctalia as general Shell)
- [x] Swap SDDM Greeter for TUIGreet
- [x] Investigate locking down Qt Version to prevent breakage of GUIs
- [x] Symlink VSCode / Codium Config file to Nix folder so it can be edited
- [x] Swap VSCode for Codium after backing up VSIXs
- [x] Investigate niri-flake command formatting to get `spawn-at-startup` and `spawn` commands for shell-based programs working
- [x] Prune Wallpaper folder to only vibrant-color options
- [x] Investigate passing through Lutris Web calls to host (Unneeded since packaging FS for Nix)
- [x] set `prefer-no-csd`

---

Nothing super complex or special as far as NixOS settings go.
You won't encounter a ton of custom logic for different hosts, here - It's easy enough to make the needed edits to a config when setting up a new machine.

Makes generous use of imports to break up config file lengths. Home-Manager for dotfiles is used sparingly and _mostly_ with intention.

## If you wish to copy this configuration as a starting point:

- Create a new directory (I placed mine at `~/Nix`) and run the following command:

  `nix flake init -t github:blkflth/blkedn`

- Copy your `hardware-configuration.nix` from the default `/etc/nixos` location and overwrite the one here (The one here is only tracked in case of a full-or-partial system upgrade locally).

- Edit all hostname, usename, timezone and keyboard layout variables in the files imported to `host-configuration.nix`, as well as in `flake.nix` and `home.nix`.

- Remove or change the SSD bindings in `drives.nix`. If you wish to change them to what you have installed locally, run `sudo ls -l /dev/disk/by-uuid/` and `sudo ls -l /dev/disk/by-label/`. Match up the values and you should be good to go.

> _This is the equivalent to the `fstab` edits one would need do in other Linux systems (or the manual mapping in a DE like KDE Plasma.)_
> _I do not claim to be an expert, but I recommend keeping `"nofail"` as a flag at the very least so that your system will boot if you misconfigure something._

- Comment out `niri-flake.cache.enable = false;` in `programs.nix` _before_ you build, so that the niri-flake used at time of writing builds its cache correctly. Afterward, uncomment as instructed.

> _This should only need to be done once._

- Change your Icon/Wallpaper/Screen-Recording files and locations in `noctalia.nix`, as well as your geolocation for weather and your monitor output name in that same file.

> _If you elect to use the Noctalia `systemd` service instead of spawning from `niri`, It's probably best to comment this file out of `rice.nix`'s imports to start, and, after Noctalia is built, to then follow the [instructions](https://docs.noctalia.dev/getting-started/nixos/#noctalia-settings) on Noctalia's site for getting the `.json` file that's generated when editing settings through the GUI. Any system-specific values can just be copied over, and then you can uncomment the import. If using the `spawn-at-startup` option as in this config, you can check Noctalia's site and look for ``Assets/settings-default.json` to get the correct name for any setting you wish to change._

- Comment out or delete games and programs as you see fit in `progams.nix`.

  Heavy-Hitters are for install time (if not file size) are:

  _`blender`, `affinity`, `xivlauncher`._

## Notes:

The initial build will take quite some time, depending on what programs you're installing.

- If CoolerControl isn't able to see your system fans, run `lm_sensors` and follow the on-screen instructions.

  > _Thereafter, write the indicated kernel module's name into the `boot.kernelModules` field in `configuration.nix` and reboot._

- Use `Super+Grave` (Also known as "_Backtick_" or "_The Character Under Tilde_") to get an overview of basic keybindings.

> _The settings here deviate from the default niri bindings due simply to personal preference._

- `Super+PrtSc` is a normal screenshot, and requires you to paste the image elsewhere afterwards.
- `Super+Alt+PrtSc` will screenshot the entire active window and save to the `~/Pictures/Screenshots` folder.

- It is possibile to configure niri to [block out certain windows](https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesblock-out-from) when screencasting.

- By default at time of writing, hitting `Enter` on an already-open program in `Vicinae` after you bring it up with `Super+Space` will focus on that program's window.

> _Use `Shift+Enter` to open a new instance._

- If you're going to change keybinds, it's very useful to open up `wev` in a terminal to get the valid names of your keys.

> [!WARNING]
> Subject to drastic change without notice.
> There are a number of inefficiencies in the layout and setup of this config borne from the author's unfamiliarity with Nix as a language, programmatic thinking as a practice, and daily Linux use as an experience.
> Many of these will be streamlined with time, some will not.

If you wanna rewrite some shit for her, raise an issue or make a pull request.

> _Maybe you'll even get a reward._

## License

This repository is licensed under the **[MIT License](LICENSE.md)**.
