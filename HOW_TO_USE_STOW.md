# How to use STOW CLI

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [How to use STOW CLI](#how-to-use-stow-cli)
  - [Note](#note)
  - [Ignore given files/folders](#ignore-given-filesfolders)
  - [Running Stow (dry run)](#running-stow-dry-run)
  - [Perform stow](#perform-stow)
  - [Undo a stow](#undo-a-stow)
    - [Example](#example)

<!-- markdown-toc end -->

## Note

- Running stow: `stow (GNU Stow) version 2.3.1`.

## Ignore given files/folders

You can ignore some files and folders base on regular expression, and cusotmize
it similar to `.gitignore`, but the syntax of the `regular expression` a bit
different. `GNU Stow` is a symlink farm manager which takes distinct sets of
software and/or data located in separate directories on the filesystem, and
makes them all appear to be installed in a single directory tree. By default,
`stow` will create symlinks for all the files and directories within the
specified directory. However, you can control this behavior by using a
`.stow-local-ignore` file or a `.stow-global-ignore` file to specify patterns
for files or directories that should be ignored.

Here's how you can prevent `stow` from creating symlinks for `.git` and
`README.md`:

1. **Create a `.stow-local-ignore` file**:
   In the directory you're running `stow` from, create a file named `.stow-local-ignore`.

2. **Add ignore patterns**:
   Open `.stow-local-ignore` in a text editor and add the following lines:

```sh
^\.git$
^README\.md$
^LICENSE$
^\.gitignore$
```

These regular expressions will match `.git`, `README.md`, `LICENSE` and
`.gitignore`, instructing `stow` to ignore these files.

3. **Run `stow`**:
   Now, when you run `stow`, it should ignore `.git` and `README.md` when
   creating symlinks.

Alternatively, if you want to globally ignore these files for all `stow`
operations regardless of the directory, you can create a `.stow-global-ignore`
file in your home directory with the same content as above.

## Running Stow (dry run)

The following flag enables us to always view what we will `stow` and what will
not, without performing the command, which runs in simulation mode. This allows
us to examine the necessary modifications required to make the perfect stowing
without causing a disaster.

```sh
stow --simulate . --verbose=1
```

Now, you will see the output based on the the passed `.stow-local-ignore` file
that you specified in the directory `gdotfiles` that we want to stow

## Perform stow

Once you are satisifed with your `stow` command, you can now run the actual
stowing that will cause to create simylink to evey file in your given `DIR`
these simylinks will be created iiiin the `target`. This is the default command,

```sh
stow . --verbose=1
```

## Undo a stow

You can also check first the command using `--simulate`, for example

```sh
stow -D .  --simulate  --verbose=1
```

- To run the real command use:

```sh
stow -D --verbose=1
```

### Example

```sh
╰─ stow --simulate . --verbose=1

LINK: .config/ranger/plugins => ../../gdotfiles/.config/ranger/plugins
LINK: .config/ranger/rc.conf => ../../gdotfiles/.config/ranger/rc.conf
LINK: .config/ranger/rifle.conf => ../../gdotfiles/.config/ranger/rifle.conf
LINK: .config/alacritty/alacritty.yml => ../../gdotfiles/.config/alacritty/alacritty.yml
LINK: .config/zathura/zathurarc => ../../gdotfiles/.config/zathura/zathurarc
LINK: .config/tmux/plugins => ../../gdotfiles/.config/tmux/plugins
LINK: .aliases => gdotfiles/.aliases
LINK: .gitconfig_delta_config => gdotfiles/.gitconfig_delta_config
WARNING: in simulation mode so not modifying filesystem.
```
