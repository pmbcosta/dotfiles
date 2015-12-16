(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
              package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
              package-archives)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-ghc hi2 haskell-mode clojure-mode exec-path-from-shell sublime-themes elm-mode cider helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'elm-mode)
(require 'sublime-themes)
(load-theme 'brin t)

(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-identation)

;; Requires and configures company-gch

(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))


;; (add-hook 'haskell-mode-hook
;;           (lambda () (electric-indent-local-mode 0)))

;; (add-hook 'haskell-mode-hook 'turn-on-hi2)

;; (defun evil-shm/open-above (count)
;;   "Insert a new line above point and switch to Insert state.
;; The insertion will be repeated COUNT times."
;;   (interactive "p")
;;   (back-to-indentation)
;;   (save-excursion (shm/newline-indent))
;;   (setq evil-insert-count count
;;         evil-insert-lines t
;;         evil-insert-vcount nil)
;;   (evil-insert-state 1)
;;   (add-hook 'post-command-hook #'evil-maybe-remove-spaces))

;; (defun evil-shm/open-below (count)
;;   "Insert a new line below point and switch to Insert state.
;; The insertion will be repeated COUNT times."
;;   (interactive "p")
;;   (goto-char (line-end-position))
;;   (shm/newline-indent)
;;   (setq evil-insert-count count
;;         evil-insert-lines t
;;         evil-insert-vcount nil)
;;   (evil-insert-state 1)
;;   (add-hook 'post-command-hook #'evil-maybe-remove-spaces))

;; (evil-define-key 'normal shm-map
;;                (kbd "O") #'evil-shm/open-above
;;                (kbd "o") #'evil-shm/open-below)

