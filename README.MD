# Dots - Git-powered NixOS Configuration & Dotfile Manager

A minimal yet flexible system for managing your **NixOS system configurations** and **dotfiles** using Git and scripts.

Designed to manage my dotfiles across multiple machines. Instead of relying on tools like home-manager or GNU Stow, this approach uses plain Git branches and shell scripts — no extra dependencies or state, just reproducible systems through version control.

Supports:
-  Declarative NixOS setup via `etc/nixos`
-  Dotfile management via symlinks from `home/`
-  Multi-machine support via Git branches

Current Nixos Version Used for this Project : 25.05

### 🚀 Getting Started

```bash
Fork it and Clone it to Get Started

git clone https://github.com/yourusername/Dots.git ~/Dots
cd ~/Dots

# -----------------------------------------------------------------
# Run Initial Setup to Generate you systems hardware-configurations
# -----------------------------------------------------------------
bash ./init.sh 
    after init.sh 
        You now have access to alias like
            * switch-dots-rebuild
            * switch-dots
        ( Based on ~/Dots/etc/nixos/configuration/alias.nix )

# ------------------
# Home Configuration
# ------------------
Every changes you make in  ~/Dots/home  
    just run 
        * switch-dots
    ( based on ~/Dots/scripts/switch.sh )
    it will create symlinks from ~/Dots/home to your $HOME directory, 
    inspired by GNU Stow.

# -------------------------------
# Branch Based System Management
# -------------------------------
If you're managing multiple machines (like a laptop, desktop, server, etc.)
    * Create a separate Git branch for each machine.
    * Customize your dotfiles and NixOS config in that branch.
    * Clone the repo on the new machine, switch to the right branch, and run the initial setup.

 Each branch becomes a fully isolated environment — all tracked by Git. You can experiment, roll back, or sync across machines.
``` 

### Folder Structure

```text
Dots/
├── scripts/                     # Contains helper scripts like switch.sh
├── home/                        # Mirrors your $HOME directory
│   └── .config/                 # Mirrors your ~/.config directory
└── etc/
    └── nixos/                  # Mirrors /etc/nixos for declarative system config
        ├── configuration/      # Contains modularized config (split by purpose or role)
        ├── modules/            # Custom NixOS modules (hardware, services, options)
        └── configuration.nix   # Main system entrypoint — imports everything
```

---

### etc/nixos
* `configuration/`: broken down into files like `users.nix`, `services.nix`, `networking.nix`, etc.
* `modules/`: Used when you want to define **custom NixOS modules**, such as composable hardware logic or reusable service definitions across machines.

---

### NixOS Command Reference

| Command                                                   | Description                                                   |
| --------------------------------------------------------- | ------------------------------------------------------------- |
| `nix-instantiate --parse ./file.nix`                      | Validate the syntax of a Nix file                             |
| `nixos-rebuild switch`                                    | Rebuild the system using `/etc/nixos/configuration.nix`       |
| `nixos-rebuild switch -I nixos-config=<custom path>`      | Rebuild using a **custom** `configuration.nix` path           |
| `nixos-generate-config --show-hardware-config > <target>` | Generate a fresh `hardware-configuration.nix` for your system |

---

### Alias Cheatsheet

| Alias                 | What it does                                              |
| --------------------- | --------------------------------------------------------- |
| `cd-etc-nixos`        | Shortcut to `/etc/nixos`                                  |
| `cd-home-config`      | Shortcut to `~/.config`                                   |
| `cd-dots`             | Shortcut to `~/Dots`                                      |
| `mod-dots`            | Opens the Dots directory in your text editor              |
| `switch-dots`         | Runs the dotfile symlink script (`switch.sh`)             |
| `switch-dots-rebuild` | Rebuilds NixOS using `~/Dots/etc/nixos/configuration.nix` |

---

### Scripts Flow
```
# -------
# init.sh
# -------

    * Check if hardware config exists
        It gives the user 3 options:
            [1] Delete it and regenerate
                → Removes the old hardware config
                → Runs nixos-generate-config to generate a fresh one and save it in the repo

            [2] Cancel initialization
                → Exits the script safely without doing anything.

            [3] skip generating hardware-configuration.nix
                → Keeps the existing config untouched and continues with the rest of the script.
        
    * Rebuild System Config
        → Performs a NixOS system rebuild using your custom config from the repo (not the default /etc/nixos).

    * Clean Up
        → Deletes the script after it runs once (acts like a self-destruct).

# ---------
# switch.sh
# ---------

    * Flag Handling
            It checks for optional flags:
                --skip-all-existing 
                    → skip any file that already exists
                --replace-all 
                    → force delete and relink
                no flag 
                    → show nothing, continue with default configurations
    * Enable Dotglob
        → Allow Hidden Files to be included from the process
    
    * Link home Dotfiles (excluding .config)  
        → skips the .config as it will create the symlink for all Home<User> dotfiles
    
    * Link .config DotFiles
        → same logic as the home DotFiles

    By Default Linking always prompt you for what you want to do with the DotFile
        it gives you three options
            [1] Delete it and Continue
                → Delete the file and create a symlink           

            [2] Skip File Sync
                → Skips The Current File For Synchronization

```


### 📜 License

This repo is for personal use. No guarantees, warranties, or support.

### 🙏 Acknowledgements

- Inspired by [GNU Stow](https://www.gnu.org/software/stow/) on how it handles symlinks
