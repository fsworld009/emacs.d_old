(add-to-list 'load-path "~/.emacs.d/el-get")

(add-to-list 'exec-path "C:/Program Files (x86)/git/bin/")


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(package-initialize)

(setq el-get-sources 
  '(
      (
      :name el-get
      :type git
      :url "git://github.com/mswift42/dimitri/el-get"
      :features el-get
      
      )
      
      
            (
      :name smyx-theme
      :type git  
      :url "https://github.com/tacit7/smyx.git"  
      :features smyx-theme
      :after (load-theme 'smyx t)
         
      )  
      

      
      (
      :name evil
      :type git  
      :url "git://gitorious.org/evil/chrisdunders-evil.git"  
      :features evil

      )
      
      ;;add redo support
      (
      :name undo-tree
      :type git
      :url "http://www.dr-qubit.org/git/undo-tree.git"
      :features undo-tree
      :after (global-undo-tree-mode 1)
      )
      
      (
      :name evil-leader
      :depends evil
      :type git  
      :url "git://github.com/cofi/evil-leader.git"  
      :features evil-leader
      )
      
      
      
     
      (
      :name helm
      :type git
      :url "git://github.com/emacs-helm/helm.git"
      :features helm
      :after ( progn
        (global-set-key (kbd "M-x") 'helm-M-x)
        (global-set-key (kbd "<f8>") 'helm-find-files)
        (global-set-key (kbd "<f7>") 'helm-buffers-list)
        (global-set-key (kbd "<f9>") 'helm-imenu)
        )
      )
      
      (
      :name linum-relative
      :type git
      :url "git://github.com/coldnew/linum-relative.git"
      :feaures linum-relative
      :after  (progn
          (require 'linum-relative)
          (global-set-key (kbd "<f3>") 'linum-relative-toggle)
        )
      )
      
      (
      :name powerline
      :type git
      :url "git://github.com/milkypostman/powerline.git"
      :features powerline

      )
      
      (
      :name powerline-evil
      :type git
      :url "git://github.com/raugturi/powerline-evil.git"
      :depends (evil powerline)
      :features powerline-evil
      :after (progn
            
            (powerline-evil-vim-color-theme)
            (display-time-mode t)
        )
      )
      
      (
      :name indent-guide
      :type git
      :url "git://github.com/zk-phi/indent-guide.git"
      :features indent-guide
      :after (progn
            (indent-guide-global-mode)
            (setq indent-guide-recursive t)
         )
      )
      
      (
      :name ace-jump-mode
      :type git
      :url "git://github.com/winterTTr/ace-jump-mode.git"
      :features ace-jump-mode
      :after (setq ace-jump-word-mode-use-query-char nil) ;;do not ask for any input in ace-jump-word mode
      )
      
      ;;required for discover-my-major
      (
      :name makey
      :type git
      :url "git://github.com/mickeynp/makey.git"
      :features makey
      )
      
      (
      :name discover-my-major
      :type git
      :url "git://github.com/steckerhalter/discover-my-major.git"
      :depends makey
      :features discover-my-major
      :after (global-set-key (kbd "<f1>") 'discover-my-major)
      )
      
      (
      :name evil-nerd-commenter
      :type git
      :depends evil-leader
      :url "git://github.com/redguardtoo/evil-nerd-commenter.git"
      :features evil-nerd-commenter
      )
      
      (
      :name evil-matchit
      :type git
      :depends evil
      :url "git://github.com/redguardtoo/evil-matchit.git"
      :features evil-matchit
      :after (global-evil-matchit-mode 1)
      )
      
      (
      :name evil-surround
      :type git
      :depends evil
      :url "git://github.com/timcharper/evil-surround.git"
      :features evil-surround
      :after (global-evil-surround-mode 1)
      )
      
      (
      :name js2-mode
      :type git
      :url "git://github.com/mooz/js2-mode.git"
      :features js2-mode
      :after (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      )
      
      (
      :name web-mode
      :type git
      :url "git://github.com/fxbois/web-mode.git"
      :features web-mode
      :after  (progn
          (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
          (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
          (set-face-attribute 'web-mode-html-tag-face nil :foreground "#96D9F1")
        )
      )

      
   )
)

(setq packages (mapcar 'el-get-source-name el-get-sources) )

(el-get 'sync packages)

;;Emacs shell
(ansi-color-for-comint-mode-on)

;;Don't use backup files
(setq make-backup-files nil)


;;default directory
(setq inhibit-startup-message t)
(setq default-directory "D:/Program/" )


;;utf-8
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;;highlight parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;;soft tab
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)            ;; but maintain correct appearance

;;editor style
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10" ))
(setq-default line-spacing 1)
(global-linum-mode t)

;;Evil mode settings
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-mode 1)

;;evil-leader bindings
(evil-leader/set-key ",w" 'evil-ace-jump-word-mode)
(evil-leader/set-key ",l" 'evil-ace-jump-line-mode)
(evil-leader/set-key ",c" 'evil-ace-jump-char-mode)
(evil-leader/set-key "u" 'undo-tree-visualize)
(evil-leader/set-key "cc" 'evilnc-comment-or-uncomment-lines)
(evil-leader/set-key "cl" 'evilnc-comment-or-uncomment-to-the-line)
(evil-leader/set-key "cp" 'evilnc-comment-or-uncomment-paragraphs)
(evil-leader/set-key "cy" 'evilnc-copy-and-comment-lines)
(evil-leader/set-key "cr" 'comment-or-uncomment-region)
(evil-leader/set-key "sc" 'evil-surround-change)
(evil-leader/set-key "sd" 'evil-surround-delete)
(evil-leader/set-key "ss" (lambda () (interactive) (call-interactively 'evil-surround-region))) ;;need improvement
(evil-leader/set-key "f" 'yafolding-discover)


(global-set-key (kbd "<f6>") (lambda () (interactive) (evil-surround-region "i" "w" nil (read-char)))) 

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized


;;global key bindings
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)


(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d2b1a25a5e2ed8815fe07a7ebf1b27e7095966bd0eb5afb8d0d1e85ef4809998" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
