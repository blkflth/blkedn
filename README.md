<div align="center">
  <img src=".github/assets/nixos-dark-logo.svg" width="100">
  
  <h1>dotfiles</h1>
  
  <i>JLC's NixOS Dotfiles.</i>
</div>

### Highlights:

##### Window Manager
- [``niri``](https://github.com/YaLTeR/niri)
    - *Fluid and Intuitive Windowing System that does away with the concept of a 'desktop' entirely.*

##### Desktop Environment
- [``Noctalia``](https://github.com/noctalia-dev/noctalia-shell) 
    - *Straightforward and Powerful Environment optimized for niri. Reduced here to a status bar with benefits.*

##### Launcher
- [``Vicinae``](https://github.com/vicinaehq/vicinae) Launcher 
    - *Raycast Inspired and Raycast Compatible Launcher. Will be customized further with time.*

--------------------------------------

Nothing super complex  or special as far as NixOS settings go.
You won't encounter a ton of custom logic for different hosts, here - It's easy enough to make the needed edits to a config when setting up a new machine.

Makes generous use of imports to break up config file lengths. Home-Manager for dotfiles is used sparingly and *mostly* with intention.


## If you wish to copy this configuration as a starting point:

 - Create a new directory (I placed mine at ``~/Nix``) and run the following command:

   ```nix flake init -t github:blkflth/blkedn```

 - Copy your ``hardware-configuration.nix`` from the default ``/etc/nixos`` location and overwrite the one here (The one here is only tracked in case of a full-or-partial system upgrade locally).

 - Edit all hostname, usename, timezone and keyboard layout variables in the files imported to ``host-configuration.nix``, as well as in ``flake.nix`` and ``home.nix``.

- Remove or change the SSD bindings in ``drives.nix``. If you wish to change them to what you have installed locally, run ``sudo ls -l /dev/disk/by-uuid/`` and ``sudo ls -l /dev/disk/by-label/``. Match up the values and you should be good to go.

>    *This is the equivalent to the ``fstab`` edits one would need do in other Linux systems (or the manual mapping in a DE like KDE Plasma.)*
>    *I do not claim to be an expert, but I recommend keeping ``"nofail"`` as a flag at the very least so that your system will boot if you misconfigure something.*

- Comment out `` niri-flake.cache.enable = false;`` in ``programs.nix`` *before* you build, so that the niri-flake used at time of writing builds its cache correctly. Afterward, uncomment as instructed.  

>    *This should only need to be done once.*

- Change your Icon/Wallpaper/Screen-Recording files and locations in ``noctalia.nix``, as well as your geolocation for weather and your monitor name in that same file. 

>    *It's probably best to comment this file out of ``rice.nix``'s imports to start, and, after Noctalia is built, to then follow the instructions on Noctalia's site for getting the ``.json`` file that's generated when editing settings through the GUI. Any system-specific values can just be copied over, and then you can uncomment the import.*

- Comment out or delete games and programs as you see fit in ``progams.nix``. 

    Heavy-Hitters are for install time (if not file size) are:

>    ``blender``, ``davinci-resolve``, `` gimp3-with-plugins``, `` inkscape-with-extensions``, ``xivlauncher``.
--------------------------------------

## Notes:

The initial build will take quite some time, depending on what programs you're installing.

- If CoolerControl isn't able to see your system fans, run ``lm_sensors`` and follow the on-screen instructions. 
>    *Thereafter, write the indicated kernel module's name  into the ``boot.kernelModules`` field in ``configuration.nix`` and reboot.*

- Use ``Super+Grave`` (Also known as "*Backtick*" or "*The Character Under Tilde*") to get an overview of basic keybindings. 

>    *The settings here deviate from the default niri bindings due simply to personal preference.*

- ``Super+PrtSc`` is a normal screenshot, and requires you to paste the image elsewhere afterwards. 
- ``Super+Alt+PrtSc`` will screenshot the entire active window and save to the ``~/Pictures/Screenshots`` folder.

- It is possibile to configure niri to block out certain windows/programs when screenshotting and screenrecording.

- By default at time of writing, hitting ``Enter`` on  an already-open program in ``Vicinae`` after you bring it up with ``Super+Space`` will focus on that program's window.

>    *Use ``Shift+Enter`` to open a new instance.*

- If you're going to change keybinds, it's very useful to open up ``wev`` in a terminal to get the valid names of your keys.

--------------------------------------
> [!WARNING]
Subject to drastic change without notice.
There are a number of inefficiencies in the layout and setup of this config borne from the author's unfamiliarity with Nix as a language, programmatic thinking as a practice, and daily Linux use as an experience.

    Many of these will be streamlined with time, some will not. 

If you wanna rewrite some shit for her, raise an issue or make a pull request.

> *Maybe you'll even get a reward.*

--------------------------------------
## License

This repository is licensed under the **[MIT License](LICENSE.md)**.
