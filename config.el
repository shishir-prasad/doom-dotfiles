(setq user-full-name "Shishir Prasad"
      user-mail-address "shishir@ibrew-hub.com")

(setq doom-theme 'doom-one)

(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
   (pcase org-journal-file-type
     (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
     (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
     (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
     (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))


(after! org
  (require 'org-bullets)  ; Nicer bullets in org-mode
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/gtd/projects.org"
                           "~/org/gtd/meetings.org"
                           "~/org/gtd/home.org"
                           "~/org/gtd/work.org"
                           "~/org/gtd/ideas.org"
                           "~/org/gtd/inbox.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/org/gtd/journal/"
        org-journal-enable-agenda-integration t
        org-journal-file-type 'monthly
        org-journal-file-format "%B,%Y.org"
        org-journal-carryover-items "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"PROJ\"|TODO=\"STRT\"|TODO=\"WAIT\"|TODO=\"HOLD\""
        org-journal-date-format "%B %d, %Y (%A)"

        org-journal-file-header 'org-journal-file-header-func
        org-hide-emphasis-markers t
        org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; Project with multiple task items.
           "NEXT(n)"  ; Task is next to be worked on.
           "WAIT(w)"  ; Something external is holding up this task
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)")))) ; Task was cancelled, aborted or is no longer applicable

(setq display-line-numbers-type t)
