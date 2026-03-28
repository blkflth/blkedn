<div align="center">
  <img src=".github/assets/nixos-dark-logo.svg" width="100">
  
  <h1>dotfiles</h1>
  
  <i>JLC's NixOS Dotfiles.</i>

[![Showcase](https://img.youtube.com/vi/pEOkPy0UQNA/0.jpg)](https://youtu.be/pEOkPy0UQNA)
</div>


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
- [x] Properly configure Home-Manager backup settings to stop service restart error for gtk-4.0 css file (no more clobbering)
- [x] Locate and link AppIcons for various programs (Unneeded)
- [x] Swap GNOME File Manager for Dolphin or a TUI Solution like Superfile (Using ``thunar``)
- [x] Set up Japanese IME 
- [x] Configure font-swtiching for Japanese
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

## If you wish to copy this configuration as a starting point or if you are reinstalling:

- Install NixOS; Do not configure a desktop environment.

- Run `sudo nano /etc/nixos/configuration.nix` - take note of the `system.stateVersion` at the bottom of the config.

- Enable flakes by adding `nix.settings.experimental-features = ["nix-command" "flakes"];` to the config.

- Add `git` and `vim` to the system packages towards the bottom of the file. 

- Run `sudo nixos-rebuid switch`.

- In the home folder, run `git clone https://github.com/blkflth/blkedn`

- Run `rm blkedn/hardware-configuration.nix`.

- Rename `~/blkedn` directory using `mv blkedn <new-name>` (this configuration assumes the new name is `~/Nix`)

- Copy your `hardware-configuration.nix` from the default `/etc/nixos` location by running `cp /etc/nixos/hardware-configuration.nix ~/Nix`.

- Edit `~/Nix/configuration.nix` and change the `system.stateVersion` to match the one from the file in `/etc/nixos`.

- Edit all hostname, usename, timezone and keyboard layout variables in the files imported to `host-configuration.nix`, as well as in `flake.nix` and `home.nix`. This config assumes the username is `jlc` and the hostname is `blkedn`.

- Remove or change the SSD bindings in `drives.nix`. If you wish to change them to what you have installed locally, run `sudo ls -l /dev/disk/by-uuid/` and `sudo ls -l /dev/disk/by-label/`. Match up the values and you should be good to go.

> _This is the equivalent to the `fstab` edits one would need do in other Linux systems (or the manual mapping in a DE like KDE Plasma.)_
> _I do not claim to be an expert, but I recommend keeping `"nofail"` as a flag at the very least so that your system will boot if you misconfigure something._

- Comment out or delete programs as you see fit in `programs.nix`.

- Run `sudo nixos-rebuil switch --flake ~/Nix#blkedn` (the hostname you configured follows the pound sign), and reboot after activating configuration with password.

- After logging in to Niri/Noctalia: Press `Super+Enter` to launch a terminal - If `fish` launches in `ghostty`, then everything has gone correctly. Run `tide configure` to be walked through setting up a prompt for the shell.

> _From this point onward, the nixos-rebuild commands are run throuh `nh` and aliased by default. Check aliases in `~/Nix/apps/fish.nix` - Look up Home-Manager options for `fish` to see what other things can be configured._

- Use `Super+Grave` (Also known as "_Backtick_" or "_The Character Under Tilde_") to get an overview of basic keybindings.

- Configure Noctalia using the GUI interface (If the bar isn't visible, use `Super+PageDown` to open it. Right-Click the bar to open the settings). After configuring things to your liking, go to the General tab at the top, hit "Copy Settings" - Open up `~/Nix/rice/settings.json` and replace the file contents with what you just copied.

- Open up a terminal and run `build` to lock in all changes.


## Notes:

- If CoolerControl isn't able to see your system fans, run `lm_sensors` and follow the on-screen instructions.

  > _Thereafter, write the indicated kernel module's name into the `boot.kernelModules` field in `configuration.nix` and reboot._

> _The settings here deviate from the default niri bindings due simply to personal preference._

- `Super+PrtSc` is a normal screenshot, and requires you to paste the image elsewhere afterwards.
- `Super+Alt+PrtSc` will screenshot the entire active window and save to the `~/Pictures/Screenshots` folder.

- It is possibile to configure niri to [block out certain windows](https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingswindow-rulesblock-out-from) when screencasting.

- By default at time of writing, hitting `Enter` on an already-open program in `Vicinae` after you bring it up with `Super+Space` will focus on that program's window.

> _Use `Shift+Enter` to open a new instance._

- If you're going to change keybinds, it's very useful to open up `wev` in a terminal to get the valid names of your keys.

- If reinstalling on a system, delete the directories `~/.steam` and `~/.local/Steam` before launching Steam so that it can rebuild those correctly.

- To configure a the _"Open Terminal Here"_ custom action in `thunar`: Open a terminal and run `whereis ghostty`. Open the custom actions configuration, and clear out the default command. Open the file picker for the executable, and use the search to find the ghostty executable in home-manager's paths. Select ghostty, and then add `-e fish` after the filled-in command.

- If you misconfigure `niri`'s `config.kdl` (located in `~/Nix/rice`), it can force the window manager to go to default settings when you log in. If this happens: Exit `niri` using `Super+Shift+E`. Go to a second TTY using `Control+Alt+F2`. Log in using your normal username and password, and then run `fish`. Run `vim Nix/rice/config.kdl` to get the file with syntax-highlighting, and make any necessary edits. After saving and exiting back to the shell, run `build`, go back to the first TTY using `Control+Alt+F1`, and log in.

> [!WARNING]
> Subject to drastic change without notice.
> There are a number of inefficiencies in the layout and setup of this config borne from the author's unfamiliarity with Nix as a language, programmatic thinking as a practice, and daily Linux use as an experience.
> Many of these will be streamlined with time, some will not.

If you wanna rewrite some shit for her, raise an issue or make a pull request.

> _Maybe you'll even get a reward._

## License

This repository is licensed under the **[MIT License](LICENSE.md)**.
