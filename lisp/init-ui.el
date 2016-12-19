(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)

(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq-default cursor-type 'bar)

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode t)
(provide 'init-ui)
