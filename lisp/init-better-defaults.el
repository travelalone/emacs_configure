(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("hm" "haomiao")
					    ))

(setq make-backup-files nil)
(setq auto-save-default nil)
(delete-selection-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)
(with-eval-after-load 'dired
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(set-face-attribute 'default nil :height 160)
(blink-cursor-mode -1)
(provide 'init-better-defaults)
