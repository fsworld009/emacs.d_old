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




;;Key bindings
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
