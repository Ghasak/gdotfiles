# Configuration dotfiles farm with stow

<!-- vim-markdown-toc GitLab -->

* [Configuration dotfiles farm with stow](#configuration-dotfiles-farm-with-stow)
    * [ChangeLogs](#changelogs)
    * [Current Versions](#current-versions)
        * [Gnu-Stow restore my dot-files configuration and setup (for MACBOOK Setups):](#gnu-stow-restore-my-dot-files-configuration-and-setup-for-macbook-setups)
        * [To-do](#to-do)
    * [Adding some information](#adding-some-information)
    * [Debugging with lldb is created using](#debugging-with-lldb-is-created-using)
        * [How to Install PowerLevel10k](#how-to-install-powerlevel10k)

<!-- vim-markdown-toc -->


My custom .dot files for my machine MBP 14 stored and restored using stow.

## ChangeLogs

- `2023-10-29 22:58`: resolved the issue with the `zsh-vim-mode` confict with the `autojump`.
- `2023-10-23 00:00`: Update the .zshrc workflow - for daily activities.
- `2023-09-23 16:44`: Update the config, for ranger and other minor updates.
- `2023-06-20 18:17`: Update the anaconda to support python 3.10

## Current Versions

- Run `utilities_checker.sh` in the given repository.
  - `iTerm2.0` : Build 3.4.21
  - `zsh` : zsh 5.9 (x86_64-apple-darwin23.0
  - `.oh-my-zsh` : `d41ca84` - (HEAD -> master, origin/master) fix(docker):
    - `powerlevel10k` : `862440a` - (grafted, HEAD -> master, origin/master, origin/HEAD)
    - `zsh-vi-mode` : `46a1985` - (HEAD) fix: visual mode stuck after typing `x`.
    - `zsh-autosuggestions` : `a411ef3` - (HEAD -> master, tag: v0.7.0, origin/master, origin/HEAD)
    - `fast-syntax-highlighting`: `13d7b4e` - (HEAD -> master, origin/master, origin/HEAD) add support for `goawk`.
  - `bash`: GNU bash, version 5.2.15(1)-release (aarch64-apple-darwin22.1.0)
  - `nvim`: NVIM v0.9.2 Build type: Release LuaJIT 2.1.1692716794
  - `neovide`: neovide 0.11.2
  - `rustc`: rustc 1.73.0 (cc66ad468 2023-10-03)
  - `go`: go version go1.21.3 darwin/arm64
  - `python`: Python 3.10.9
  - node : `v20.8.0`
  - `npm`: 10.1.0
  - `clang++`: Apple clang version 15.0.0 (clang-1500.0.40.1) Target: arm64-apple-darwin23.0.0 Thread model: posix InstalledDir:
  - `lldb`: lldb-1500.0.22.8 Apple Swift version 5.9 (swiftlang-5.9.0.128.108 clang-1500.0.40.1)

### Gnu-Stow restore my dot-files configuration and setup (for MACBOOK Setups):

I have shifted my `dotfiles` now to be stored and recover with `Gnu-Stow` as a
farm of symlinks.

- [`import`] You must be inside the `dotfile` directory to allow `stow` to
  interact with the home directory (parent directory).
- When you stow files, ensure the directory of recovering the files is empty,
  otherwise (stow) command will not work.
- To stow any changes use:

```sh
# At current dot file
stow . --verbose=1
```

- To remove any stow symlink and rest to default (no symlink).

```
stow -D .
```

### To-do

Here I store the configurations that are hard to be configured by the command `stow` which are

- [x] Daily customized applications
- [x] General font directory
- [x] figlet and lolcat configurations with the font of ASCII
- [x] Applications list
- [x] Pip list
- [x] Node-js global libraries list
- [x] jupyterNotebook configurations
- [x] Stow files structure for better restoration.
- [x] Create bash script to automate installing the necessary libraries and packages.
- [x] Added the integration to zathura with ranger
- [x] Adding the Sioyek app configuration.

## Adding some information

## Debugging with lldb is created using

The current steps I followed to generate the files which are now stowed both
`./.lldbinit` and `./lldbinit.py` files. From following the steps here

- [lldbinit](https://github.com/gdbinit/lldbinit)

### How to Install PowerLevel10k

1. Install the plugin after you install the `.oh-my-zsh`

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

2. Configure it using the command `p10k configure. `, but we will stow our config file already with the file `.p10k.zsh`. We don't need this step.
3. As you can see in `.zshrc` we are sourcing the `.p10k.zsh` using

```sh
ZSH_THEME="powerlevel10k/powerlevel10k"
# Then
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

```
