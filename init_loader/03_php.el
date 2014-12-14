;; http://tech.kayac.com/archive/php-completion.html
;; http://engineering.crocos.jp/post/101386268815/emacs24-4-emacs-php
(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t))))

;; ctpファイルもphp-modeで開くようにする
(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))

;; --------------------------------------------------
;; smart-newline.el
;; http://ainame.hateblo.jp/entry/2013/12/08/162032
;; --------------------------------------------------
(add-hook 'php-mode-hook
  (lambda ()
  (smart-newline-mode t)))
