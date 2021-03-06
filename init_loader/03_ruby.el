;; --------------------------------------------------
;; ruby-mode
;; http://shibayu36.hatenablog.com/entry/2013/03/18/192651
;; http://konboi.hatenablog.com/entry/2012/08/15/154315
;; --------------------------------------------------
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode)) ;; shebangがrubyの場合、ruby-modeを開く

;; --------------------------------------------------
;; rubyのファイルを開く場合は、とにかくUTF-8を使う
;; http://qiita.com/ironsand/items/a53797bd48170104aa74
;; --------------------------------------------------
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; ruby-modeのインデントを改良する
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; --------------------------------------------------
;; ruby-end
;; endや括弧などを自動挿入する
;; http://blog.livedoor.jp/ooboofo3/archives/53748087.html
;; --------------------------------------------------
(require 'ruby-end)
(add-hook 'ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; --------------------------------------------------
;; ruby-block
;; endにカーソルを合わせると、そのendに対応する行をハイライトする
;; --------------------------------------------------
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; --------------------------------------------------
;; robe
;; http://codeout.hatenablog.com/entry/2014/02/04/210237
;; --------------------------------------------------
(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; --------------------------------------------------
;; rbenv.el
;; http://block-given.hatenablog.com/entry/2014/11/12/005657
;; --------------------------------------------------
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "~/.anyenv/envs/rbenv")

;; --------------------------------------------------
;; smart-newline.el
;; http://ainame.hateblo.jp/entry/2013/12/08/162032
;; --------------------------------------------------
(add-hook 'ruby-mode-hook
  (lambda ()
  (smart-newline-mode t)))

;; --------------------------------------------------
;; rspec-mode
;; http://futurismo.biz/archives/2266
;; C-c , v RSpec実行
;; C-c , s カ-ソルが当たっているサンプルを実行
;; C-c , t Specとソースを切り替える
;; --------------------------------------------------
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))

;; --------------------------------------------------
;; rcodetools
;; http://blog.10rane.com/2015/03/25/install-rcodetools-to-emacs/
;; 返り値をコメントに出力することができる e.g. 3 + 4 # => 7
;;
;; 返り値を出力したい行で、M-;(comment-dwim)を二回実行すると「# =>」というコメントがソースに出力される
;; その状態で、M-p(xmp)を実行すると、コメントに返り値が出力される
;; --------------------------------------------------
(require 'rcodetools)
(define-key ruby-mode-map (kbd "M-p") 'xmp)
