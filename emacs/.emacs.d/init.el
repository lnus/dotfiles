;; Loads packages from separate file
(load "~/.emacs.d/init-packages.el")

;; Define the init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

