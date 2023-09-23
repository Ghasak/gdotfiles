# .dotfiles2022 Configuration farm files
My custom .dot files for my machine MBP 14 stored and restored using stow.

## ChangeLogs
- `2023-09-23 16:44`: Update the config, for ranger and other minor updates.
- `2023-06-20 18:17`: Update the anaconda to support python 3.10

# Gnu-Stow restore my dot-files configuration and setup (for MACBOOK Setups):

I  have shifted my `dotfiles` now to be stored and recover with `Gnu-Stow` as a farm of symlinks.
- [`import`] You must be inside the `dotfile` directory to allow `stow` to
  interact with the home directory (parent directory).
- When you stow files, ensure the directory of recovering the files is empty,
  otherwise (stow) command will not work.
- To stow any changes use:

```sh
# At current dot file
stow . --verbose=1
```
- To remove any stow symlink and rest to default (no symlink)
```
stow -D .
```
# To-do

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
