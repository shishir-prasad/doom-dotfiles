(setq user-full-name "Shishir Prasad"
      user-mail-address "shishir@ibrew-hub.com")

(setq doom-theme 'doom-acario-dark)

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
                           "~/org/gtd/learning.org"
                           "~/org/gtd/ideas.org"
                           "~/org/gtd/tickler.org"
                           "~/org/gtd/tasks.org"
                           "~/org/gtd/inbox.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/org/gtd/journal/"
        org-journal-enable-agenda-integration t
        org-journal-file-type 'monthly
        org-journal-file-format "(%B)%m,%Y.org"
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
           "KILL(k)")))  ; Task was cancelled, aborted or is no longer applicable
  (setq org-capture-templates '(("t" "Todo" entry
                               (file+headline "gtd/tasks.org" "Tasks")
                               "* TODO %i%? \nDEADLINE: %^t")
                              ("T" "Tickler" entry
                               (file+headline "gtd/tickler.org" "Tickler")
                               "* TODO %i%? \nSCHEDULED: %^t")
                              ("d" "Day-Planner" plain
                               (file+olp+datetree "gtd/daily-planner.org")
                               "Most Important Tasks
- [ ]
- [ ]
- [ ]
Secondary Tasks
- [ ]
- [ ]
- [ ]
Other Tasks
- [ ] iBrew-Hub Website and content
- [ ] Journal entry about today's work"
                             :empty-lines-before 0 ))))

(map! :leader
      :desc "Org Capture"
      "a" #'org-capture)

(setq display-line-numbers-type 'relative)

(map! :leader
 (:prefix-map("d" . "Dired")
      :desc "Dired"
      "d" #'dired
      :leader
      :desc "Dired jump to current"
      "j" #'dired-jump
      (:after dired
       (:map dired-mode-map
        :leader
        :desc "Peep-dired image previews"
        "p" #'peep-dired
        :leader
        :desc "Dired view file"
        "v" #'dired-view-file))))
(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)


;(setq doom-theme 'doom-dracula)
;(setq doom-dracula-brighter-comments t)

(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(after! evil-escape
  (setq evil-escape-key-sequence "tn"))

(add-hook 'after-init-hook #'global-prettier-mode)
