(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(require 'cl)
(defvar haomiao/packages '(
			   company
			   monokai-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   exec-path-from-shell
			   popwin
			   reveal-in-osx-finder
               auctex
               zenburn-theme
			   cdlatex
			   latex-math-preview
			   latex-extra
			   which-key
			   ) "Default packages")

(setq package-selected-packages haomiao/packages)

(defun haomiao/packages-installed-p ()
  (loop for pkg in haomiao/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (haomiao/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg haomiao/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)

;;(load-theme 'monokai t)
(load-theme 'zenburn t)

(require 'popwin)
(popwin-mode t)

(require 'which-key)
(which-key-mode t)
;;latex configuration;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook(lambda()(company-mode 0)))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(load "latex-math-preview.el" nil t t)
(add-hook 'LateX-mode-hook(lambda()
			    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
			    (setq TeX-command-default "XeLaTeX")
			    ))
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
(setq TeX-fold-command-prefix "\C-o")

(provide 'init-packages)
