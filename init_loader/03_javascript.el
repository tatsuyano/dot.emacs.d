;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))

;; flymake-jshint
;; http://safx-dev.blogspot.jp/2013/05/emacsflymake-jshintjavascript.html
(setq exec-path (append exec-path '("~/.anyenv/envs/ndenv/shims/")))
(add-hook 'js2-mode-hook '(lambda ()
                            (require 'flymake-jshint)
                            (flymake-jshint-load)))

;; tern
;; http://syati.info/?p=2163
;; http://ternjs.net/doc/demo.html
;; http://suzuki.tdiary.net/20150120.html
(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)))
 
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
