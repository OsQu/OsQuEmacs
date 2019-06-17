;;; ~/.doom.d/org-tracker/export_csv.el -*- lexical-binding: t; -*-
(defun org-tracker-start-task ()
  (interactive)
  (let ((timestamp (format-time-string
                     "%D"
                     (org-read-date
                      nil t nil "Enter start date" nil)
                     )))
    (org-set-property "STARTED_AT" timestamp))
  )


(defun org-tracker-prompt-time (property)
  "Set property into a prompted time"
  (let ((timestamp (format-time-string
                     "%D"
                     (org-read-date
                      nil t nil "Enter start date" nil)
                     )))
    (org-set-property property timestamp))
  )
