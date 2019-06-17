;;; ~/.doom.d/org-tracker/export_csv.el -*- lexical-binding: t; -*-
(defun org-tracker-task-start ()
  (interactive)
  (org-tracker-prompt-time "STARTED_AT"))

(defun org-tracker-task-pr ()
  (interactive)
  (org-tracker-prompt-time "PR_AT"))

(defun org-tracker-task-done ()
  (interactive)
  (org-tracker-prompt-time "DONE_AT"))


(defun org-tracker-prompt-time (property)
  "Set property into a prompted time"
  (let ((timestamp (format-time-string
                     "%D"
                     (org-read-date
                      nil t nil "Enter start date" nil)
                     )))
    (org-set-property property timestamp))
  )
