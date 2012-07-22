(load-file "~/Projects/github/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/Projects/github/emacs-for-python/") ;; tell where to load the various files
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration

(global-hl-line-mode t)

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

(setq track-eol t)

(setq-default abbrev-mode t)
(setq save-abbrevs nil)

(setq user-full-name "William Yao")
(setq user-mail-address "monoyo@gmail.com")

(setq make-backup-files nil)
(setq auto-save-default nil)

(tool-bar-mode -1)

;; Kill a buffer without answering confirmation
(global-set-key [(control x) (k)] 'kill-this-buffer)
;; Auto kill processes when killing a buffer.
(delq 'process-kill-buffer-query-function kill-buffer-query-functions)

(if (not (memq system-type '(windows-nt ms-dos)))
    (require 'magit))

(setq custom-theme-directory "~/Projects/github/tomorrow-theme/GNU Emacs/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tomorrow-night-eighties)))
 '(custom-safe-themes (quote ("9117c98819cfdeb59780cb43e5d360ff8a5964d7dd9783b01708bda83098b9fd" "e992575f7c09459bfc190e6776b8f5f96964023e98267a87fb3094e7c9686776" "e439d894bf9406baf73056cf7e3c913ee5c794b6adadbbb9f614aebed0fd9ce7" "4870e6cb6f0a70c14ee73db30b69a8a1f08d6ec9a689c366e88636fb81e8022d" "cf2bb5e8046ca363183c87e8d33932f2a76a3d705b9db2721631777bbce92968" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
