;; coffee-mode
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))

;; flymake-jshint
;; http://safx-dev.blogspot.jp/2013/05/emacsflymake-jshintjavascript.html
(setq exec-path (append exec-path '("~/.anyenv/envs/ndenv/shims/")))
(add-hook 'js2-mode-hook '(lambda ()
                            (require 'flymake-jshint)
                            (flymake-jshint-load)))
