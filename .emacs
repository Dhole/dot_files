(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 100 :width normal)))))

;; Custom options by Dhole


;; Set identation style for C/C++
(setq c-default-style "bsd"
      c-basic-offset 4)

 ;; Visually wrap words only in text mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Enable uniquify: name buffers inteligently
(require 'uniquify)

(setq column-number-mode t)

;; Highlight matching ([{
(show-paren-mode 1)

;; Enable spelling correction
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

(electric-indent-mode 1) 

;;; Indentation for python

;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    t))
(add-to-list 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)


;; Auto indent yanked code
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))


(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(global-linum-mode t)

;; End
(add-to-list 'load-path "~/.emacs.d/") 

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

(require 'fill-column-indicator)
  (setq fci-rule-width 1)
  (setq fci-rule-color "darkgreen")
  (add-hook 'prog-mode-hook 'fci-mode)
