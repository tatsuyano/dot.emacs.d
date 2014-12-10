;; http://qiita.com/syohex/items/a669b35fbbfcdda0cbf2

;; smartrep
(require 'smartrep)

;; git-gutter
(global-git-gutter-mode t)

(smartrep-define-key
    global-map  "C-x" '(("p" . 'git-gutter:previous-diff)
                        ("n" . 'git-gutter:next-diff)))
