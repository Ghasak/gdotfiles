;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
   '(lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle ;;'complete 'cycle
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 0.0)
                      ;; :config
                      ;; add-to-list 'company-backends '(company-yasnippet company-tabnine company-lsp company-capf company-anaconda)
                      ;;auto-completion-minimum-prefix-length 1
                      ;;spacemacs-default-company-backends
                      ;;'(company-files company-capf company-lsp company-yasnippet company-anaconda company-tabnine)
                      ;; (default) to complete path/directory and
                      ;;:enabled-for rust python
                      ;;auto-completion-complete-with-key-sequence "gh"
     better-defaults
     (rust :variables
           rust-backend 'lsp  ;; <- Original it was racer, but not used anymore in favor of Rust-analyzer (a.k.a. lsp)
           rust-format-on-save t
           rust-format-show-buffer nil
           ;;--------
           ;; lsp-rust-analyzer-cargo-watch-enable t
           ;; lsp-rust-analyzer-cargo-watch-command "clippy"
           ;; lsp-rust-analyzer-proc-macro-enable t
           ;; lsp-rust-analyzer-cargo-load-out-dirs-from-check t
           ;; lsp-rust-analyzer-inlay-hints-mode t
           ;; lsp-rust-analyzer-display-chaining-hints t
           ;; lsp-rust-analyzer-dijplay-parameter-hints t
           )
     ;; -----------
     ;; https://develop.spacemacs.org/layers/+lang/ess/README.html
     ;;


     (ess :variables
          ess-r-backend 'lsp)
     (python :variables
             ;;python-backend 'anaconda ;; <- doesn't workThere are two options: 'ananconda and (default) 'lsp (python-lsp-server package)
             python-formatter 'yapf
             python-format-on-save t
             python-lsp-server 'pyright ;; 'pylsp (default), 'mspyls (Microsoft python language server), 'pyright (Microsoft pyright language server)
             python-tab-width 4
             python-sort-imports-on-save t
             )
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;; ---------------------------
     ;;         C/C++ layer
     ;; https://develop.spacemacs.org/layers/+lang/c-c++/README.html
     ;; ---------------------------
     (c-c++ :variables c-c++-backend 'lsp-clangd ;; by default support clang even if we don't specify the back end.
                       ;;c-c++-dap-adapters '(dap-lldb dap-cpptools)
                       c-c++-enable-clang-format-on-save t
                       c-c++-adopt-subprojects t
                       c-c++-lsp-enable-semantic-highlight 'rainbow
                       c-c++-dap-adapters '(dap-lldb dap-cpptools)
                       c-c++-default-mode-for-headers 'c++-mode
                       c-c++-enable-organize-includes-on-save t
                       c-c++-enable-clang-format-on-save t
                       ;; Enable google-set-c-style
                       c-c++-enable-google-style t
                       c-c++-enable-google-newline t
                       ;; Projectile sub-project adoption
                       c-c++-adopt-subprojects t
            )
     (cmake :variables
            cmake-backend 'lsp) ;; you will need: pip install cmake-language-server
     ;; ---------------------------
     ;;         lsp layer
     ;; ---------------------------
     (lsp :variables
           lsp-rust-server 'rust-analyzer
           cargo-process-reload-on-modify t
           ;;lsp-rust-analyzer-server-display-inlay-hints t ;; not supported, as this feature is moved to lsp-core instead
           ;; ---------- Features for the lsp ----------------
           lsp-headerline-breadcrumb-enable t                           ; Breadcrumb trail
           lsp-headerline-breadcrumb-segments '(project file symbols)   ; namespace & symbols, no file path
           lsp-ui-peek-enable t                                         ; popups for refs, errors, symbols, etc.
           lsp-semantic-tokens-enable t                                 ; enhance syntax highlight
           lsp-treemacs-error-list-current-project-only t               ; limit errors to current project
           lsp-idle-delay 0.2                                           ; smooth LSP features response
           lsp-eldoc-enable-hover t                                     ; disable all hover actions
           ;;lsp-eldoc-hook nil
           lsp-ui-doc-enable t                                          ; doc hover popups
           lsp-ui-sideline-enable t                                     ; sidebar code actions visual indicator
           treemacs-space-between-root-nodes nil                        ; spacing in treemacs views
           lsp-lens-enable t
           lsp-log-io t                                                 ; Log client-server json communication
           lsp-enable-symbol-highlighting t
           lsp-ui-sideline-show-code-actions t
           lsp-ui-doc-delay 1.5
           ;; -----------------------------------------
           lsp-ui-doc-border (face-foreground 'default)
           lsp-ui-doc-header nil
           lsp-ui-doc-include-signature t
           lsp-ui-doc-position 'at-point ;; allow the hover menu to appear other options: 'at-point-vertically
           lsp-ui-doc-max-height 100
           lsp-ui-doc-show-with-cursor nil ;; allow to show the documentation while the cursor stay
           lsp-ui-doc-show-with-mouse t
           lsp-ui-doc-use-webkit nil ;; provide markdown support for the help documentation
           lsp-ui-flycheck-enable t
           lsp-ui-flycheck-list-position 'right
           lsp-ui-flycheck-live-reporting t
           lsp-ui-peek-enable t
           lsp-ui-sideline-actions-icon t
           ;;lsp-ui-sideline-actions-icon-default
           ;;This will offer sideline information
           lsp-ui-sideline-enable t
           )
     (dap :variables
           dap-python-debugger 'debugpy
           dap-auto-configure-mode t
           :custom
           (dap-auto-configure-features . '(sessions locals breakpoints expressions repl controls tooltip))
           dap-lldb-debug-program '("/usr/bin/lldb-vscode")
           ;;(dap-lldb-debug-program . `(,(expand-file-name "~/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin/lldb-vscode")))
           )

     emacs-lisp
     json
     (yaml :variables
           yaml-enable-lsp t)
     javascript
     html
     (tabs :variables
           tabs-highlight-current-tab 'left
           centaur-tabs-style "wave"
           )
     (search-engine :variables
                    browse-url-browser-function 'browse-url-generic
                    engine/browser-function 'browse-url-generic
                    browse-url-generic-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
                    ;;browse-url-generic-program "Google Chrome"
                    )
    ;; (go :variables
    ;;     go-backend 'lsp
    ;;     go-tab-width 4
    ;;     go-format-before-save t)
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t) ;; <- similar to vim-efl package for f/t evil enhancement.
     (colors)  ;; will show the color variate in the buffer

     command-log ;; SPC a L displays key and command history in a separate buffer
     csv
     ;; DOCKER-FILE-LSP and docker container management
     (docker :variables
             docker-dockerfile-backend 'lsp)
     (git :variables
          git-magit-status-fullscreen t
          magit-diff-refine-hunk t
          git-enable-magit-todos-plugin t

          ;; Install https://github.com/dandavison/delta for language syntax highlights in diff
          ;; git-enable-magit-delta-plugin t
          )

     ;; ------------------------------------------------------------------
     ;;                          HELM LAYER
     ;; ------------------------------------------------------------------
     (helm :variables
           helm-enable-auto-resize nil
           helm-no-header nil
           helm-position 'bottom
           spacemacs-helm-rg-max-column-number 1024
           )
     ;; ------------------------------------------------------------------
     ;;                          IVY LAYER
     ;; ------------------------------------------------------------------
     ;; https://develop.spacemacs.org/layers/+completion/ivy/README.html
     ;; (ivy :variables
     ;;      ivy-enable-advanced-buffer-information t
     ;;      ivy-enable-icons t
     ;;      ivy-use-virtual-buffers t
     ;;      ivy-count-format "(%d/%d) "
     ;;      )
     ;; ------ Markdown layer ------
     (markdown :variables markdown-live-preview-engine 'vmd)
     ;; (markdown :variables
     ;;           markdown-live-preview-engine 'vmd
     ;;           markdown-mmm-auto-modes '("c" "c++" "python" "scala" ("elisp" "emacs-lisp"))
     ;;           )
     emacs-lisp
     (multiple-cursors
      :variables
      multiple-cursors-backend  'mc;; other mode  'evil-mc (not support number)
      mc/cmds-to-run-once '(upcase-region)
      )
     osx  ;; This will allow the correct mapping for the command + v (paste)

     ;; Spacemacs Org mode
     org
     ;; (org :variables
     ;;      org-enable-github-support t
     ;;      org-enable-bootstrap-support t
     ;;      org-src-tab-acts-natively nil
     ;;      ;; org-enable-reveal-js-support t
     ;;      org-want-todo-bindings t
     ;;      org-enable-org-journal-support t
     ;;      ;;org-journal-dir "~/projects/journal/"
     ;;      ;; org-journal-file-format "%Y-%m-%d"
     ;;      ;; org-journal-date-prefix "#+TITLE: "
     ;;      ;; org-journal-date-format "%A, %B %d %Y"
     ;;      ;; org-journal-time-prefix "* "
     ;;      ;; org-journal-time-format ""
     ;;      ;;org-journal-carryover-items "TODO=\"TODO\"|TODO=\"DOING\"|TODO=\"BLOCKED\"|TODO=\"REVIEW\""
     ;;      )

     ;; Text-based file manager with preview - SPC a t r r
     (ranger :variables
             ranger-show-preview t
             ranger-show-hidden t
             ranger-cleanup-eagerly t
             ranger-cleanup-on-disable t
             ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))
     ;;(pdf-tools) ;; default (not working)
     pdf
     latex
     ;; (shell :variables
     ;;         shell-default-height 30
     ;;         shell-default-position 'bottom)
     ;; SPC ' runs shell in a popup buffer
     (shell :variables
            shell-default-shell 'vterm
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom ;; 'full
            shell-default-width 40
            shell-default-height 20)
            ;;shell-default-position 'full)


      (spell-checking :variables
                      spell-checking-enable-by-default nil
                      )
      syntax-checking
      version-control
      ;;neotree ;; <- Uses nerd icons
      (treemacs :variables ;; Using svg icons
                treemacs-indentation 1
                treemacs-use-filewatch-mode t
                treemacs-use-follow-mode t
                treemacs-use-all-the-icons-theme t
                treemacs--no-messages t
                treemacs-use-scope-type 'Perspectives
                treemacs-collapse-dirs 3

                )
      ;; Support font ligatures (fancy symbols) in all modes
      ;; 'prog-mode for only programming languages
      ;; including text-mode may cause issues with org-mode and magit
      (unicode-fonts :variables
                     unicode-fonts-enable-ligatures t
                     unicode-fonts-ligature-modes '(prog-mode))
      ;; Highlight changes in buffers
      ;; SPC g . transient state for navigating changes
      (version-control :variables
                       version-control-diff-tool 'diff-hl
                       version-control-global-margin t)
     ;;(xclipboard :variables xclipboard-enable-cliphist t)
     (bm) ;; <- BM provides visible, buffer local, bookmarks adn the ability to jump forward and backward to the next bookmarks
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
                                      (company-tabnine) ;; for using tab-nine AI auto-assistance
                                      ;; ------ Installing beacon -------
                                      (beacon)
                                      (minimap) ;; toggle using minimap-mode
                                      (all-the-icons-dired)
                                      (treemacs-evil)
                                      (nerd-icons)
                                      (helm-icons)
                                      (all-the-icons-completion)
                                      (treemacs-icons-dired)
                                      (treemacs-all-the-icons)
                                      (treemacs-tab-bar)
                                      (treemacs-nerd-icons)
                                      (nerd-icons-ibuffer)
                                      (org-bullets)
                                      (org-make-toc)
                                      (visual-fill-column)
                                      (evil-goggles
                                        :ensure t
                                        :config
                                        (evil-goggles-mode)
                                        ;; optionally use diff-mode's faces; as a result, deleted text
                                        ;; will be highlighed with `diff-removed` face which is typically
                                        ;; some red color (as defined by the color theme)
                                        ;; other faces such as `diff-added` will be used for other actions
                                        (evil-goggles-use-diff-faces))
                                      ;; This package for creating ruler
                                      (fill-column-indicator)
                                      ;; find file using autojump
                                      zoxide
                                      ;; --------------- ELLAMA CHAT ------------
                                      (ellama)
                                      ;;(ivy-posframe)
                                      ;;dired-hacks-utils ;; Adding more features for the dired
                                      ;;(highlight-indent-guides)
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; auto-highlight-symbol
                                    ;; evil-mc
                                    ;; evil-args
                                    ;; evil-unimpaired
                                    ;; evil-indent-plus
                                    ;; centered-buffer-mode
                                    ;; volatile-highlights
                                    ;; holy-mode
                                    ;; skewer-mode
                                    ;; highlight-indentation
                                    ;; vi-tilde-fringe
                                    ;; open-junk-file
                                    ;; evil-tutor
                                    ;; hl-anything
                                    ;; srefactor
                                    ;; livid-mode
                                    ;; alert
                                    ;; disable it for lispy-mode
                                    ;;https://github.com/abo-abo/lispy/issues/137
                                    ;; evil-escape
                                    ;;At first, I should disable hydra in zilongshanren layer and install clj-refactor, after it is installed.
                                    ;; I could re-enable it again in zilongshanren layer.
                                    ;; clj-refactor
                                    ;;remove from spacemacs distribution
                                    ;; neotree
                                    ;; gh-md
                                    ;; evil-lisp-state
                                    ;; spray
                                    ;;doc-view
                                    ;; lorem-ipsum
                                    ;; ac-ispell
                                    ;; ace-jump-mode
                                    ;; auto-complete
                                    ;; auto-dictionary
                                    ;;clang-format
                                    ;; define-word
                                    ;;google-translate
                                    ;; disaster
                                    ;; epic
                                    ;; fancy-battery
                                    ;; orgit
                                    ;;orglue
                                    ;;spinner
                                    ;;tagedit
                                    ;;flyspell
                                    ;;company-tern
                                    ;;projectile
                                    ;;diff-hl
                                    ;;spaceline
                                    )


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
   ;;dotspacemacs-startup-banner 'official
   ;;dotspacemacs-startup-banner 'official
   ;;dotspacemacs-startup-banner (concat dotspacemacs-directory "banner/Emacs-Logo.svg")
   ;;dotspacemacs-directory "banners/practicalli-logo.svg" banner/Emacs-Logo.svg
   ;;dotspacemacs-startup-banner "/Users/gmbp/.emacs.d/banner/Emacs-Logo.svg"
   dotspacemacs-startup-banner (concat user-emacs-directory "banner/arch.png")

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
                                (projects . 7)
                                )

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
                         ;;github-dark-vscode-theme
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
   ;;dotspacemacs-default-font '("VictorMono Nerd Font Bold" ;;"Iosevka", "VictorMono Nerd Font" ; SpaceMono Nerd Font
   ;; Currently Using: https://github.com/belluzj/fantasque-sans
   dotspacemacs-default-font (if (eq system-type 'darwin)
                                 '("Iosevka Nerd Font" ;;"Iosevka", "VictorMono Nerd Font" ; SpaceMono Nerd Font "Fantasque Sans Mono"
                                   ;;:size 15.0
                                   :size 16.0
                                   :weight Regular;; bold,light,semibold,medium,demibold; Regular
                                   :width normal ;; wide, narrow, expanded, condensed,
                                   ;;:width  normal;; wide, narrow, expanded, condensed,
                                   :powerline-scale 1.3
                                   )
                               '("VictorMono Nerd Font" ;;"Iosevka", "VictorMono Nerd Font" ; SpaceMono Nerd Font "Fantasque Sans Mono"
                                   ;;:size 15.0
                                   :size 16.0
                                   :weight Regular;; bold,light,semibold,medium,demibold; Regular
                                   :width normal ;; wide, narrow, expanded, condensed,
                                   ;;:width  normal;; wide, narrow, expanded, condensed,
                                   :powerline-scale 1.3
                                   )
                               )


   ;; (set-face-attribute 'default nil :height 150)
   ;; (spacemacs-default-theme :variables spacemacs-theme-comment-bg t
   ;;                          spacemacs-theme-org-highlight t
   ;;                          spacemacs-theme-variable-pitch-font t)

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
   dotspacemacs-display-default-layout nil

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
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

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
   dotspacemacs-maximized-at-startup nil

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
   ;;dotspacemacs-line-numbers 'relative

   dotspacemacs-line-numbers '(:relative t
     :visual t
     :disabled-for-modes dired-mode
                         doc-view-mode
                         markdown-mode
                         org-mode
                         pdf-view-mode
                         text-mode)

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
   dotspacemacs-smart-closing-parenthesis t

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
   dotspacemacs-whitespace-cleanup `trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode nil

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
   dotspacemacs-pretty-docs t

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
  ;; -------------------------------------------------------------
  ;;                     General Setting
  ;; -------------------------------------------------------------
  ;; show highlights for checking for code.
  (require 'flycheck)
  ;; -------------------------------------------------------------
  ;;                     General Setting
  ;; -------------------------------------------------------------
  (setq ns-use-native-fullscreen nil)        ;; will remove the close-button bar
  (setq neo-theme 'icons)                    ;; This will show icons in neotree, instead the class icons layout
  (setq all-the-icons-scale-factor 1.0)      ;; This will control the icon size in neotree
  (setq scroll-margin 5) ; set the scroll margin to 5 lines
  ;;(setq ns-auto-hide-menu-bar t)
  ;;(add-to-list 'default-frame-alist '(undecorated . t)) ;; This will remove the close button-bar
  (setq set-background-color "#2d333b") ;; This will add a background similar to Github-pages
  ;; Increase the speed of mouse and cursor while scrolling
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 50) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  ;; Allow the spell checking for comment only
  ;; flyspell the basics
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
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
  ;; Disable automatic screen adjustment during scrolling
  ;; vim like scroll behaviour
  ;;(setq scroll-conservatively 100)
  (setq scroll-conservatively 101)
  (setq scroll-step 1)
  ;;(setq scroll-margin 3)
  ;; Increase the fringe width
  ;;(setq-default fringe-mode 'left-only)
  (setq-default left-fringe-width 20)
  (setq-default right-fringe-width 0)
  (setq-default display-line-numbers-offset 5)
  (setq linum-relative-format "%4s ")
  ;; -------------------------------------------------------------
  ;;       Prevent from tilting for horizontal scrolling
  ;; -------------------------------------------------------------
  ;;(global-visual-line-mode -1)
  ;;(setq mouse-wheel-tilt-scroll t)
  (prefer-coding-system 'utf-8)
  (set-language-environment 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  ;; set the default encoding system
  (setq default-file-name-coding-system 'utf-8)
  ;; Treat clipboard input as UTF-8 string first; compound text next, etc.
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  ;; Global Auto Revert
  ;; A buffer can get out of sync with respect to its visited file on disk if
  ;; that file is changed by another program. To keep it up to date, you can
  ;; enable Auto Revert mode by typing M-x auto-revert-mode, or you can set it
  ;; to be turned on globally with ‘global-auto-revert-mode’. I have also turned
  ;; on Global Auto Revert on non-file buffers, which is especially useful for
  ;; ‘dired’ buffers.
  (global-auto-revert-mode 1)
  (setq global-auto-revert-non-file-buffers t)
  ;; --------------------------

  ;; --------------------------

  ;; ------------------ Text setting ----------------------------
  ;; (setq-default
  ;;  ;; Break lines at specified column (<= 80, defaults 72)
  ;;  fill-column 120
  ;;  ;; Turns on auto-fill-mode to automatically break lines
  ;;  auto-fill-function 'do-auto-fill)

  ;; -------------------------------------------------------------
  ;;                     Tabnine Config
  ;; -------------------------------------------------------------
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)
  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)
  ;; Add these after installing `Tabnine` binary using company-tabnine-install-binary'
  ;; (require 'company-tabnine)
  ;; (add-to-list 'company-backends #'company-tabnine)
  ;; -------------------------------------------------------------
  ;;                     matchit (%) Config
  ;; -------------------------------------------------------------
  (global-evil-matchit-mode 1)
  ;; -------------------------------------------------------------
  ;;                     Beacon Mode
  ;; -------------------------------------------------------------
  (beacon-mode 1)
  ;; -------------------------------------------------------------
  ;;                     Ranger Mode
  ;; -------------------------------------------------------------
  (setq ranger-show-dotfiles t)
  (setq ranger-parent-depth 0)
  ;; -------------------------------------------------------------
  ;;                     Tab Bar Customized
  ;; -------------------------------------------------------------
  ;; https://github.com/ema2159/centaur-tabs
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-height 32)
  ;;(setq centaur-tabs-close-button "X")
  ;;(setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-label-fixed-length 8)
  ;; -------------------------------------------------------------------------
  ;;                Switching between tabs using <TAB>
  ;;                       - normal buffers (*.md, .txt ..etc.)
  ;; -------------------------------------------------------------------------
  ;; faster buffer switching
  ;;(spacemacs/tabs-forward) ;;'next-buffer/previous-buffer
  ;; (define-key evil-normal-state-map (kbd "TAB") 'spacemacs/tabs-forward)
  ;; (define-key evil-normal-state-map (kbd "<backtab>") 'spacemacs/tabs-backward)
  (defun my/tab-buffer-navigate (&optional reverse)
    "Navigate through tabs in Spacemacs with Tab and Shift-Tab in normal mode."
    (interactive "P")
    (if reverse
        (if (fboundp 'spacemacs/tabs-backward)
            (spacemacs/tabs-backward)
          (previous-buffer))
      (if (fboundp 'spacemacs/tabs-forward)
          (spacemacs/tabs-forward)
        (next-buffer))))

   (with-eval-after-load 'evil
   (define-key evil-normal-state-map (kbd "TAB") 'my/tab-buffer-navigate)
   (define-key evil-normal-state-map (kbd "<backtab>") (lambda () (interactive) (my/tab-buffer-navigate t))))
   ;; Org Mode switcher
   ;; -------------------------------------------------------------------------
   ;;                Switching between tabs using <TAB>
   ;;                       - pdf-view-mode buffers (*.pdf)
   ;; -------------------------------------------------------------------------
   (defun my/pdf-view-mode-tab-buffer-navigate (&optional reverse)
     "Navigate through tabs in pdf-view-mode with Tab and Shift-Tab in normal mode."
     (interactive "P")
     (if reverse
         (if (fboundp 'spacemacs/tabs-backward)
             (spacemacs/tabs-backward)
           (previous-buffer))
       (if (fboundp 'spacemacs/tabs-forward)
           (spacemacs/tabs-forward)
         (next-buffer))))

   (defun my/pdf-view-mode-keybindings ()
     (when (eq major-mode 'pdf-view-mode)
       (local-set-key (kbd "<tab>") 'my/pdf-view-mode-tab-buffer-navigate)
       (local-set-key (kbd "<backtab>") (lambda () (interactive) (my/pdf-view-mode-tab-buffer-navigate t)))))
   (add-hook 'pdf-view-mode-hook 'my/pdf-view-mode-keybindings)

   ;; -------------------------------------------------------------------------
   ;;                Switching between tabs using <TAB>
   ;;                       - image-mode buffers (*.png, *.jpg ..etc.)
   ;; -------------------------------------------------------------------------
   (defun my/image-mode-tab-buffer-navigate (&optional reverse)
     "Navigate through tabs in image-mode with Tab and Shift-Tab in normal mode."
     (interactive "P")
     (if reverse
         (if (fboundp 'tab-bar-switch-to-prev-tab)
             (spacemacs/tabs-backward)
           (previous-buffer))
       (if (fboundp 'tab-bar-switch-to-next-tab)
           (spacemacs/tabs-forward)
         (next-buffer))))

   (defun my/image-mode-keybindings ()
     (when (eq major-mode 'image-mode)
       (local-set-key (kbd "<tab>") 'my/image-mode-tab-buffer-navigate)
       (local-set-key (kbd "<backtab>") (lambda () (interactive) (my/image-mode-tab-buffer-navigate t)))))
   (add-hook 'image-mode-hook 'my/image-mode-keybindings)
   ;; -------------------------------------------------------------------------

   ;; (with-eval-after-load 'evil
   ;;   (define-key evil-normal-state-map (kbd "TAB") 'centaur-tabs-forward)
   ;;   (define-key evil-normal-state-map (kbd "<backtab>") (lambda () (interactive) (centaur-tabs-backward))))
   ;; --------------- using also for pdf -------------------
   ;; Enable tab-line-mode for tabbed navigation
   ;; (defun my/pdfview-mode-keybindings ()
   ;;   (when (eq major-mode 'PDFView)
   ;;     (define-key evil-normal-state-map (kbd "TAB") 'next-buffer)
   ;;     (define-key evil-normal-state-map (kbd "<backtab>") 'previous-buffer)))
   ;; (add-hook 'after-change-major-mode-hook 'my/pdfview-mode-keybindings)

   ;; (defun my/pdfview-mode-keybindings ()
   ;;   (with-eval-after-load 'evil
   ;;   (when (eq major-mode 'pdf-view-mode)
   ;;     (define-key evil-normal-state-map (kbd "TAB") 'next-buffer)
   ;;     (define-key evil-normal-state-map (kbd "<backtab>") (lambda () (interactive) ('previous-buffer))))))
   ;; (add-hook 'after-change-major-mode-hook 'my/pdfview-mode-keybindings)


  ;; ------------------- Evil Key bindings ----------------------
  ;; Notice it will alter the keybinding above of windows
  ;; to cycle between buffers use 'ace-select-window
  ;; ------------------- Navigation among opened buffered --------
  ;; Window navigation key bindings
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  ;; ----------- Moving block of code in visual mode ------------
  ;; (define-key evil-visual-state-map (kbd "C-j") (concat ":m '>+1" (kbd "RET") "gv=gv"))
  ;; (define-key evil-visual-state-map (kbd "C-k")   (concat ":m '<-2" (kbd "RET") "gv=gv"))
  ;; (define-key evil-normal-state-map (kbd "C-j") (concat ":m +1" (kbd "RET") "=="))
  ;; (define-key evil-normal-state-map (kbd "C-k")   (concat ":m -2" (kbd "RET") "==")) (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  ;; Assign C-j to drag-stuff-down in evil visual mode
  (define-key evil-visual-state-map (kbd "C-j") 'drag-stuff-down)
  ;; Assign C-k to drag-stuff-up in evil visual mode
  (define-key evil-visual-state-map (kbd "C-k") 'drag-stuff-up)
  ;; -------------------------------------------------------------------------
  ;; this keybinding allow to center while using { and }, based on zz
  (define-key evil-normal-state-map (kbd "}") (lambda () (interactive) (evil-forward-paragraph) (evil-scroll-line-to-center nil)))
  (define-key evil-normal-state-map (kbd "{") (lambda () (interactive) (evil-backward-paragraph) (evil-scroll-line-to-center nil)))
  ;; (define-key evil-normal-state-map (kbd "n") (lambda () (interactive) (evil-search-next) (evil-scroll-line-to-center nil)))
  ;; (define-key evil-normal-state-map (kbd "N") (lambda () (interactive) (evil-search-previous) (evil-scroll-line-to-center nil)))
  ;; -------------------------------------------------------------------------
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

  ;; Easy way to kill your buffer
  ;;previously it was mapped to -> (spacemacs/prompt-kill-emacs)
  (spacemacs/set-leader-keys
    "q q" 'spacemacs/kill-this-buffer ;; It will kill the given buffer,
    )
  ;; Open new emacs frame
  (define-key evil-normal-state-map (kbd "H-e") 'make-frame) ;; H in mac is command key (this keybinding will open new instance of emacs)
  ;;

  ;; -------------------------------------------------------------
  ;;             EVIL KEYBINDING FOR PROGRAMMING
  ;; -------------------------------------------------------------
  ;; This will allow us to back to the right window using C-l easily
  (with-eval-after-load 'treemacs
    (define-key treemacs-mode-map (kbd "C-l") 'evil-window-right))

  ;; ------------------ RUST ------------------------
  ;; Ensure that the Rustic package is loaded before we attempt to modify key bindings
  ;; This will allow in the shell navigation after hitting <space>mcx to excuse the buffer.
  (with-eval-after-load 'rustic-cargo
    ;; Check if 'evil-window-left is a valid command
    (when (fboundp 'evil-window-left)
      ;; Map 'C-h' to 'evil-window-left' in 'rustic-cargo-run-mode-map
      (define-key rustic-cargo-run-mode-map (kbd "C-h") 'evil-window-left)))
  ;; -------------------------------------------------------------
  ;;                   PDF evil-model support
  ;; This will remove the yellow frame around the opened pdf
  ;; -------------------------------------------------------------
 (add-hook 'pdf-view-mode-hook
           (lambda ()
             (set (make-local-variable
                   'evil-evilified-state-cursor)
                  (list nil))))
  ;; -------------------------------------------------------------
  ;;                    Projectile Manager
  ;;          This formula similar how (general) works
  ;; -------------------------------------------------------------
  (spacemacs/set-leader-keys
    "p s" 'projectile-save-project-buffers
    "p /" 'projectile-grep
   )
  ;; -------------------------------------------------------------
  ;;                     dired file manager Customized
  ;; -------------------------------------------------------------

  (with-eval-after-load 'dired
    ;;(define-key dired-mode-map (kbd "M-p") 'peep-dired)
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file))
  ;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode) ;;<- give us the nerd icons (you need all-the-icons-dired)
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons")
  (add-hook 'dired-mode-hook 'treemacs-icons-dired-mode)  ;;<- give us the svg icons (you need treemacs-icons-dired)
  ;; With dired-open plugin, you can launch external programs for certain extensions
  ;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
  (setq delete-by-moving-to-trash t) ;; will allow to send deleted files to the trash, instead permanently delete them.
  (setq dired-open-extensions '(("pdf" . "/opt/homebrew/bin/zathura")
                                ("mp4" . "mpv")))

  ;; ----------- open files in split new tab not new buffer ------
  ;; Open files in vertical split in dired
   (setq dired-dwim-target t)

   ;; ;; Open files in tab rather than a new buffer
   ;; (defun spacemacs//dired-find-file-default ()
   ;;   (interactive)
   ;;   (let ((file (dired-get-file-for-visit)))
   ;;     (if (file-directory-p file)
   ;;         (dired-find-alternate-file)
   ;;       (condition-case err
   ;;           (find-file-other-window file)
   ;;         (error (dired-log "find-file-other-window" err))))))
   ;; (advice-add 'dired-find-file :override #'spacemacs//dired-find-file-default)
   ;; -------------------------------------------------------------
   ;;             zoxide for autojump to dir
   ;; -------------------------------------------------------------
   (defun dired-jump-with-zoxide (&optional other-window)
     (interactive "P")
     (zoxide-open-with nil (lambda (file) (dired-jump other-window file)) t))
   (define-key evil-normal-state-map (kbd "g z") 'zoxide-find-file)
   ;;(spacemacs/set-leader-keys "gz" 'zoxide-find-file)  ; binds to 'SPC gz'

   ;; -------------------------------------------------------------
   ;;     All to open several marked files at once in dired
   ;;      1. first mark all the files using (m) in dired mode
   ;;      2. no, you can use <leader>o, it will open all the files at once
   ;; -------------------------------------------------------------
   ;; (define-key dired-mode-map (kbd "C-c C-o")
   ;;   (lambda ()
   ;;     (interactive)
   ;;     (mapc #'find-file (reverse (dired-get-marked-files)))))
   ;; --- another may to achieve ----
   (defun open-several-files-at-once ()
     (interactive)
     (mapc #'find-file (reverse (dired-get-marked-files))))
   (spacemacs/set-leader-keys "o" 'open-several-files-at-once)

   ;; -------------------------------------------------------------
   ;; Open files in dired mode using 'open' in macOS
   ;; Similar to <leader>bf
   ;; https://jblevins.org/log/dired-open
   ;; -------------------------------------------------------------
   (eval-after-load "dired"
     '(progn
        (define-key dired-mode-map (kbd "C-c C-o")
          (lambda () (interactive)
            (let ((fn (dired-get-file-for-visit)))
              (start-process "default-app" nil "open" fn))))))
  ;; -------------------------------------------------------------
  ;;                  emacs print to pdf in OSX
  ;; https://gist.github.com/maltefiala/1048e313111410c12d3e71d1d813cabc
  ;; -------------------------------------------------------------
  ;; Adapted following script to OSX:
  ;; https://genomeek.wordpress.com/2013/03/08/emarch-2-create-a-pdf-with-highlighted-code-source/
  (defun print-to-pdf ()
    (interactive)
    (ps-spool-buffer-with-faces)
    (switch-to-buffer "*PostScript*")
    (write-file "tmp.ps")
    (kill-buffer "tmp.ps")
    (setq cmd (concat "pstopdf tmp.ps -o " (buffer-name) ".pdf"))
    (shell-command cmd)
    (shell-command "rm tmp.ps")
    (message (concat "File printed in : "(buffer-name) ".pdf"))
    )
  ;; -------------------------------------------------------------
  ;;                    Dap (debugger) path
  ;; -------------------------------------------------------------
  ;;(setq dap-gdb-lldb-path "/usr/bin/lldb")
   ;; (with-eval-after-load 'lsp-rust
   ;;   (setq dap-gdb-lldb-path "/Users/gmbp/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi")
   ;;   (require 'dap-lldb)        ;; I don't need this for now as I use lldb-mi
   ;;   (require 'dap-cpptools)    ;; for linux you will need this also
   ;;                              ;;sudo apt-get install libtool-bin
   ;;                              ;;sudo apt-get install libvterm-bin
   ;; )
  ;; -------------------------------------------------------------
  ;;                   LISP (configurations)
  ;; -------------------------------------------------------------

  ;; ;; ---------------- Rust -------------------------
  (add-hook 'rust-mode-hook
            (lambda () ;;(prettify-symbols-mode)
              (setq lsp-inlay-hint-enable t)
              ))

  (add-hook 'c-c++-mode-hooks
            (lambda ()
              (setq lsp-inlay-hint-enable t)
              ))

  (add-hook 'python-mode-hook
            (lambda ()
              (setq lsp-inlay-hint-enable t)
              ))

  ;; -------------------------------------------------------------
  ;;               Which Python Interpreter
  ;; -------------------------------------------------------------
  (setq python-shell-interpreter (expand-file-name "anaconda3/bin/python3" (getenv "HOME")))
  ;; -------------------- Rlang -------------------
  (with-eval-after-load 'ess
    (add-hook 'ess-mode-hook #'lsp))

  ;; ;; ---------------- C++ -------------------------
  ;;(setq-default helm-make-build-dir "build/debug/")
  ;; It will look for a file .dir-local-l and load the variable you put, and it will tell the make how to build your C++ project.
  (put 'helm-make-build-dir 'safe-local-variable 'stringp)
  ;; For dap-mode using the cpptools, it is required the library,
  ;; We must first use: dap-cpptools-setup
  (require 'dap-cpptools)
;; -------------------------------------------------------------
;;             Load Env variables (.envrc)
;;         For a given project you must provide
;;         the directory for the .env, or .envrc
;; -------------------------------------------------------------
;; Project RaylibEngine (hint: dotspacemacs-directory refer to
;; the location where the .spacemacs is located, which our home directory)
(load-env-vars (concat dotspacemacs-directory "Desktop/devCode/cppDev/RaylibEngine/.envrc"))
(load-env-vars (concat dotspacemacs-directory "Desktop/devCode/cppDev/AnimationEngineCPP/.envrc"))
;; -------------------------------------------------------------
;;            Allow to detect the C files
;; -------------------------------------------------------------
(push '("C" "h") projectile-other-file-alist)
;; -------------------------------------------------------------
;; LSP generic
;; Hover on doc -----------------------------------------------
;;(define-key evil-normal-state-map (kbd "g h") 'lsp-ui-doc-show) ;;<- working
;; The following function will accept (gh) to hover over
;; documentations while accepting also to untoggle the lsp-ui-doc-show
;; with both (gh or escape)
(defvar my-lsp-ui-doc-show-toggled nil
  "Variable to keep track of the toggle state of `lsp-ui-doc-show'.")

  (defun my-toggle-lsp-ui-doc-show ()
    "Toggle the display of `lsp-ui-doc-show' buffer."
    (interactive)
    (if my-lsp-ui-doc-show-toggled
        (lsp-ui-doc-hide)
      (lsp-ui-doc-show))
    (setq my-lsp-ui-doc-show-toggled (not my-lsp-ui-doc-show-toggled)))

  (defun my-untoggle-lsp-ui-doc-show ()
    "Untoggle `lsp-ui-doc-show' buffer using Escape key."
    (interactive)
    (when my-lsp-ui-doc-show-toggled
      (lsp-ui-doc-hide)
      (setq my-lsp-ui-doc-show-toggled nil))
    (evil-normal-state))

  (define-key evil-normal-state-map (kbd "g h") 'my-toggle-lsp-ui-doc-show)
  (define-key evil-normal-state-map (kbd "<escape>") 'my-untoggle-lsp-ui-doc-show)
  ;;-------------------------------------------------------------
  ;; smart doc lookup
  ;; (define-key evil-normal-state-map (kbd "g y") 'spacemacs/evil-smart-doc-lookup)
  ;;(define-key evil-normal-state-map (kbd "g r") 'spacemacs/evil-smart-doc-lookup)
  ;;-------------------------------------------------------------
  ;;-------------------------------------------------------------
  (defun my/evil-smart-doc-lookup ()
    "Lookup documentation for the symbol at point in a vertical split."
    (interactive)
    ;; Store the original values of split thresholds
    (let ((original-split-width-threshold split-width-threshold)
          (original-split-height-threshold split-height-threshold))
      ;; Set the values for vertical split
      (setq split-width-threshold nil)
      (setq split-height-threshold 160)
      ;; Call the original documentation lookup function
      (spacemacs/evil-smart-doc-lookup)
      ;; Restore the original values after the call
      (setq split-width-threshold original-split-width-threshold)
      (setq split-height-threshold original-split-height-threshold)))

  ;; Bind the new function to "g r" in normal and visual states
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "g r") 'my/evil-smart-doc-lookup)
    (define-key evil-visual-state-map (kbd "g r") 'my/evil-smart-doc-lookup))

  ;;-------------------------------------------------------------




  ;;(setq lsp-ui-doc-border (face-foreground 'default))
  ;;(setq lsp-ui-doc-enable t)
  ;;(setq lsp-ui-doc-header t)
  ;;(setq lsp-ui-doc-include-signature t)
  ;;(setq lsp-ui-doc-position 'at-point) ;; allow the hover menu to appear
  ;;(setq lsp-ui-doc-position 'at-point-vertically) ;; allow the hover menu to appear
  ;; on top of the keyword that you hover at.
  ;; smaller doc widget, and at point
  ;;(setq lsp-ui-doc-max-height 50)
  ;;(setq lsp-ui-doc-show-with-cursor t)
  ;; (setq lsp-ui-doc-show-with-mouse nil)
  ;;(setq lsp-ui-doc-use-webkit t)
  ;;(setq lsp-ui-flycheck-enable t)
  ;;(setq lsp-ui-flycheck-list-position 'right)
  ;; (setq lsp-ui-flycheck-live-reporting t)
  ;;(setq lsp-ui-peek-enable t)
  ;; (setq lsp-ui-sideline-actions-icon lsp-ui-sideline-actions-icon-default)
  ;; This will offer sideline information
  ;;(setq lsp-ui-sideline-enable t)
  ;; -------------------------------------------------------------
  ;;                   Toggle vterm (Space + \)
  ;; -------------------------------------------------------------
  (defun my-toggle-vterm-vertical-split ()
    "Toggle the Vterm window by opening or closing it."
    (interactive)
    (let ((vterm-buffer (get-buffer "*vterm*")))
      (if (and vterm-buffer (get-buffer-window vterm-buffer))
          (delete-window (get-buffer-window vterm-buffer))
        (progn
          (split-window-right)
          (other-window 1)
          ;;(vterm "/bin/zsh")))))
          (vterm)))))
  ;; -- Open the shell vertically
     (spacemacs/set-leader-keys "\\" 'my-toggle-vterm-vertical-split)
  ;; -- Open the shell horizontally
  ;;(spacemacs/set-leader-keys "\\" 'spacemacs/default-pop-shell)

  ;; -------------------------------------------------------------
  ;;                  Yasnippets!
  ;; -------------------------------------------------------------
  (setq yas-snippet-dirs
        '("~/.emacs.d/private/snippets"                 ;; personal snippets
          "~/.emacs.d/elpa/28.2/develop/yasnippet-snippets-20230314.2056/snippets/"))
          ;; "~/.emacs.d/elpa/28.2/develop/yasnippet-snippets-20230314.2056/snippets/python-mode/"
          ;; "~/.emacs.d/elpa/28.2/develop/yasnippet-snippets-20230314.2056/snippets/rust-mode/"
  ;;(yas-global-mode 1)
  ;; For loading auto-completion for python
  ;; (eval-after-load "company"
  ;;   ;;'(add-to-list 'company-backends '(company-anaconda company-tabnine))
  ;;   '(add-to-list 'spacemacs-default-company-backends '(company-files  company-capf company-yasnippet company-anaconda company-tabnine) );; (default) to complete path/directory and
  ;;       )

  ;; (eval-after-load "company"
  ;; ;; (add-to-list 'yas-snippet-dirs (expand-file-name
  ;; ;;                                 "~/.emacs.d/elpa/28.2/develop/yasnippet-snippets-20230314.2056/snippets/"))
  ;; )
  ;;(require 'company-yasnippet)
  ;;(add-to-list 'company-backends #'company-yasnippet)
  ;; -------------------------------------------------------------
  ;;            Auto-completion - Back End Support
  ;; -------------------------------------------------------------
  (require 'company-yasnippet)
  (require 'company-tabnine)
  ;; company-lsp is no longer supported
  ;;(push 'company-lsp company-backends)
  (add-to-list 'company-backends '(company-yasnippet company-tabnine  company-capf company-anaconda))
  ;; ---------- this will not work ---------
  ;; To alter your default backends for completion, you can also include in your spacemacs-default-company-backends
  ;; (add-to-list 'spacemacs-default-company-backends '(company-yasnippet company-tabnine company-lsp company-capf company-anaconda
  ;; company-semantic company-dabbrev-code company-gtags company-etags company-keywords
  ;; company-files company-dabbrev))
  ;; ((company-yasnippet company-tabnine company-lsp company-capf company-anaconda)
  ;;  (company-semantic company-dabbrev-code company-gtags company-etags company-keywords)
  ;;  company-files company-dabbrev)
  ;; The above completions are now added to the global which we have
  ;; ((company-yasnippet company-tabnine company-lsp company-capf company-anaconda)
  ;; company-bbdb company-semantic company-cmake company-capf company-clang company-files
  ;; (company-dabbrev-code company-gtags company-etags company-keywords)
  ;; company-oddmuse company-dabbrev)

  ;; -------------------------------------------------------------
  ;;                   org-mode - Config
  ;; -------------------------------------------------------------
  (with-eval-after-load 'org
        ;; -------------------------------------------------------------------------
        ;;                Switching between tabs using <TAB>
        ;;                       - org-mode buffers (*.org)
        ;; -------------------------------------------------------------------------

        (defun my/org-mode-tab-buffer-navigate (&optional reverse)
          "Navigate through tabs in Org-mode with Tab and Shift-Tab in normal mode."
          (interactive "P")
          (if reverse
              (if (fboundp 'spacemacs/tabs-backward)
                  (spacemacs/tabs-backward)
                (previous-buffer))
            (if (fboundp 'spacemacs/tabs-forward)
                (spacemacs/tabs-forward)
              (next-buffer))))

        (defun my/org-mode-keybindings ()
          (when (eq major-mode 'org-mode)
            (define-key evil-normal-state-local-map (kbd "<tab>") 'my/org-mode-tab-buffer-navigate)
            (define-key evil-normal-state-local-map (kbd "<backtab>") (lambda () (interactive) (my/org-mode-tab-buffer-navigate t)))))
        (add-hook 'org-mode-hook 'my/org-mode-keybindings)
        ;;
        ;; -------------------------------------------------------------------------
        ;;                 Org-mode Layout
        ;; -------------------------------------------------------------------------
        ;; (evil-define-key 'insert org-mode-map (kbd "<tab>") #'org-cycle) ;; Only in insert mode you can use TAB to fold/unfold your headers
        ;; ---------- general setting --------
        (setq org-src-tab-acts-natively nil) ;; very important to prevent from the mapping the `RET` to open at point

        ;; From the Org-layer documentations, you must wrap your org with the with-eval-after-load
            (defun efs/org-mode-setup ()
              (org-indent-mode)
              (variable-pitch-mode 1)
              (visual-line-mode 1))
              ;; Org Mode Configuration ------------------------------------------------------
              (defun efs/org-font-setup ()
                ;; Replace list hyphen with dot
                (font-lock-add-keywords 'org-mode
                                        '(("^ *\\([-]\\) "
                                          (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

                ;; Set faces for heading levels
                (dolist (face '((org-level-1 . 1.5)
                                (org-level-2 . 1.4)
                                (org-level-3 . 1.3)
                                (org-level-4 . 1.2)
                                (org-level-5 . 1.1)
                                (org-level-6 . 1.1)
                                (org-level-7 . 1.1)
                                (org-level-8 . 1.1)))
                  ;; set the headers
                  (set-face-attribute (car face) nil :font "SF Pro" :weight 'bold :height 200)
                  ;; Set the fixed pitch face (tags, ~text~, =text=)
                  (set-face-attribute 'fixed-pitch nil :font "VictorMono Nerd Font" :height 150 :weight 'bold)
                  ;; Set the variable pitch face (text font )
                  (set-face-attribute 'variable-pitch nil :font "VictorMono Nerd Font" :height 150 :weight 'bold)
                  )

                ;; Ensure that anything that should be fixed-pitch in Org files appears that way
                (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
                (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
                (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
                (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
                (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
                (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
                (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

              (use-package org
                :hook (org-mode . efs/org-mode-setup)
                :config
                (setq org-ellipsis " ▼")
                (efs/org-font-setup)
                (setq org-todo-keywords
                      '((sequence "TODO(t!)" "NEXT(n!)" "DOINGNOW(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "|" "CANCELLED(c!)" "DONE(F!)")))
                (setq org-todo-keyword-faces
                      '(("TODO" . org-warning)
                        ("DOINGNOW" . "#E35DBF")
                        ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
                        ("DELEGATED" . "pink")
                        ("NEXT" . "#008080")))
                ;;(setq org-superstar-headline-bullets-list '("◉" "○" "■" "◆" "▲" "▶"))
                (setq org-superstar-headline-bullets-list '("◉" "○" "◉" "○"  "◉" "○"))
                (setq org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦))) ; changes +/- symbols in item lists
                (setq org-hide-emphasis-markers t
                      org-table-convert-region-max-lines 20000
                      )
                )

              (use-package org-bullets
                :after org
                :hook (org-mode . org-bullets-mode)
                :custom
                (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


              ;; -------- For using visual-fill with org mode --------
              (defun efs/org-mode-visual-fill ()
                (setq visual-fill-column-width 120
                      visual-fill-column-center-text t)
                     (visual-fill-column-mode 1))

              (use-package visual-fill-column
                :hook (org-mode . efs/org-mode-visual-fill))

              ;; ===============================================
              ;;          DT - Additional org-helper packages
              ;; ===============================================
              (add-hook 'org-mode-hook #'org-make-toc-mode)
              ;; ===============================================
              ;;          Futuristic org-mode layouts
              ;; https://jft.home.blog/2019/07/17/use-unicode-symbol-to-display-org-mode-checkboxes/
              ;; ===============================================
              ;; ---------- To do task check-box --------------
              (add-hook 'org-mode-hook (lambda ()
                                        "Beautify Org Checkbox Symbol"
                                        (push '("[ ]" . "") prettify-symbols-alist)
                                        (push '("[X]" . "" ) prettify-symbols-alist) ;; 󰡖   
                                        (push '("[-]" . "󰡖" ) prettify-symbols-alist)
                                        (prettify-symbols-mode)))

              ;;You can also use font-lock-add-keywords to add a different style for
              ;;checked boxes, like what I did below, adding a strike-through style:
              ;; (defface org-checkbox-done-text
              ;;   '((t (:foreground "#71696A" :strike-through t)))
              ;;   "Face for the text part of a checked org-mode checkbox.")
              ;; (font-lock-add-keywords
              ;;  'org-mode
              ;;  `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
              ;;     1 'org-checkbox-done-text prepend))
              ;;  'append)
              ;; Enable custom bullets for TODO items
              ;; ----------------- TODO SUPERSTART SPECIAL TODO -------------
              ;; https://www.reddit.com/r/spacemacs/comments/hakh9c/changing_org_bullet_list/
              ;; -------------- Setting my ---------------
              (setq org-directory "~/org-files/")
              ;; =============================================
              ;;          DT - Org Agenda Customization
              ;; =============================================
              ;; (with-eval-after-load 'org-agenda
              ;;   (custom-set-faces
              ;;    '(org-agenda-date-today
              ;;      ((t (:inherit org-agenda-date :weight bold :foreground "#99D19C" :height 1.5))))
              ;;    )
              ;;   )
              ;; =============================================
              ;;          - Org custom Shortcuts
              ;; =============================================
              ;; (spacemacs/declare-prefix "o" "own-menu")
              ;; (spacemacs/set-leader-keys "os" 'org-save-all-org-buffers)
              ;; (spacemacs/set-leader-keys "oi" 'helm-org-agenda-files-headings)
    )




;; -------------------------------------------------------------
;;                   Ibuffer-mode - Config.
;;  Run: M-x nerd-icons-install-fonts
;; -------------------------------------------------------------
;; --------------------- nerd fonts -------------------------
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)
;; Whether display the icons.
(setq nerd-icons-ibuffer-icon t)
;; Whether display the colorful icons.
;; It respects `nerd-icons-color-icons'.
(setq nerd-icons-ibuffer-color-icon t)
;; The default icon size in ibuffer.
(setq nerd-icons-ibuffer-icon-size 1.2)
;; Use human readable file size in ibuffer.
(setq  nerd-icons-ibuffer-human-readable-size t)
;; A list of ways to display buffer lines with `nerd-icons'.
;; See `ibuffer-formats' for details.
;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple icons simultaneously,
;; you can try setting the following variable
(setq inhibit-compacting-font-caches t)

;; -------------------------------------------------------------
;;                   helm-mode - Config.
;; -------------------------------------------------------------
;;(add-to-list 'load-path "~/.emacs.d/private/helm-icons/") ;; this is for helm-ff
;; Version Control - Magit & Forge
;; You can also replace, (helm-icons) package in he section (additional-packages)
;; and remove the code between (from here -> to here),
;; ---------- From here -----------
;; You must evaluate this code here a head of calling helm-icons-enable function (inside the script)
;;(setq helm-icons-file (file-truename (concat dotspacemacs-directory ".emacs.d/private/helm-icons/helm-icons.el")))
;;(load helm-icons-file)
;;(helm-icons-provider='nerd-icons)
;;----------- to here ----------------
(helm-icons-enable)
(add-hook 'helm-mode-hook #'helm-icons-enable) ;; Adding icons to helm-find-file, helm-project, helm-recent-files, helm-buffers
;; -------------------------------------------------------------
;;                Extract Annotation from PDF
;; -------------------------------------------------------------
;; Usage;
;; Use (pdf-tools-org-export-to-org) to export annotations of current pdf file being viewed in PDFView mode to an org file.
;; Use (pdf-tools-org-import-from-org ORGFILE) to import annotations from ORG-FILE.
(let ((pdf-tools-annotation-extractor-file (concat dotspacemacs-directory ".emacs.d/private/pdfToolOrg/pdf-tools-org.el")))
  (when (file-exists-p pdf-tools-annotation-extractor-file)
    (load (file-truename pdf-tools-annotation-extractor-file))
    (require 'pdf-tools-org)))

;; -------------------------------------------------------------
;;                Convert markdown to org file
;; -------------------------------------------------------------
(defun my/markdown-to-org ()
  "Convert the current Markdown buffer to Org format and save it in the same directory."
  (interactive)
  (when (eq major-mode 'markdown-mode)
    (let* ((markdown-file (buffer-file-name))
           (org-file (concat (file-name-sans-extension markdown-file) ".org"))
           (command (format "pandoc -f markdown -t org \"%s\" -o \"%s\"" markdown-file org-file)))
      (shell-command command)
      (message "Markdown file converted to Org and saved as %s" org-file))))

;; -------------------------------------------------------------
;;                Convert markdown to pdf
;; -------------------------------------------------------------
;; (defun my/markdown-to-pdf ()
;;   "Export the current Markdown buffer to PDF with a table of contents on the first page."
;;   (interactive)
;;   (when (eq major-mode 'markdown-mode)
;;     (let* ((markdown-file (buffer-file-name))
;;            (pdf-file (concat (file-name-sans-extension markdown-file) ".pdf"))
;;            (toc-option "--toc")
;;            (command (format "pandoc -f markdown -t latex \"%s\" -o \"%s\" %s"
;;                             markdown-file pdf-file toc-option)))
;;       (shell-command command)
;;       (message "Markdown file exported to PDF with table of contents: %s" pdf-file))))

(defun my/markdown-to-pdf ()
  "Export the current Markdown buffer to PDF with clickable links, clickable table of contents, and syntax highlighting."
  (interactive)
  (when (eq major-mode 'markdown-mode)
    (let* ((markdown-file (buffer-file-name))
           (pdf-file (concat (file-name-sans-extension markdown-file) ".pdf"))
           (toc-option "--toc")
           (toc-depth-option "--toc-depth=3")
           (highlight-option "-V 'highlight-style=tango'")
           (link-color-option "-V 'linkcolor=blue'")
           (command (format "pandoc -f markdown -t latex \"%s\" -o \"%s\" %s %s %s %s"
                            markdown-file pdf-file toc-option toc-depth-option highlight-option link-color-option)))
      (shell-command command)
      (message "Markdown file exported to PDF: %s" pdf-file))))

;; -------------------------------------------------------------
;;         Treemacs Follow your curr qt file project
;;         instead manually use: treemacs-display-current-project-exclusively
;; -------------------------------------------------------------
(with-eval-after-load 'treemacs
  (treemacs-follow-mode)
  (treemacs-project-follow-mode)
  (setq treemacs--project-follow-delay 0.1)
  (setq treemacs-file-follow-delay 0.1)
  (setq treemacs-project-follow-cleanup t)
  (setq treemacs-follow-after-init t)
  (setq treemacs-width 30)

  (defun my/treemacs-ignore-file-predicate (file _)
    (or (string= file ".gitignore")
        (string-suffix-p ".pyc" file)
        (string= file "__pycache__")
        (string-prefix-p ".cache" file)))
  (push #'my/treemacs-ignore-file-predicate treemacs-ignored-file-predicates))



;; -------------------------------------------------------------
;;               Kill all buffers at once
;; -------------------------------------------------------------
(defun my/close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*"))

;; -------------------------------------------------------------
;;                   IVY-posframe
;; -------------------------------------------------------------
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;; ;; Different command can use different display function.
;; (setq ivy-posframe-display-functions-alist
;;       '((swiper          . ivy-posframe-display-at-point)
;;         (complete-symbol . ivy-posframe-display-at-point)
;;         (counsel-M-x     . ivy-posframe-display-at-frame-center)
;;         ;; (ivy-posframe-width-relative t)
;;         ;; (ivy-posframe-height-relative t)
;;         ;; (ivy-posframe-width-relative-factor 0.62)
;;         ;; (ivy-posframe-height-relative-factor 0.1)
;;         (t               . ivy-posframe-display)))

;; (setq ivy-posframe-parameters
;;       '((left-fringe . 10)
;;         (right-fringe . 10)
;;         (internal-border-width . 2)
;;         (ivy-posframe-border-width . 3)
;;         (internal-border-color . "red")
;;         ))
;; (ivy-posframe-mode 1)


;; -------------------------------------------------------------
;;          Highlight on Yank Using (evil-googles)
;; URL: https://github.com/edkolev/evil-goggles
;; -------------------------------------------------------------
(evil-goggles-mode)
(setq evil-goggles-duration 0.500) ;; default is 0.200
;; this variable affects "blocking" hints, for example when deleting - the hint is displayed,
;; the deletion is delayed (blocked) until the hint disappers, then the hint is removed and the
;; deletion executed; it makes sense to have this duration short
(setq evil-goggles-blocking-duration 0.500) ;; default is nil, i.e. use `evil-goggles-duration'
;; this variable affects "async" hints, for example when indenting - the indentation
;; is performed with the hint visible, i.e. the hint is displayed, the action (indent) is
;; executed (asynchronous), then the hint is removed, highlighting the result of the indentation
(setq evil-goggles-async-duration 0.300) ;; default is nil, i.e. use `evil-goggles-duration'
;; -------------------------------------------------------------
;;                Font Spacing
;; -------------------------------------------------------------
;;(setq default-text-properties '(line-spacing 0.01 line-height 0.3))
;; (defun set-bigger-spacing ()
;;   (setq-local default-text-properties '(line-spacing -1 line-height -1)))
;; (add-hook 'text-mode-hook 'set-bigger-spacing)
;; (add-hook 'prog-mode-hook 'set-bigger-spacing)
(setq-default line-spacing nil)
(setq-default line-height 0.80)

;; ----------------------------------------------
;;           ELLAMA AI - CONFIGURATION
;; ------------------------------------------------
(use-package ellama
  :init
  (setopt ellama-language "Arabic")
  (require 'llm-ollama)
  (setopt ellama-provider
		      (make-llm-ollama
		       :chat-model "zephyr:latest" :embedding-model "zephyr:latest")))

;; -------------------------------------------------------------
;;              Remove Truncate Lines
;; -------------------------------------------------------------
(setq-default truncate-lines t)
(add-hook 'text-mode-hook 'spacemacs/toggle-truncate-lines-on)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(border ((t (:foreground "#96d0ff"))))
 '(centaur-tabs-default ((t (:background "#21242b" :foreground "#96d0ff" :box nil))))
 '(centaur-tabs-selected ((t (:background "#282c34" :foreground "#bbc2cf" :box nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(dired-directory ((t (:foreground "#51afef" :weight bold))))
 '(evil-goggles-default-face ((t (:inherit region :background "#FF90B3" :foreground "black"))))
 '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-comment-face ((t (:foreground "#768390"))))
 '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-keyword-face ((t (:foreground "#f47067"))))
 '(font-lock-string-face ((t (:foreground "#96d0ff"))))
 '(font-lock-type-face ((t (:foreground "#ebad86"))))
 '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#ebad86"))))
 '(internal-border ((t (:foreground "#96d0ff"))))
 '(ivy-posframe ((t (:background "#282c34"))))
 '(line-number ((t (:foreground "#565c69" :weight bold))))
 '(line-number-current-line ((t (:foreground "#96d0ff" :weight bold))))
 '(lsp-face-highlight-read ((t (:foreground "#ebad86"))))
 '(lsp-inlay-hint-type-face ((t (:background "#2d333b" :foreground "#F9FFD6"))))
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
 '(markdown-header-face ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-1 ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-2 ((t (:inherit bold :foreground "#c3b1ec" :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit bold :foreground "#a3d4e5" :height 1.1))))
 '(markdown-header-face-4 ((t (:inherit bold :foreground "#ef5552" :height 1.1))))
 '(markdown-header-face-5 ((t (:inherit bold :foreground "#4051b5" :height 1.1))))
 '(markdown-pre-face ((t (:foreground "#f69d50"))))
 '(markdown-url-face ((t (:foreground "#96d0ff"))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :weight bold :foreground "#00A6FB" :height 1.5))))
 '(org-checkbox ((t (:foreground "#98B6B1"))))
 '(org-code ((t (:inherit (shadow fixed-pitch) :foreground "#FBCE9D" :weight bold :height 1.1))))
 '(org-done ((t (:foreground "#BBE1C3" :strike-through nil :weight bold))))
 '(org-imminent-deadline ((t (:foreground "#FF90B3"))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :slant normal :weight regular :height 200 :width normal :foundry "nil" :family "SF Pro"))))
 '(org-level-2 ((t (:foreground "#D4B2D8" :extend nil :slant normal :weight regular :height 200 :width normal :foundry "nil" :family "SF Pro"))))
 '(org-todo ((t (:foreground "#FF90B3" :weight bold))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch) :foreground "#FF5A5F" :weight bold :height 1.1))))
 '(region ((t (:background "#c3b1ec" :foreground "#21242b"))))
 '(tab-bar ((t (:background "#21242b" :foreground "#21242b" :box nil))))
 )
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
 '(org-agenda-files '("~/Desktop/org_testing.org"))
 '(package-selected-packages
   '(dired-hacks-utils zoxide yasnippet-snippets yapfify yaml-mode ws-butler
                       writeroom-mode winum which-key web-mode web-beautify
                       volatile-highlights vmd-mode vim-powerline
                       vi-tilde-fringe uuidgen unicode-fonts unfill undo-tree
                       treemacs-tab-bar treemacs-projectile treemacs-persp
                       treemacs-nerd-icons treemacs-magit treemacs-icons-dired
                       treemacs-evil treemacs-all-the-icons toml-mode toc-org
                       terminal-here term-cursor tagedit symon symbol-overlay
                       string-inflection string-edit-at-point sphinx-doc
                       spacemacs-whitespace-cleanup spacemacs-purpose-popwin
                       spaceline space-doc smeargle slim-mode shell-pop
                       scss-mode sass-mode rustic ron-mode reveal-in-osx-finder
                       restart-emacs ranger rainbow-mode rainbow-identifiers
                       rainbow-delimiters quickrun pytest pylookup pyenv-mode
                       pydoc py-isort pug-mode prettier-js popwin poetry pippel
                       pipenv pip-requirements pdf-view-restore
                       password-generator paradox overseer osx-trash
                       osx-dictionary osx-clipboard orgit-forge org-superstar
                       org-rich-yank org-projectile org-present org-pomodoro
                       org-mime org-make-toc org-download org-contrib
                       org-cliplink org-bullets open-junk-file npm-mode nose
                       nord-theme nodejs-repl nerd-icons-ibuffer nameless mwim
                       multi-vterm multi-term multi-line mmm-mode minimap
                       markdown-toc magit-todos macrostep lsp-ui lsp-python-ms
                       lsp-pyright lsp-origami lsp-latex lorem-ipsum livid-mode
                       live-py-mode link-hint ligature launchctl keycast
                       json-reformat json-navigator json-mode js2-refactor
                       js-doc inspector info+ indent-guide importmagic
                       impatient-mode ibuffer-projectile hybrid-mode
                       hungry-delete holy-mode highlight-parentheses
                       highlight-numbers highlight-indentation hide-comnt
                       helm-xref helm-themes helm-swoop helm-rtags helm-pydoc
                       helm-purpose helm-projectile helm-org-rifle helm-org
                       helm-mode-manager helm-make helm-lsp helm-ls-git
                       helm-icons helm-git-grep helm-descbinds helm-ctest
                       helm-css-scss helm-company helm-comint helm-c-yasnippet
                       helm-ag google-translate google-c-style golden-ratio
                       gnuplot gitignore-templates git-timemachine git-modes
                       git-messenger git-link gh-md gendoxy fuzzy
                       flyspell-correct-helm flycheck-ycmd flycheck-rtags
                       flycheck-pos-tip flycheck-package flycheck-elsa flx-ido
                       fancy-battery eyebrowse expand-region evil-visualstar
                       evil-visual-mark-mode evil-unimpaired evil-tutor
                       evil-textobj-line evil-tex evil-surround evil-snipe
                       evil-org evil-numbers evil-nerd-commenter evil-matchit
                       evil-lisp-state evil-lion evil-indent-plus
                       evil-iedit-state evil-goggles evil-exchange
                       evil-evilified-state evil-escape evil-easymotion
                       evil-collection evil-cleverparens evil-args evil-anzu
                       eval-sexp-fu ess-R-data-view eshell-z
                       eshell-prompt-extras esh-help engine-mode emr emmet-mode
                       ellama elisp-slime-nav elisp-def editorconfig dumb-jump
                       drag-stuff dotenv-mode doom-themes dockerfile-mode docker
                       disaster dired-quick-sort diminish diff-hl devdocs
                       dap-mode cython-mode csv-mode cpp-auto-include
                       company-ycmd company-web company-tabnine
                       company-statistics company-rtags company-reftex
                       company-quickhelp company-math company-lua
                       company-c-headers company-auctex company-anaconda
                       command-log-mode column-enforce-mode
                       color-identifiers-mode code-cells cmake-mode
                       clean-aindent-mode centered-cursor-mode centaur-tabs ccls
                       browse-at-remote bm blacken beacon auto-yasnippet
                       auto-highlight-symbol auto-dictionary auto-compile
                       auctex-latexmk all-the-icons-dired
                       all-the-icons-completion aggressive-indent ace-link
                       ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(border ((t (:foreground "#96d0ff"))))
 '(centaur-tabs-default ((t (:background "#21242b" :foreground "#96d0ff" :box nil))))
 '(centaur-tabs-selected ((t (:background "#282c34" :foreground "#bbc2cf" :box nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(dired-directory ((t (:foreground "#51afef" :weight bold))))
 '(evil-goggles-default-face ((t (:inherit region :background "#FF90B3" :foreground "black"))))
 '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-comment-face ((t (:foreground "#768390"))))
 '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-keyword-face ((t (:foreground "#f47067"))))
 '(font-lock-string-face ((t (:foreground "#96d0ff"))))
 '(font-lock-type-face ((t (:foreground "#ebad86"))))
 '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
 '(highlight-indentation-face ((t (:foreground "#5c6370"))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#ebad86"))))
 '(internal-border ((t (:foreground "#96d0ff"))))
 '(ivy-posframe ((t (:background "#282c34"))))
 '(line-number ((t (:foreground "#565c69" :weight bold))))
 '(line-number-current-line ((t (:foreground "#96d0ff" :weight bold))))
 '(lsp-face-highlight-read ((t (:foreground "#ebad86"))))
 '(lsp-inlay-hint-type-face ((t (:background "#2d333b" :foreground "#F9FFD6"))))
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
 '(markdown-header-face ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-1 ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-2 ((t (:inherit bold :foreground "#c3b1ec" :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit bold :foreground "#a3d4e5" :height 1.1))))
 '(markdown-header-face-4 ((t (:inherit bold :foreground "#ef5552" :height 1.1))))
 '(markdown-header-face-5 ((t (:inherit bold :foreground "#4051b5" :height 1.1))))
 '(markdown-pre-face ((t (:foreground "#f69d50"))))
 '(markdown-url-face ((t (:foreground "#96d0ff"))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :weight bold :foreground "#00A6FB" :height 1.5))))
 '(org-checkbox ((t (:foreground "#98B6B1"))))
 '(org-code ((t (:inherit (shadow fixed-pitch) :foreground "#FBCE9D" :weight bold :height 1.1))))
 '(org-done ((t (:foreground "#BBE1C3" :strike-through nil :weight bold))))
 '(org-imminent-deadline ((t (:foreground "#FF90B3"))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :slant normal :weight regular :height 200 :width normal :foundry "nil" :family "SF Pro"))))
 '(org-level-2 ((t (:foreground "#D4B2D8" :extend nil :slant normal :weight regular :height 200 :width normal :foundry "nil" :family "SF Pro"))))
 '(org-todo ((t (:foreground "#FF90B3" :weight bold))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch) :foreground "#FF5A5F" :weight bold :height 1.1))))
 '(region ((t (:background "#c3b1ec" :foreground "#21242b"))))
 '(tab-bar ((t (:background "#21242b" :foreground "#21242b" :box nil)))))
)
