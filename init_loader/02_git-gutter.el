;; http://qiita.com/syohex/items/a669b35fbbfcdda0cbf2
;; http://blog.happyelements.co.jp/2012/10/emacs-2-emacsgitmagit.html

(require 'smartrep)

(global-git-gutter-mode t)

(smartrep-define-key
    global-map  "M-g" '(("s" . 'magit-status)
                        ("b" . 'vc-annotate)
                        ("d" . 'vc-diff)
                        ("p" . 'git-gutter:previous-diff)
                        ("n" . 'git-gutter:next-diff)))
