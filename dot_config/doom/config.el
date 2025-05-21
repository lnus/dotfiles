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
;; (setq doom-font "JetBrains Mono"
(setq doom-font (font-spec :family "JetBrains Mono" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

;; POSIX shell fix (set bash for internal emacs subprocesses)
(setq shell-file-name (executable-find "bash"))

;; emacs terminals use another shell
(setq-default vterm-shell "~/.cargo/bin/nu")
(setq-default explicit-shell-file-name "~/.cargo/bin/nu")

(setq default-frame-alist
      '((menu-bar-lines . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        (undecorated . t)))

;; attempt to write a silly scratch function
;;
;; NOTE shitty replacement for +everywhere
;; NOTE 2, i suck at elisp
;; NOTE emacsclient -e '(quick-scratch)' -n
(defun quick-scratch ()
  "Open a quick scratchpad frame, copy content on C-c C-c."
  (interactive)
  (let* ((buffer-name "*quick scratch*")
         (buffer (get-buffer-create buffer-name))
         (scratch-frame (make-frame
                         '((name . "Quick Scratch Frame")))))
    (select-frame scratch-frame)
    (switch-to-buffer buffer)

    ;; Paste clipboard content using wl-paste
    (when (executable-find "wl-paste") ;; FIXME platform agnostic?
      (call-process "wl-paste" nil (current-buffer) nil))

    (org-mode) ;; assuming org, for no reason really

    (local-set-key (kbd "C-c C-c") #'quick-scratch/finish)
    (local-set-key (kbd "C-c C-k") #'quick-scratch/cancel)

    (setq mode-line-format "-- [QS] -- C-c C-c copy, C-c C-k cancel --")))

(defun quick-scratch/finish ()
  "Copy scratch buffer content to clipboard and close frame."
  (interactive)
  (let ((buffer-content (buffer-string)))
    (when (executable-find "wl-copy") ;; FIXME platform agnostic?
      (call-process "wl-copy" nil nil nil buffer-content))

    (kill-new buffer-content)
    (message "Content copied to clipboard!")
    (kill-buffer (current-buffer))
    (delete-frame)))

(defun quick-scratch/cancel ()
  "Close scratch frame without copying."
  (interactive)
  (kill-buffer (current-buffer))
  (delete-frame))

;; treesitter grammars
(setq treesit-language-source-alist
      '((typst "https://github.com/uben0/tree-sitter-typst")))

;; org mode capture templates
;; NOTE I don't really use this, commenting for now
;; (after! org-capture
;;   (add-to-list 'org-capture-templates
;;                '("e" "Calendar Event" entry
;;                  (file+datetree "~/org/calendar.org") ; Target file and use datetree for organization
;;                  "* %^{Event Title}\n  SCHEDULED: %^t\n: LOCATION: %^{Location|Optional}\n  :URL: %^{URL|Optional}\n  :END:\n\n%?"
;;                  :time-prompt t         ; Ensure timestamp prompts for date/time
;;                  :empty-lines 1)))     ; Add an empty line after the entry for spacing
