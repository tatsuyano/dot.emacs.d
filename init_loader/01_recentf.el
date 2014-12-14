;; http://qiita.com/catatsuy/items/f9fad90fa1352a4d3161
(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

;; http://yak-shaver.blogspot.jp/2013/07/recentf-ext.html
(defadvice recentf-open-files (after recentf-set-overlay-directory-adv activate)
  (set-buffer "*Open Recent*")
  (save-excursion
    (while (re-search-forward "\\(^  \\[[0-9]\\] \\|^  \\)\\(.*/\\)$" nil t nil)
      (overlay-put (make-overlay (match-beginning 2) (match-end 2))
                   'face `((:foreground ,"#F1266F"))))))
;; 起動画面削除
(setq inhibit-startup-message t)

;; 起動画面で recentf を開く
(add-hook 'after-init-hook (lambda()
    (recentf-open-files)
    ))

;; キーバインド
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
