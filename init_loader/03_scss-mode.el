;; --------------------------------------------------
;; scss-mode
;; http://biwakonbu.com/?p=235
;; --------------------------------------------------
(require 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\)\\'" . scss-mode))
(add-hook 'scss-mode-hook 'auto-complete-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-to-list 'ac-modes 'scss-mode)
(add-hook 'scss-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            (setq scss-compile-at-save nil)
            (setq ac-sources '(ac-source-yasnippet
                               ac-source-css-property
                               ac-source-dictionary
                               ))
            ))
(load-library "flymake-cursor")
