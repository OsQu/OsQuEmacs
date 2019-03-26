;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(load-file "~/.doom.d/org-exports/flowdock.el")
(load-theme 'doom-solarized-light t)

(setq display-line-numbers-type 'relative)
(setq-default show-trailing-whitespace t)

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

(setq projectile-project-search-path '("~/smartly/"))

(setq-default fill-column 120)
(setq org-mode-headline-style 'setext)


;; Autocompletion
(set-company-backend! 'python-mode '(company-jedi company-files))
(set-company-backend! 'ruby-mode '(company-files company-dabbrev-code))
(set-company-backend! 'rjsx-mode '(company-lsp company-dabbrev-code))
(set-company-backend! 'typescript-mode '(company-tide company-dabbrev-code))

;; Keybingins

(map! :leader
      (:desc "file" :prefix "f"
        :desc "Find in files" :n "s" #'helm-do-ag-project-root))

(setq ruby-insert-encoding-magic-comment nil)

;; Javascript
(require 'flycheck)
(require 'lsp-mode)
(require 'lsp-ui)
(eval-after-load 'javascript-mode
  '(progn
     (add-hook 'js2-mode-hook #'add-node-modules-path)))
(add-hook 'js2-mode-hook 'prettier-js-mode)

(defun my/disable-checkers ()
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint) '(html-tidy))))

(add-hook 'flycheck-mode-hook 'my/disable-checkers)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . javascript-mode))

(flycheck-add-next-checker 'lsp-ui 'javascript-eslint)

;; Typescript
(defun my/setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (prettier-js-mode +1))
(setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'my/setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (my/setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Go
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)))

;; Org mode
(setq org-agenda-files '("~/Dropbox/org/work" "~/Dropbox/org" "~/Dropbox/org/omat" "~/Dropbox/org/omat/talo"))
(setq org-default-notes-file (expand-file-name "~/Dropbox/org/refile.org"))
(setq org-use-tag-inheritance nil)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
