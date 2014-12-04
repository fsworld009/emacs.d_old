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
      :name obsidian-theme
      :type git  
      :url "git://github.com/mswift42/obsidian-theme.git"  
      :features obsidian-theme 
      :after (load-theme 'obsidian t)
         
      )  
      
      (
      :name evil
      :type git  
      :url "git://gitorious.org/evil/chrisdunders-evil.git"  
      :features evil
      :after (progn
      (setq evil-emacs-state-cursor '("red" box))
            (setq evil-normal-state-cursor '("green" box))
            (setq evil-visual-state-cursor '("orange" box))
            (setq evil-insert-state-cursor '("red" bar))
            (setq evil-replace-state-cursor '("red" bar))
            (setq evil-operator-state-cursor '("red" hollow))
         )
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
   )
)

(setq packages (mapcar 'el-get-source-name el-get-sources) )

(el-get 'sync packages)



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
