;; http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
