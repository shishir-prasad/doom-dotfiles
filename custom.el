(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/org/gtd/projects.org" "~/org/gtd/learning.org" "~/org/gtd/tickler.org" "~/org/gtd/tasks.org" "/Users/shishir/org/gtd/journal/(June)06,2021.org"))
 '(org-todo-keywords
   '((sequence "TODO(t)" "PROJ(p)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "KILL(k)")
     (sequence "[ ](T)" "[-](S)" "|" "[X](D)")
     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 '(package-selected-packages '(org-plus-contrib)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-checkbox ((t (:foreground nil :inherit org-todo)))))
(put 'customize-face 'disabled nil)
