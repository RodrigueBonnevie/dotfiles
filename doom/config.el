;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)
(setq doom-font (font-spec :size 13))

(when (display-graphic-p)
  (toggle-frame-maximized)

  (custom-theme-set-faces! 'doom-moonlight
    '(line-number :foreground "gray")
    '(mode-line-inactive :background "dim gray" :foreground "black" :height 80)
    '(mode-line :background "dim gray" :height 80)
    '(vertico-group-title :foreground  "gray")
    )
  )

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")



;;;;;;;;; Custom Settings ;;;;;;;;;

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Switch to the new window after splitting.
(setq evil-split-window-below t)
(setq evil-vsplit-window-right t)

;; Do not continue to comment new lines when o/O from a commented line.
(setq +evil-want-o/O-to-continue-comments nil)

(setq auto-save-default nil)
;; When ideling save after this amount of seconds
;;(setq auto-save-timeout 10)
;;(setq auto-save-visited-mode)

;; Super save package, allows saving on focus change
;;(super-save-mode +1)
;;(setq super-save-delete-trailing-whitespace t)
;;(setq super-save-auto-save-when-idle t)
;;(setq super-save-all-buffers t)

;;; :lang rust
(setq
 lsp-inlay-hint-enable t
 lsp-rust-analyzer-cargo-watch-command "clippy"
 lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial"
 lsp-rust-analyzer-display-chaining-hints t
 lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil
 lsp-rust-analyzer-display-closure-return-type-hints t
 lsp-rust-analyzer-display-parameter-hints nil
 lsp-rust-analyzer-display-reborrow-hints nil
 lsp-rust-analyzer-display-inlay-hints t
 lsp-enable-file-watchers t
 lsp-file-watch-threshold 2000
 lsp-auto-execute-action nil
 )

;; Do not format on save in the following modes.
(after! format
  (setq +format-on-save-disabled-modes
        '(python-mode
          cmake-mode
          yaml-mode)))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
