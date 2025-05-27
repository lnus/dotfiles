;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;TODO Remove verbose documentation
;;TODO Move all setq into same expr

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
(setq doom-font (font-spec :family "JetBrains Mono" :size 18))

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
;; (setq-default vterm-shell "~/.cargo/bin/nu")
;; (setq-default explicit-shell-file-name "~/.cargo/bin/nu")
(setq-default vterm-shell "/usr/bin/fish")
(setq-default explicit-shell-file-name "/usr/bin/fish")

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
         (buffer (get-buffer-create buffer-name)))

    (switch-to-buffer buffer)

    (when (executable-find "wl-paste") ;; FIXME platform agnostic?
      (call-process "wl-paste" nil (current-buffer) nil))

    (org-mode) ;; assuming org, for no reason really

    (local-set-key (kbd "C-c C-c") #'quick-scratch/finish)
    (local-set-key (kbd "C-c C-k") #'quick-scratch/cancel)
    (local-set-key (kbd "C-c C-x") #'quick-scratch/export)

    (setq mode-line-format "-- [QS] -- C-c + C-c Copy, C-x eXport, C-k cancel --")))

;; (org-export-as BACKEND &optional SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)
(defun quick-scratch/export ()
  (interactive)
  (let* ((formats '("Markdown"
                    "Plain Text"))
         (chosen-format (completing-read "Export as: " formats nil t))
         ;; (buffer-content (buffer-string))
         (exported-content nil))

    (message chosen-format)

    (unless (or (null chosen-format) (string-empty-p chosen-format))
      (setq exported-content
            (cond
             ((string= chosen-format "Markdown")
              (require 'ox-md)
              (org-export-as 'md nil nil t '(:with-toc nil))) ;; FIXME src blocks
             ((string= chosen-format "Plain Text")
              (require 'ox-ascii)
              (org-export-as 'ascii nil nil t))
             (t
              (message "Unknown format: %s" chosen-format)
              nil))))

    (if exported-content
        (progn
          (if (executable-find "wl-copy") ;; FIXME platform agnostic?
              (call-process "wl-copy" nil nil nil exported-content)
            (message "wl-copy not found. Content not copied to system clipboard."))
          (kill-new exported-content)
          (message "Content copied as %s!" chosen-format))
      (unless (or (null chosen-format) (string-empty-p chosen-format))
        ;; Only show "cancelled" if a choice was made and then failed,
        ;; or if the format was unknown.
        ;; If completing-read was cancelled, it returns nil,
        ;; and we don't want to show "Export cancelled" then.
        (message "Export failed or format not recognized."))
      (when (or (null chosen-format) (string-empty-p chosen-format))
        (message "Export cancelled.")))
    ))

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
;; NOTE replacing doom emacs defaults
;; NOTE reference from ~/.config/emacs/modules/lang/org/config.el
(after! org-capture
  (setq org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i\n%a"
           :prepend t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
          ;; {todo,notes,changelog}.org file is found in a parent directory.
          ;; Uses the basename from `+org-capture-todo-file',
          ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
          ("p" "Templates for projects")
          ("pt" "Project-local todo" entry  ; {project-root}/todo.org
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("pn" "Project-local notes" entry  ; {project-root}/notes.org
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?\n%i\n%a" :prepend t)
          ("pc" "Project-local changelog" entry  ; {project-root}/changelog.org
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {org-directory}/{+org-capture-projects-file} and store
          ;; these under {ProjectName}/{Tasks,Notes,Changelog} headings. They
          ;; support `:parents' to specify what headings to put them under, e.g.
          ;; :parents ("Projects")
          ("o" "Centralized templates for projects")
          ("ot" "Project todo" entry
           (function +org-capture-central-project-todo-file)
           "* TODO %?\n %i\n %a"
           :heading "Tasks"
           :prepend nil)
          ("on" "Project notes" entry
           (function +org-capture-central-project-notes-file)
           "* %U %?\n %i\n %a"
           :heading "Notes"
           :prepend t)
          ("oc" "Project changelog" entry
           (function +org-capture-central-project-changelog-file)
           "* %U %?\n %i\n %a"
           :heading "Changelog"
           :prepend t))))

(defun shell2buff (command buffer-name)
  "Run COMMAND in a shell and open its output in BUFFER-NAME."
  (interactive "sCommand: \nsBuffer Name: ")
  (let ((output (shell-command-to-string command)))
    (with-current-buffer (get-buffer-create buffer-name)
      (erase-buffer)
      (insert output)
      (goto-char (point-min))
      (switch-to-buffer (current-buffer)))))
