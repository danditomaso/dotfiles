# Dotfiles symlinked on my machine

### Install with stow:
```bash
stow --target .
```

### Homebrew installation:
```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```

### Zshrc configuration:
```bash
# Using stow to map non dotfile to home dir root
cd ~/dotfiles
stow --target ~/ --dotfiles zshrc
