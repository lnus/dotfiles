;; This file is loaded from init.el

;; Define and initialise package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; List packages I want
(setq package-list
      '(evil magit minimap gruvbox-theme lsp-mode lsp-ui flycheck))

;; Init packages
(package-initialize)

;; Fetch available packages 
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
