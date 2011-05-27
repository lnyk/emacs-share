;;Set fonts for Inconsolata
(set-face-attribute 'default nil
            :family "Inconsolata" :height 140)
(set-face-attribute 'font-lock-comment-face nil
;           :family "Optima" :height 140 :slant 'italic
            :family "Optima" :height 140)
(set-face-attribute 'font-lock-string-face nil
            :family "Anonymous Pro" :height 130 :weight 'bold)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Projects/git/MobileOrg")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Projects/git/MobileOrg/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; 不显示 Emacs 的开始画面。
(setq inhibit-startup-message t)

;;最大化启动
(setq initial-frame-alist '((top . 0) (left . 0) (width . 179) (height . 49)))

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 缺省的名字和邮件地址，很多地方用得到，比如 VC(version control) 中产生
;; ChangeLog 文件。
(setq user-full-name "William Yao")
(setq user-mail-address "monoyo@gmail.com")

;; I use version control, don't annoy me with backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

;;Set git support.
(setq load-path (cons (expand-file-name "~/Projects/github/git-emacs/") load-path))
(require 'git-emacs)
(setq load-path (cons (expand-file-name "/opt/local/share/doc/git-core/contrib/emacs") load-path))
 (require 'vc-git)
 (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
 (require 'git)
 (autoload 'git-blame-mode "git-blame"
           "Minor mode for incremental blame for Git." t)
