;; -*- mode: emos-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Languages
     python
     rust
     emacs-lisp
     git
     helm
     lsp
     ;;(lsp :variables lsp-rust-server 'rust-analyzer
     ;;                cargo-process-reload-on-modify t)
     csv
     shell-scripts
     yaml
     html
     emoji
     typescript
     lua
     ;;pdf  <- has a problem and it doesn't work
     ;;debug
     javascript
     ;;Emacs Basic Plugins
     auto-completion
     better-defaults
     systemd
     markdown
     ;;multiple-cursors
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     osx
     (tabs :variables tabs-highlight-current-tab 'left)

     (ranger : variables
             ranger-show-preview t)
     ;;themes-megapack
     docker
     ;;treemacs
     neotree
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-tab-key-behavior 'cycle
                      ;;:disabled-for org markdown
                      ;;auto-completion-private-snippets-directory "~/.emacs.d/snippets/")
     )
     ;; Support font ligatures (fancy symbols) in all modes
     ;; 'prog-mode for only programming languages
     ;; including text-mode may cause issues with org-mode and magit
     (unicode-fonts :variables
                    unicode-fonts-enable-ligatures t
                    unicode-fonts-ligature-modes '(prog-mode))
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;;(use-package)
                                      ;;(company-tabnine)
                                      ;; --------------------- TabNine Configurations ------------------
                                      (use-package company-tabnine ;; for using tab-nine AI auto-assistance
                                        :ensure t
                                        :config
                                        (add-to-list 'company-backends #'company-tabnine))
                                      ;; ------ Installing beacon -------
                                      (beacon)
                                      (all-the-icons-dired)
                                      (all-the-icons-completion)
                                      ;;(dap-mode) ;; <-  Layer for debugging the code (causing problem with lsp)
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; dotspacemacs-excluded-packages
   ;; '(org-projectile org-brain magit-gh-pulls magit-gitflow  evil-mc realgud tern company-tern
   ;;                  evil-args evil-ediff evil-exchange evil-unimpaired
   ;;                  evil-indent-plus volatile-highlights smartparens
   ;;                  spaceline holy-mode skewer-mode rainbow-delimiters
   ;;                  highlight-indentation vi-tilde-fringe eyebrowse ws-butler
   ;;                  ;;smooth-scrolling
   ;;                  org-repo-todo org-timer
   ;;                  livid-mode git-gutter git-gutter-fringe  evil-escape
   ;;                  leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
   ;;                  ac-ispell ace-jump-mode auto-complete auto-dictionary
   ;;                  clang-format define-word google-translate disaster epic
   ;;                  fancy-battery org-present orgit orglue spacemacs-theme
   ;;                  helm-flyspell flyspell-correct-helm clean-aindent-mode
   ;;                  helm-c-yasnippet ace-jump-helm-line helm-make magithub
   ;;                  helm-themes helm-swoop helm-spacemacs-help smeargle
   ;;                  ido-vertical-mode flx-ido company-quickhelp ivy-rich helm-purpose pyim
   ;;                  )



   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;;cyberpunk
                         ;;material
                         ;;darkokai
                         ;;doom-one-gh
                         doom-one
                         nord
                         doom-dracula
                         ;;spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("SFMono Nerd Font"
                               :size 15.0
                               :weight bold
                               :width narrow
                               :powerline-scale 1.0
                               ;; :powerline-offset 1.3
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 3.0 ;;0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; Remove all italic font style
  (setq-default dotspacemacs-configuration-layers
                '((spacemacs-theme :variables spacemacs-theme-underline-parens t)))

)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq ns-use-native-fullscreen nil)        ;; will remove the close-button bar
  (setq neo-theme 'icons)                    ;; This will show icons in neotree, instead the class icons layout
  (setq all-the-icons-scale-factor 1.0)      ;; This will control the icon size in neotree
  (setq scroll-margin 5) ; set the scroll margin to 5 lines
  ;;(setq ns-auto-hide-menu-bar t)
  ;;(add-to-list 'default-frame-alist '(undecorated . t)) ;; This will remove the close button-bar
  (set-background-color "#2d333b") ;; This will add a background similar to Github-pages
  ;; Increase the speed of mouse and cursor while scrolling
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 50) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  ;; ------------- Tab-Nine -------------------
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)
  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)
  ;; Allow the spell checking for comment only
  ;; flyspell the basics
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;; spell-check layer as well
  ;; beacon mode to allow it to be loaded
  (beacon-mode 1)
  ;; toggle the golden ratio on
  ;;(spacemacs/toggle-golden-ratio-on)
  ;; Ranger
  (setq ranger-show-dotfiles t)
  (setq ranger-parent-depth 0)


  ;; Auto-completion
  (setq company-idle-delay 1)
  ;; make deft support more note types
  (setq deft-extensions '("md" "txt" "org"))
  (setq deft-default-extension "org")
  ;; by default deft searches for notes only in the root directory, this changes this
  (setq deft-recursive t)


  ;;Disable Annoying Audio Notifications
  ;;(https://emacsredux.com/blog/2016/02/14/disable-annoying-audio-notifications/)
  (setq ring-bell-function 'ignore)

  ;; on Save remove all trailing white spaces
  (defun delete-trailing-whitespace-all ()
    "Delete trailing whitespace in all file types."
    (delete-trailing-whitespace))
  (add-hook 'before-save-hook 'delete-trailing-whitespace-all)

  ;; ------------- Rust language server configurations --------------------
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  ;; ;; format on save
  (setq rust-format-on-save t)
  ;; ;; Prettifying
  (add-hook 'rust-mode-hook
            (lambda () (prettify-symbols-mode)))
  ;; ------------- Tab Bar Customized ----------------
  ;; https://github.com/ema2159/centaur-tabs
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-height 32)
  ;;(setq centaur-tabs-close-button "X")
  ;;(setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-label-fixed-length 8)

  ;; -------- spell configuration -----------
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "english")
  ;; ---------------------------------------
  ;; Line numbers
  ;; native line numbers taking up lots of space?
  (setq-default display-line-numbers-width nil)



  ;; -------------------- Adding function to hover on definition ------------

  ;; (define-key evil-normal-state-map (kbd "gh") (lambda ()
  ;;                                                (interactive)
  ;;                                                (helm-man-woman())))

  ;; bidi aware movement keys for evil
  (define-key evil-normal-state-map "h" 'left-char)
  (define-key evil-normal-state-map "l" 'right-char)
  (define-key evil-normal-state-map [left] 'left-char)
  (define-key evil-normal-state-map [right] 'right-char)
  (define-key evil-visual-state-map "h" 'left-char)
  (define-key evil-visual-state-map "l" 'right-char)
  (define-key evil-visual-state-map [left] 'left-char)
  (define-key evil-visual-state-map [right] 'right-char)

  ;; Make movement keys work like they should
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)
  ;; ---------------- For showing documentation on hover ----------------
  ;;(define-key evil-normal-state-map (kbd "gh") 'lsp-ui-doc-show)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-position 'at-point)
  ;; smaller doc widget, and at point
  ;;(setq lsp-ui-doc-max-height 50)
  ;;(setq lsp-ui-doc-show-with-cursor t) ;;<- This one will follow the mouse input
  ;; (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-use-webkit t)
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-flycheck-list-position 'right)
  ;; (setq lsp-ui-flycheck-live-reporting t)
  (setq lsp-ui-peek-enable t)
  ;; (setq lsp-ui-sideline-actions-icon lsp-ui-sideline-actions-icon-default)
  ;; This will offer sideline information
  (setq lsp-ui-sideline-enable t)
  ;;"Configuration for user code."
  ;; ---------------- Adding icons for dired File Manager -------------
  ;; Enable icons in Dired mode
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  ;; (setq lsp-ui-sideline-ignore-duplicate t)
  ;; (setq lsp-ui-sideline-show-code-actions t)
  ;; (setq lsp-ui-sideline-show-diagnostics t)
  ;; (setq lsp-ui-sideline-show-hover t)
  ;; (define-key evil-normal-state-map (kbd "gh") (lambda () (interactive) (lsp-ui-doc-show)))
  ;; (define-key evil-normal-state-map (kbd "gh") (lambda ()
  ;;                                                (interactive)
  ;;                                                (spacemacs/describe-thing-at-point)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
   '(font-lock-comment-face ((t (:foreground "#768390"))))
   '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
   '(font-lock-keyword-face ((t (:foreground "#f47067"))))
   '(font-lock-string-face ((t (:foreground "#96d0ff"))))
   '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
   ;; This will highlight the text of -> lsp-ui-sideline-toggle-symbols-info
   '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
   '(markdown-pre-face ((t (:foreground "#f69d50"))))
   '(markdown-url-face ((t (:foreground "#96d0ff" :weight bold)))))

)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dap-mode pdf-tools all-the-icons-completion all-the-icons-dired company-tabnine yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package unfill undo-tree typescript-mode toml-mode toc-org terminal-here term-cursor tagedit systemd symon symbol-overlay string-inflection string-edit-at-point sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle slim-mode shfmt shell-pop scss-mode sass-mode rust-mode ron-mode reveal-in-osx-finder restart-emacs request ranger rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js posframe popwin poetry pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard orgit-forge org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file npm-mode nose nord-theme nodejs-repl neotree nameless mwim multi-vterm multi-term multi-line mmm-mode markdown-toc macrostep lsp-ui lsp-python-ms lsp-pyright lsp-origami lorem-ipsum livid-mode live-py-mode link-hint launchctl json-reformat json-navigator json-mode js2-refactor js-doc journalctl-mode inspector insert-shebang info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link git-gutter-fringe gh-md fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-package flycheck-elsa flycheck-bashate flx-ido fish-mode fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode doom-themes dockerfile-mode docker-tramp docker dired-quick-sort diminish devdocs cython-mode csv-mode company-web company-statistics company-shell company-quickhelp company-lua company-emoji company-anaconda column-enforce-mode code-cells clean-aindent-mode centered-cursor-mode cargo browse-at-remote blacken beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-comment-face ((t (:foreground "#768390"))))
 '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-keyword-face ((t (:foreground "#f47067"))))
 '(font-lock-string-face ((t (:foreground "#96d0ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
 '(markdown-pre-face ((t (:foreground "#f69d50"))))
 '(markdown-url-face ((t (:foreground "#96d0ff" :weight bold)))))
)
