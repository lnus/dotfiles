;; TODO: Move this to a init-packages.el
;; Define and initialise package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; List packages I want
(setq package-list
      '(evil magit minimap gruvbox-theme))

;; Init packages
(package-initialize)

;; Fetch available packages 
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Disable mini-map by default
(minimap-mode 0)

;; Set theme to gruvbox-hard
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

;; Display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Sets gruvbox theme as safe
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(package-selected-packages '(gruvbox-theme minimap evil exotica-theme magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
