
;; C-x C-b 缺省的绑定很不好用，改成一个比较方便的 electric-buffer-list，执行
;; 之后：
;;     光标自动转到 Buffer List buffer 中；
;;     n, p   上下移动选择 buffer；
;;     S      保存改动的 buffer；
;;     D      删除 buffer。
;; 除此之外，不错的选择还有 ibuffer，不妨试试 M-x ibuffer。
;;(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-b" 'ibuffer)

;; 按下 C-x k 立即关闭掉当前的 buffer，需要关闭掉别的 buffer 时，按C-x C-b
;; 用 D 就 ok 了。
(global-set-key "\C-xk" 'kill-this-buffer)

;; 以前的 Emacs 都是如此绑定的，Emacs 21 之后反而使我不习惯了。不过现在我已
;; 经基本不用了，因为 M-< 和 M-> 更方便。而且，如果你是新手，还是行首和行尾
;; 更直观。
;(global-set-key [(home)] 'beginning-of-buffer)
;(global-set-key [(end)] 'end-of-buffer)

;; 不显示 Emacs 的开始画面。
(setq inhibit-startup-message t)

;;最大化启动 
(setq initial-frame-alist '((top . 0) (left . 0) (width . 142) (height . 49)))

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 缺省的名字和邮件地址，很多地方用得到，比如 VC(version control) 中产生
;; ChangeLog 文件。
(setq user-full-name "William Yao")
(setq user-mail-address "monoyo@gmail.com")

;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的两个版本和最新的
;; 五个版本。并且备份的时候，备份文件是复本，而不是原件。
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "/var/tmp/EmacsTMP")))
(setq backup-by-copying t)

;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)

;; Set load-path
(setq load-path (cons (expand-file-name "~/Projects/elisp/load-path") load-path))
;(add-to-list 'load-path (expand-file-name "~/Projects/elisp/load-path"))

;; Set auto-install
(require 'auto-install)
(setq auto-install-directory "~/Projects/elisp/load-path/")

;; Set python-mode
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; Set Chinese Support
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;;Set Weblogger and xml-rpc
(require 'weblogger)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(vc-path (quote ("/opt/local/bin/")))
 '(weblogger-config-alist (quote (("blog.williamyao.com" ("user" . "WilliamYao") ("server-url" . "http://blog.williamyao.com/xmlrpc.php") ("weblog" . "1")) ("default" ("user" . "WilliamYao") ("server-url" . "http://blog.williamyao.com/xmlrpc.php") ("weblog" . "1"))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;Set org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-log-done t)

;;Set fonts for Inconsolata
(set-face-attribute 'default nil
		    :family "Inconsolata" :height 140)
(set-face-attribute 'font-lock-comment-face nil
;		    :family "Optima" :height 140 :slant 'italic
		    :family "Optima" :height 140
		    :background "#ddddee" :foreground "#000000")
(set-face-attribute 'font-lock-string-face nil
		    :family "Anonymous Pro" :height 130 :weight 'bold
		    :foreground "black" :background 'unspecified)

;(define-key global-map [(meta _)] "-") ; em-dash
;(define-key global-map [(meta -)] "-") ; en-dash
;(define-key global-map [(meta ?\[)] "“")
;(define-key global-map [(meta ?\{)] "”")
;(define-key global-map [(meta ?\;)] "…")
;(define-key global-map [(meta ?\})] "‘")
;(define-key global-map [(meta ?\])] "’")

;;Set git support.
(setq load-path (cons (expand-file-name "~/Projects/Git.GitHub/git-emacs/") load-path))
;;(add-to-list 'load-path "~/Projects/Git.GitHub/git-emacs/")
(require 'git-emacs)
;;(setq load-path (cons (expand-file-name "/opt/local/share/doc/git-core/contrib/emacs") load-path))
;; (require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;; (require 'git)
;; (autoload 'git-blame-mode "git-blame"
;;           "Minor mode for incremental blame for Git." t)

;;Set Line Wrap
;;(setq truncate-partial-width-windows nil)
(global-visual-line-mode 1)
(global-linum-mode 1)

;;用 ALT + 上下箭 滚动
(global-set-key [(meta down)] (lambda (&optional n) (interactive "p") (scroll-up (or n 1))))
(global-set-key [(meta up)] (lambda (&optional n) (interactive "p") (scroll-down (or n 1))))

;;平滑显示 
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000) 

;;模式行显示列号 
(setq column-number-mode t)

;;标题栏显示文件的完整路径 
(setq frame-title-format '("%S" (buffer-file-name "%f" (dired-directory dired-directory "%b")))) 

;;光标靠近鼠标时，鼠标自动让开 
(mouse-avoidance-mode 'animate) 

;;直接打开和显示图片 
(auto-image-file-mode) 

;;跳转到某一行 
(global-set-key [(control c) (control g)] 'goto-line) 

;;设置光标为竖线 
(setq-default cursor-type 'bar) 
;;(setq-default cursor-type 'box) ;设置光标为方块

;;以y/n代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)