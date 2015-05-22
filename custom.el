(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-hl-line-mode t)

(setq track-eol t)

(setq-default abbrev-mode t)
(setq save-abbrevs nil)

(setq user-full-name "William Yao")
(setq user-mail-address "lnyk@me.com")

(setq make-backup-files nil)
(setq auto-save-default nil)

(tool-bar-mode -1)

;; Kill a buffer without answering confirmation
(global-set-key [(control x) (k)] 'kill-this-buffer)
;; Auto kill processes when killing a buffer.
(delq 'process-kill-buffer-query-function kill-buffer-query-functions)

;; Change yes-or-no to y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

(set-language-environment 'UTF-8)

(set-locale-environment "UTF-8")