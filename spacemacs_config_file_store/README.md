# CONFIGURATIONS FOR EMACS
## Changing Log

- [x] Added supprt for using `latex`
- [x] Update `2024-02-04`:
    - Fixing the keybinding for macOS for `emacs`.

## Aestheatics Features

At Aestheatics, Here are some highlights:

- Since I installed emacs30, I have to add some extra features that make it more
appealing. These can be found [here](https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar). The
feature removes the titlebar from the Emacs frame. Previously, it involved
passing the **--with-no-titlebar** flag to installar. However, for Emacs 30 or
later (referred to as `emacs30`), we can add the following:

```lisp
(add-to-list 'default-frame-alist '(undecorated-round . t))
```
to the `early-init.el` file.
