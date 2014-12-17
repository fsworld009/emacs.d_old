;;debug
(setq debug-on-error t)

(add-to-list 'load-path "~/.emacs.d/el-get")

(add-to-list 'exec-path "C:/Program Files (x86)/git/bin/")
(add-to-list 'exec-path "C:/node/")
(add-to-list 'exec-path "D:/emacs/config/ctags")

;;set the folder where node.js lookup for modules
(setenv "NODE_PATH" "C:/node/node_modules")
;;(setenv "CTAGS" "~/.emacs.d/")
(setenv "PATH" (concat (getenv "PATH") ";D:/emacs/config/ctags"))



(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;;With emacs 24.4+, ad-advised-definition-p function has been removed. You can add it back to fix the problem:
(defun ad-advised-definition-p (definition)
  "Return non-nil if DEFINITION was generated from advice information."
  (if (or (ad-lambda-p definition)
	  (macrop definition)
	  (ad-compiled-p definition))
      (let ((docstring (ad-docstring definition)))
	(and (stringp docstring)
	     (get-text-property 0 'dynamic-docstring-function docstring)))))




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
      :name sr-speedbar
      :type github
      :depends popup
      :pkgname "emacsmirror/sr-speedbar.git"
      :features sr-speedbar
      :depends simple-httpd
      :after (progn
          (global-set-key (kbd "<f2>") 'sr-speedbar-toggle)
          

          (sr-speedbar-refresh-turn-on)
        )
      )
      
      (
      :name popup
      :type git
      :url "git://github.com/auto-complete/popup-el.git"
      :features popup

      )      
      
      (
      :name auto-complete
      :type git
      :depends popup
      :url "git://github.com/auto-complete/auto-complete.git"
      :features auto-complete
      ) 
      
      (
      :name flycheck
      :type github
      :pkgname "flycheck/flycheck"
      :depends (s dash cl-lib f pkg-info)
      )       
      
      (
      :name tern
      :type github
      :pkgname "marijnh/tern"
      :depends (auto-complete)
      :load-path ("emacs")
      :features (tern tern-auto-complete)
      :after (progn
            (tern-ac-setup)
            (setq tern-command '("tern" "--no-port-file" "--persistent"))
          )
    
      ) 
      
      (
      :name simple-httpd
      )
      (
      :name htmlize
      )
      
      

      
      (
      :name impatient-mode
      :type github
      :depends (simple-httpd htmlize)
      :pkgname "skeeto/impatient-mode"
      :features impatient-mode
      )
      
      (
      :name rainbow-mode
      :type http
      :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/rainbow-mode/rainbow-mode.el"
      :features rainbow-mode
      :after (progn
            (add-hook 'css-mode-hook 'rainbow-mode)
            (add-to-list 'auto-mode-alist '("\\-theme.el$" . (lambda () (rainbow-mode) (emacs-lisp-mode))))
        )
      )
      
      (
      :name es-lib
      )
      
      (
      :name edit-color-stamp
      :type github
      :pkgname "sabof/edit-color-stamp"
      :features edit-color-stamp
      :depends es-lib
      )
      
      (
      :name mmm-mode
      :type github
      :pkgname "purcell/mmm-mode"
      :features mmm-mode
      :after (progn
                (setq mmm-global-mode 'maybe)
                (mmm-add-mode-ext-class 'html-mode nil 'html-css)
                (mmm-add-mode-ext-class 'html-mode nil 'html-js)
            )
          
      )
      
      (
      :name golden-ratio
      :after (golden-ratio-mode)
      )
      
      (
      :name emmet-mode
      :after (progn
            (add-hook 'html-mode-hook 'emmet-mode)
            (add-hook 'css-mode-hook 'emmet-mode)
        )
      )

      
;;================================language specific modes===================================
      


;;================================language specific modes END===================================
   )
)

(setq packages (mapcar 'el-get-source-name el-get-sources) )

(el-get 'sync packages)

;;================================minor mode settings===================================         
;;these settings don't work under ':after' for some reason


;;================================language specific modes hooks===================================         

(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))
(add-hook 'js-mode-hook (lambda () (tern-mode t)))





;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)


          (speedbar-add-supported-extension ".css")
          (setq speedbar-fetch-etags-command "ctags")
          (setq speedbar-fetch-etags-arguments '("-e" "-f" "-"))
          (add-to-list 'speedbar-fetch-etags-parse-list '("\\.css" . speedbar-parse-c-or-c++tag))


;;Emacs shell
(ansi-color-for-comint-mode-on)


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

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
(evil-leader/set-key "ec" 'edit-color-stamp)

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
