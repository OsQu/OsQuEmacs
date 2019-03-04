;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(load-theme 'doom-solarized-light t)

(setq display-line-numbers-type 'relative)
(setq-default show-trailing-whitespace t)

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

(setq projectile-project-search-path '("~/smartly/"))

;; Autocompletion
(set-company-backend! 'python-mode '(company-jedi company-files))
(set-company-backend! 'ruby-mode '(company-files company-dabbrev-code))

;; Keybingins

(map! :leader
      (:desc "file" :prefix "f"
        :desc "Find in files" :n "s" #'helm-do-ag-project-root))

(setq ruby-insert-encoding-magic-comment nil)

;; Javascript
(eval-after-load 'javascript-mode
    (add-hook 'js-mode-hook #'add-node-modules-path))

(defun my/disable-jshint ()
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint))))

(add-hook 'flycheck-mode-hook 'my/disable-jshint)
