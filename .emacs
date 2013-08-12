;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
(setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)
(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(global-font-lock-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)

(defun build-current-file ()
  "Build the current file , Kol Style"
  (interactive)
  (let* ((fName (buffer-file-name))
         (cmdStr (concat "php -l \""  fName "\" && build \"" (file-name-nondirectory fName) "\"" )))
   	(progn
   	 (save-buffer)
   	 (shell-command cmdStr "*run-current-file output*" ))
  )
)
(global-set-key (kbd "M-b") 'build-current-file)
(global-set-key (kbd "C-c c") 'delete-other-windows)


; hide menu bar
(menu-bar-mode -1)

	(defun select-next-window ()
	   "Switch to the next window" 
	     (interactive)
		   (select-window (next-window)))

	(defun select-previous-window ()
	   "Switch to the previous window" 
	     (interactive)
		   (select-window (previous-window)))

(global-set-key (kbd "M-j") 'select-next-window)
(global-set-key (kbd "M-k")  'select-previous-window)


(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;(require 'color-theme)
;(eval-after-load "color-theme"
   ;'(progn (color-theme-initialize) (color-theme-cdm)))
;
(keyboard-translate ?\C-h ?\C-?)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(php-function-call-face (\` default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(php-function-call-face ((t (:foreground "pink" :weight semi-bold))))
 '(font-lock-comment-face ((t (:foreground "pink" :weight semi-bold))))
 '(font-lock-variable-name-face ((t (:foreground "cyan" :weight light)))))
