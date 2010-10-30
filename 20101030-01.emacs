;; Copyright (C) 2009 Yu Yong 
;; Author: yuyong79@gmail.com 
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet 
;; cd /home/linux && cvs -z3 -d:pserver:anonymous@cvs.savannah.gnu.org:/sources /emacs co <modulename> 
;; cd emacs && cvs update -dP 
;C = Control 
;M = Meta = Alt | Esc 
;Del = Backspace 
;>表示大于号，<表示小于号 
;up,down,left,right表示上下左右方向键 
;Use `M-x highlight-changes-mode' to enable (or disable) Highlight Changes mode 
;如果多个目录包含相同的elc或el文件，那么起作用的是先找到的，所以如果发生 
;类似的情况可以使用类似"M-x locate-library RET cc-mode RET"的命令确认 
;(add-to-list 'load-path "/usr/share/emacs-snapshot") 
(add-to-list 'load-path "/usr/share/emacs/23.0.91") 
(add-to-list 'load-path "/usr/share/emacs") 
(add-to-list 'load-path "~/cedet") 
;(add-to-list 'load-path "/home/linux/cc-mode-5.26") 
;(add-to-list 'load-path "/usr/share/emacs/23.0.91/lisp/progmodes") 
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/src/emacs-lisp") 

;快捷键 
(global-set-key [f4] 'other-window) 
(global-set-key [f11] 'delete-other-windows) 

;关闭开机画面 
(setq inhibit-startup-message t) 

;主题 
;apt-get install emacs-goodies-el
(require 'color-theme)
(setq color-theme-is-global t)
;(color-theme-deep-blue)
;(color-theme-arjen)
;(color-theme-black)
;(color-theme-taming-mr-arneson)
(color-theme-billw)

;最大化启动 
(setq initial-frame-alist '((top . 0) (left . 0) (width . 142) (height . 49)))

;用 ALT + 上下箭 滚动
(global-set-key [(meta down)] (lambda (&optional n) (interactive "p") (scroll-up (or n 1))))
(global-set-key [(meta up)] (lambda (&optional n) (interactive "p") (scroll-down (or n 1))))

;平滑显示 
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000) 

;显示行号 
(require 'setnu) 

;模式行显示列号 
(setq column-number-mode t) 

;显示括号匹配 
(show-paren-mode t) 
(setq show-paren-style 'parentheses) 

;显示时间，格式如下 
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 

;标题栏显示文件的完整路径 
(setq frame-title-format '("%S" (buffer-file-name "%f" (dired-directory dired-directory "%b")))) 

;光标靠近鼠标时，鼠标自动让开 
(mouse-avoidance-mode 'animate) 

;直接打开和显示图片 
(auto-image-file-mode) 

;支持emacs和外部程序的粘贴 
(setq x-select-enable-clipboard t) 

;跳转到某一行 
(global-set-key [(control c) (control g)] 'goto-line) 

;高亮 
(global-hi-lock-mode 1) 
;C-x w h REGEXP <RET> FACE <RET> ;Highlight text that matches REGEXP using face FACE(`highlight-regexp') 
;C-x w r REGEXP <RET> ;Unhighlight REGEXP (`unhighlight-regexp') 
;C-x w l REGEXP <RET> FACE <RET> ;Highlight entire lines containing a match for REGEXP, using face FACE (`highlight-lines-matching-regexp'). 
;C-x w b ;This key binding runs the `hi-lock-write-interactive-patterns' command 
;C-x w i ;`hi-lock-find-patterns' 

;默认模式 
(setq major-mode 'text-mode) 

;设置光标为竖线 
(setq-default cursor-type 'bar) 
;(setq-default cursor-type 'box) ;设置光标为方块 

;设置滚动条 
(scroll-bar-mode left) 

;显示80列换行 
;(setq default-fill-column 80) 

;隐藏工具栏 
;(tool-bar-mode nil) 

;以y/n代表yes/no 
(fset 'yes-or-no-p 'y-or-n-p) 

;语法高亮(Emacs默认是使能的) 
;(global-font-lock-mode t) 

;cc-mode配置(http://cc-mode.sourceforge.net/) 
;1）缩进 
;(setq default-tab-width 4) 
(setq c-syntactic-indentation t) 
(setq c-tab-always-indent t)
;t: 表示在一行的任何位置按TAB都会执行"行缩进"； 
;nil: 表示仅在一行的第一个非空白字符左边按TAB才执行"行缩进"，否则在光标处插入空白（空白具体是TAB还是等效的空格，由indent-tabs-mode变量决定）
(setq indent-tabs-mode nil)
;nil: insert equivalent number of spaces; t: insert real tab character 
;2）注释 
;C-c C-c (comment-region) ; 
;C-u - C-c C-c ;delete comment region 
;M-; (comment-dwim or indent-for-comment) ;Insert a comment at the end of the current line 
;C-u M-; ;kills any comment\C-cj" 'semantic-ia-fast-jump) 
(local-set-key "\C-cq" 'semantic-ia-show-doc) 
(local-set-key "\C-cs" 'semantic-ia-show-summary) 
(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle) 
;;(add-hook 'semantic-init-hooks 'my-cedet-hook) 
(add-hook 'c-mode-common-hook 'my-cedet-hook) 
(add-hook 'lisp-mode-hook 'my-cedet-hook) 
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook) 
;; (add-hook 'erlang-mode-hook 'my-cedet-hook) 
(defun my-c-mode-cedet-hook () 
(local-set-key "." 'semantic-complete-self-insert) 
(local-set-key ">" 'semantic-complete-self-insert) 
(local-set-key "\C-ct" 'eassist-switch-h-cpp) 
(local-set-key "\C-xt" 'eassist-switch-h-cpp) 
(local-set-key "\C-ce" 'eassist-list-methods) 
(local-set-key "\C-c\C-r" 'semantic-symref) 
) 
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook) 

;UML Diagram - Cogre 
;Advanced Code Browsing 
;Speedbar - Everything browser 
;===============================================================================
(require 'speedbar) 
(setq speedbar-show-unknown-files t) ;Show all files 
(global-set-key [f2] 'speedbar-get-focus) ;switch between main frame and speedbar frame.ss 
;fix speedbar in left, and set auto raise mode 
(add-hook 'speedbar-mode-hook
	  (lambda ()
	    (auto-raise-mode 1) 
	    (add-to-list 'speedbar-frame-parameters '(top . 30)) 
	    (add-to-list 'speedbar-frame-parameters '(left . 0)))) 
;inhibit tags grouping and sorting 
(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy)) 

;=============================================================================== 
;Source code folding 
(setq global-semantic-tag-folding-mode 1) 
;senator-fold-tag command (C-c , -) 
;senator-unfold-tag (C-c , +). 
;Code templates 
;srecode-insert(C-c / /) 
;srecode-insert-again(C-c / .) 
;srecode-insert-getset(C-c / G) 
;srecode-edit(C-c / E) 
;Other 
;(require 'eassist) 
;eassist-list-methods 
;eassist-switch-h-cpp 
;semanticdb-create-ebrowse-database 
;semanticdb-create-cscope-database 
;semanticdb-find-default-throttle 
;semantic-idle-scheduler-idle-time 
;semantic-lex-spp-describe 
;semantic-lex-c-preprocessor-symbol-map(变量) 
;semantic-lex-c-preprocessor-symbol-filep(变量) 
;(semantic-add-system-include "~/" 'c-mode) 
;Other commands implemented by Senator 
;senator-kill-tag(C-c , C-w) 
;senator-yank-tag(C-c , C-y) 
;senator-copy-tag (C-c , M-w) 
;senator-isearch-toggle-semantic-mode(C-c , i) 
;senator-search-set-tag-class-filter(C-c , f) 
;senator-search-forward 
;senator-search-backward 
;re-search-forward 
;isearch-forward 
;Ecb 
;1）cvs -d:pserver:anonymous@ecb.cvs.sourceforge.net:/cvsr oot/ecb login 
;2）cvs -z3 -d:pserver:anonymous@ecb.cvs.sourceforge.net:/cvsr oot/ecb co -P ecb 
;3) 查看readme文件 
(add-to-list 'load-path "~/ecb") 
(load-file "~/ecb/ecb.el") 
(require 'ecb) 
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil 
      ecb-tree-indent 4 
      ecb-windows-height 0.5 
      ecb-windows-width 0.15 
      ecb-auto-compatibility-check nil 
      ecb-version-check nil 
      inhibit-startup-message t) 
(global-set-key [f12] 'ecb-activate) 
(global-set-key [C-f12] 'ecb-deactivate) 

;重启Emacs，在emacs执行M-x ecb-byte-complie编译，可以加快ECB运行速度 
;M-x ecb-show-help看在线帮助 
;M-x customize-option RET ecb-source-path RET设置源码目录 
;ECB默认是不支持鼠标响应的，需作如下设置：打开emacs中的菜单 ECB->Preferences->Most important...,找到Ecb Primary Secondary Mouse Buttons:并点击Show Value，选择第三个选项：Primary:mouse-1,secondary:mouse-2保存选项为以后所用

;通过 ~/.session 保存/恢复离开Emacs时的全局变量(kill-ring，命令记录...)，局部变量，寄存器，打开的文件，修改过的文件和最后修改的位置 
(require 'session) 
(add-hook 'after-init-hook 'session-initialize) 
;通过 ~/.emacs.desktop 保存/恢复离开Emacs时的所有Buffer(Emacs自带功能) 
(load "desktop") 
(desktop-save-mode) 

;w3m 
;1) cvs -d:pserver:anonymous@w3m.cvs.sourceforge.net:/cvsr oot/w3m login 
;2) cvs -z3 -d:pserver:anonymous@w3m.cvs.sourceforge.net:/cvsr oot/w3m co -P w3m 

;emacs-w3m 
;1) cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login 
;2) cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m 
;3) 用 Synaptic 安装 flim 包 
;4) 读/emacs-w3m/README 
;5) U：浏览一个网址； G：在标签页中打开一个网址； 左键：返回上一页； N：进入下一页； 空格：翻页； S：用google进行搜索 
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m") 
(require 'w3m-load) 
(require 'mime-w3m) 
;(setq w3m-command-arguments 
; (nconc w3m-command-arguments 
; '("-o" "http_proxy=http://proxycn2.huawei.com:8080/"))) 
;(setq no-proxy '("10.1.1.1","10.1.1.2")) 
;(setq w3m-no-proxy-domains '("local.com" "huawei.com")) 
(setq w3m-use-favicon nil) 
(setq w3m-command-arguments '("-cookie" "-F")) 
(setq w3m-use-cookies t) 
(setq w3m-home-page "http://producingoss.com/zh/") 
(setq w3m-icon-directory "~/emacs-w3m/icons30") 
(setq browse-url-browser-function 'w3m-browse-url) 

;Dictionary(支持配置代理) 
(add-to-list 'load-path "~/dictionary-1.8.7") 
(load "dictionary-init") 
(setq dictionary-server "localhost") 
;dictionary-port 
(global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words) ;定义鼠标快捷键 
;(global-set-key [(control c)(p)] 'dictionary-popup-matching-words)
;定义键盘快捷键 
;(global-set-key [(control c)(d)] 'dictionary) 
;(global-set-key [(control c)(s)] 'dictionary-search) 
;(global-set-key [(control c)(d)] 'dictionary-lookup-definition) 
;(global-set-key "\C-cm" 'dictionary-match-words) 
(setq dictionary-tooltip-dictionary "wn") 
(global-dictionary-tooltip-mode) 
;; create a fontsets 
(create-fontset-from-fontset-spec
"-adobe-courier-medium-r-*-*-14-*-*-*-*-*-fontset- adobe,
latin-iso8859-1:-adobe-courier-medium-r-*-*-14-*-* -*-*-*-*-1, 
latin-iso8859-2:-adobe-courier-medium-r-*-*-14-*-* -*-*-*-*-2, 
cyrillic-iso8859-5:-adobe-courier-medium-r-*-*-14- *-*-*-*-*-*-5, 
chinese-gb2312:*-song-medium-r-normal-*-14-*") 
(create-fontset-from-fontset-spec 
"-adobe-courier-medium-o-*-*-14-*-*-*-*-*-fontset- adobe, 
latin-iso8859-1:-adobe-courier-medium-o-*-*-14-*-* -*-*-*-*-1, 
latin-iso8859-2:-adobe-courier-medium-o-*-*-14-*-* -*-*-*-*-2, 
cyrillic-iso8859-5:-adobe-courier-medium-o-*-*-14- *-*-*-*-*-*-5, 
chinese-gb2312:*-song-medium-r-normal-*-14-*") 
(create-fontset-from-fontset-spec 
"-adobe-courier-bold-o-*-*-14-*-*-*-*-*-fontset-ad obe, 
latin-iso8859-1:-adobe-courier-bold-o-*-*-14-*-*-* -*-*-*-1, 
latin-iso8859-2:-adobe-courier-bold-o-*-*-14-*-*-* -*-*-*-2, 
cyrillic-iso8859-5:-adobe-courier-bold-o-*-*-14-*- *-*-*-*-*-5, 
chinese-gb2312:*-song-medium-r-normal-*-14-*") 
(create-fontset-from-fontset-spec 
"-adobe-courier-bold-r-*-*-14-*-*-*-*-*-fontset-ad obe, 
latin-iso8859-1:-adobe-courier-bold-r-*-*-14-*-*-* -*-*-*-1, 
latin-iso8859-2:-adobe-courier-bold-r-*-*-14-*-*-* -*-*-*-2, 
cyrillic-iso8859-5:-adobe-courier-bold-r-*-*-14-*- *-*-*-*-*-5, 
chinese-gb2312:*-song-medium-r-normal-*-14-*") 
(set-default-font "fontset-adobe") 
(setq default-frame-alist (append '((font . "fontset-adobe") 
(width . 78) (height . 45)))) 

;通过emacs阅读chm文档 
(add-to-list 'load-path (expand-file-name "/home/linux/emacs/rain")) 
(require 'chm-view) 
(custom-set-variables 
;; custom-set-variables was added by Custom. 
;; If you edit it by hand, you could mess it up, so be careful. 
;; Your init file should contain only one such instance. 
;; If there is more than one, they won't work right. 
'(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "linux"))))
'(ecb-options-version "2.40") 
'(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)) 
'(ede-locate-setup-options (quote (ede-locate-global)))) 

(custom-set-faces 
;; custom-set-faces was added by Custom. 
;; If you edit it by hand, you could mess it up, so be careful. 
;; Your init file should contain only one such instance. 
;; If there is more than one, they won't work right. 
)