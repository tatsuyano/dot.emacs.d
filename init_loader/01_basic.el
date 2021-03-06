;; カラーテーマ
(load-theme 'misterioso t)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; メニューバーを非表示
(menu-bar-mode -1)

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)

;; タブ幅
(custom-set-variables '(tab-width 4))

;; バックアップを残さない
(setq make-backup-files nil)

;; 自動でファイルを保存 http://blog.kentarok.org/entry/20080222/1203688543
(auto-save-buffers-enhanced t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; Ctrl-h = BS
(global-set-key "\C-h" 'delete-backward-char)

;; 折り返し表示ON/OFF
(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))

(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
(custom-set-variables '(tool-bar-mode nil)) (custom-set-faces )

;; hostsやconfファイルに色がつくようになる
(require 'generic-x)

;; reload
(global-set-key [f12] 'eval-buffer)
