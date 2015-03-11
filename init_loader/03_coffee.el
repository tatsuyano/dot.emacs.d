(require 'coffee-mode)

;; デフォルトだとインデントが８スペースなので、２スペースに変更
;; http://qiita.com/items/a8d96ae95a1838500e37
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-tab-width 2))
(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; auto-complete
(add-to-list 'ac-modes 'coffee-mode) ;; coffee-modeでACを使えるようにする

;; coffee-modeで、追加したjs2-modeのdict(辞書)で補完するようにする
;; wget https://raw.github.com/sandai/dotfiles/master/.emacs.d/ac-dict/js2-mode
(add-hook 'coffee-mode-hook
  '(lambda ()
    (add-to-list 'ac-dictionary-files "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20141208.809/dict/js2-mode")
))
