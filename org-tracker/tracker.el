;;; ~/.doom.d/org-tracker/export_csv.el -*- lexical-binding: t; -*-
(defun org-tracker-task-start ()
  (interactive)
  (org-tracker-prompt-time "STARTED_AT" "Started at"))

(defun org-tracker-task-pr ()
  (interactive)
  (org-tracker-prompt-time "PR_AT" "Moved to PR at"))

(defun org-tracker-task-done ()
  (interactive)
  (org-tracker-prompt-time "DONE_AT" "Done at"))


(defun org-tracker-prompt-time (property readable-property)
  "Set property into a prompted time"
  (let ((timestamp (format-time-string
                     "%D"
                     (org-read-date
                      nil t nil (concat "Enter " readable-property ":") nil)
                     )))
    (org-set-property property timestamp))
  )
