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
      :url "git://github.com/mswift42/obsidian-theme"  
      :features obsidian-theme 
      :after (progn
          (load-theme 'obsidian t)
        )
      
      )  
      
      (
      :name evil-mode
      :type git  
      :url "git://github.com/emacsmirror/evil.git"  
      :features evil
    
      )
      
      (
      :name evil-leader
      :type git  
      :url "git://github.com/cofi/evil-leader.git"  
      :features evil-leader
      )
   )
)

(setq packages (mapcar 'el-get-source-name el-get-sources) )

(el-get 'sync packages)




;;Don't use backup files
(setq make-backup-files nil)

;;editor style
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10" ))
(setq-default line-spacing 1)
(global-linum-mode t)

;;Evil mode settings
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(evil-mode 1)



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
