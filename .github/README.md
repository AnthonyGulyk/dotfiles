# Anthony's Dotfiles

Personal configurations and scripts for Arch Linux, managed using a **bare Git repository** (no symlinks required).

---

## 🖥️ System Stack

| Component | Tool |
| :--- | :--- |
| **Window Manager** | [Hyprland](https://hyprland.org/) (Lua configuration) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) |
| **Shell** | [Zsh](https://www.zsh.org/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) / [Alacritty](https://alacritty.org/) |
| **Editor** | [Neovim](https://neovim.io/) |
| **App Launcher** | [Fuzzel](https://codeberg.org/dnkl/fuzzel) |
| **Notifications** | [Mako](https://github.com/emersion/mako) |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) |
| **Document Viewer** | [Zathura](https://pwmt.org/projects/zathura/) |

---

## ⚙️ How It Works

Dotfiles are tracked directly in the home directory (`$HOME`) using a bare Git repository stored at `~/docs/github/dotfiles/`.

In `~/.config/zsh/.zshrc`, the following aliases manage the repository:

```zsh
alias d='/usr/bin/git --git-dir=/home/tony/docs/github/dotfiles/ --work-tree=/home/tony'
alias ds='/usr/bin/git --git-dir=/home/tony/docs/github/dotfiles/ --work-tree=/home/tony status'
```

* **`ds`**: Quick status check of modified config files.
* **`d add -u`**: Stage all modified tracked files.
* **`d commit -m "msg"`**: Commit changes.
* **`d push`**: Push changes to GitHub.

### Automatic Package Tracking
Whenever `yay` installs, upgrades, or removes packages, a shell wrapper in `.zshrc` automatically updates:
* `~/.config/packages/pkglist.txt` (Official Arch packages)
* `~/.config/packages/aurlist.txt` (AUR packages)

---

## 🚀 Fresh Machine Installation / Recovery

To restore this exact environment on a fresh Arch Linux installation:

### 1. Install prerequisites
```bash
sudo pacman -S --needed git base-devel
```

### 2. Clone the bare repository
```bash
git clone --bare git@github.com:AnthonyGulyk/dotfiles.git $HOME/docs/github/dotfiles
```

### 3. Set temporary alias
```bash
alias d='/usr/bin/git --git-dir=$HOME/docs/github/dotfiles/ --work-tree=$HOME'
```

### 4. Checkout dotfiles
```bash
# Force checkout to overwrite default skeleton files in $HOME
d checkout -f

# Hide untracked files from git status
d config --local status.showUntrackedFiles no
```

### 5. Install `yay` (AUR helper)
```bash
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
cd /tmp/yay-bin && makepkg -si && cd -
```

### 6. Install all packages
```bash
# Install official Arch packages
sudo pacman -S --needed - < ~/.config/packages/pkglist.txt

# Install AUR packages
yay -S --needed - < ~/.config/packages/aurlist.txt
```

### 7. Reload shell
```bash
exec zsh
```
