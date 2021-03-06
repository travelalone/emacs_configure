(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "s-SPC") 'mark-defun)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-keybindings)
