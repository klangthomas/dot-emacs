;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("4ba6aa8a2776688ef7fbf3eb2b5addfd86d6e8516a701e69720b705d0fbe7f08" default)))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(undo-limit 8000000)
 '(undo-outer-limit 120000000)
 '(undo-strong-limit 120000000)
 '(vhdl-company-name "KLANG:technologies")
 '(vhdl-compose-architecture-name (quote (".*" . "behavioral")))
 '(vhdl-file-header
   "-------------------------------------------------------------------------------
-- Title      : <title string>
-- Project    : <project>
-------------------------------------------------------------------------------
-- File       : <filename>
-- Author     : Thomas Maintz - thomas.maintz@klang.com
-- Company    : KLANG technologies GmbH
-- Created    : <date>
-- Last update: <date>
-- Platform   : <platform>
-- Standard   : <standard>
<projectdesc>-------------------------------------------------------------------------------
-- Description: <cursor>
<copyright>-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- <date>  1.0      <login>	Created
-------------------------------------------------------------------------------

")
 '(vhdl-upper-case-keywords nil)
 '(vhdl-upper-case-types nil))

;; ---------------------------
;; --- change default font ---
;; ---------------------------

(create-fontset-from-fontset-spec "-misc-fixed-medium-r-normal--15-*-*-*-c-90-fontset-Fixed")
(create-fontset-from-fontset-spec "-*-Droid Sans Mono-medium-r-normal-*-14-*-*-*-m-*-fontset-Droid")
(create-fontset-from-fontset-spec "-zevv-peep-medium-r-normal--16-*-*-*-c-*-fontset-Zevv")

(global-set-key (kbd "<M-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<M-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "<mouse-6>") (lambda (event) (interactive "e")))
(global-set-key (kbd "<mouse-7>") (lambda (event) (interactive "e")))

;; ---------------------------------
;; --- git program declaration   ---
;; ---------------------------------
(setq exec-path (cons "C:/Program Files/Git/bin" exec-path))

;; ---------------------------------
;; --- el-get package management ---
;; ---------------------------------

;; overlay newer gnus packages over emacs defaults
(push "~/.emacs.d/el-get/gnus/lisp/" load-path)

;; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; configure el-get
(setq el-get-install-branch "master"
      el-get-install-skip-emacswiki-recipes t
;      el-get-git-shallow-clone t
      )

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max)) (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-recipes")

;; BEGIN PACKAGE LIST to el-get
(setq my-el-get-packages '(el-get))

;; general emacs behaviour extensions
(push 'ag my-el-get-packages)
(push 'bm my-el-get-packages)
(push 'clang-format my-el-get-packages)
(push 'column-marker my-el-get-packages)
(push 'diminish my-el-get-packages)
(push 'flymake my-el-get-packages)
(push 'folding my-el-get-packages)
(push 'ggtags my-el-get-packages)
(push 'google-this my-el-get-packages)
(push 'goto-last-change my-el-get-packages)
(push 'iedit my-el-get-packages)
(push 'leuven-theme my-el-get-packages)
(push 'multiple-cursors my-el-get-packages)
(push 'rainbow-delimiters my-el-get-packages)
(push 'rebox2 my-el-get-packages)
(push 'smex my-el-get-packages)
(push 'smooth-scrolling my-el-get-packages)
(push 'ws-butler my-el-get-packages)
(push 'company-mode my-el-get-packages)

;; system naviation modes
(push 'dired+ my-el-get-packages)
(push 'openwith my-el-get-packages)

;; text modes
(push 'markdown-mode my-el-get-packages)


;; programming modes
(push 'header2 my-el-get-packages)
(push 'irony-mode my-el-get-packages)
(push 'company-irony my-el-get-packages)

;; version control
;;(push 'magit my-el-get-packages)
;;(push 'magit-svn my-el-get-packages)

;; email and news reader
;(push 'gnus my-el-get-packages)
;(push 'bbdb my-el-get-packages)
;(push 'tc my-el-get-packages ) ;; trivial cite
;(push 'gnus-notify my-el-get-packages)

;; END PACKAGE LIST for el-get

;; install missing packages from list above
(el-get 'sync my-el-get-packages)
;; remove everything not in the list above
(el-get-cleanup my-el-get-packages)

;; --------------------------
;; --- Start emacs server ---
;; --------------------------

(server-start)

;; ---------------------------------------------------
;; --- Load theme and override faces via customize ---
;; ---------------------------------------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'grandshell t)
;;(load-theme 'green-phosphor t)
;;(load-theme 'mytheme t)

(defun my-presentation-font ()
  "Set the default font to be BIG (for presentations)."
  (interactive)
  (set-face-font 'default "-*-terminus-medium-r-*-*-28-*-*-*-*-*-*-*"))

(defun my-presentation-light-font ()
  "Set the default font to be BIG (for presentations) and switch to light theme."
  (interactive)
  (set-face-font 'default "-*-terminus-medium-r-*-*-28-*-*-*-*-*-*-*")
  (disable-theme 'mytheme)
  ;;(disable-theme 'grandshell)
  (load-theme 'leuven t))

;; -----------------------------------
;; --- Load some custom extensions ---
;; -----------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)

(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . latex-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; --- set up hunspell for flyspell-mode ---

(setq ispell-program-name "/usr/bin/hunspell")

(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '((nil     ; default
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US") nil utf-8)
        ("en_US" ; Yankee English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US") nil utf-8)
        ("en_GB" ; British English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_GB") nil utf-8)
        ("de_DE"
         "[a-zäöüßA-ZÄÖÜ]" "[^a-zäöüßA-ZÄÖÜ]" "['-]" t ("-d" "de_DE") nil utf-8)
        )
      )

;; --- pmwiki mode ---

(setq pmwiki-main-wiki-base-uri
      "http://taekwondo-wiki.de/")
(setq pmwiki-main-homepage-uri
      (concat pmwiki-main-wiki-base-uri "Main/HomePage"))

;; --- simple generic-mode for structures wiki notes ---

(require 'generic-x)

(defface my-title-text-face
  '((t (:foreground "Cyan1" :weight bold)))
  "My custom face for wiki note titles")

(define-generic-mode 'notes-mode
  '("#")                            ; comments start with '#'
  '()                               ; keywords
  '(("^\\(Titel\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'my-title-text-face))
    ("^\\(.*\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'font-lock-variable-name-face))
    )
  '("\\.txw$")                        ;; files for which to activate this mode
  ()                                 ;; other functions to call
  "A mode for structured wiki-like notes"
)

;; --- autoload dokuwiki editing mode ---

(global-unset-key [(control v)])

(autoload 'dokuwiki-mode "dokuwiki" "DokuWiki Mode" t)
(autoload 'dokuwiki-get-page "dokuwiki" "DokuWiki Mode" t)

(global-set-key [(control v)(control d)] 'dokuwiki-get-page)

(setq dokuwiki-username "Timo"
      dokuwiki-password "test"
      dokuwiki-base-url "idlebox.net/dw")

;; --- org-mode customizations ---

(add-hook 'org-mode-hook
          (lambda ()
            (local-unset-key [(meta shift up)])
            (local-unset-key [(meta shift down)])
            (local-set-key [(control shift up)] 'org-move-subtree-up)
            (local-set-key [(control shift down)] 'org-move-subtree-down)
            (local-set-key [(control shift left)] 'org-promote-subtree)
            (local-set-key [(control shift right)] 'org-demote-subtree)
            (local-set-key [(control return)] 'org-insert-subheading)
            ))

(setq org-default-notes-file "~/synca/01-OrgTassen/TODO.org")

(global-set-key (kbd "<f1>") 'org-todo-list)
(global-set-key (kbd "\C-cc") 'org-capture)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t) (shell . t)))

;; save the clock history across Emacs sessions
(org-clock-persistence-insinuate)

;; -- load Dired+ when dired is loaded

(require 'dired-copy-paste)

(define-key dired-mode-map "\C-w" 'dired-copy-paste-do-cut)
(define-key dired-mode-map "\M-w" 'dired-copy-paste-do-copy)
(define-key dired-mode-map "\C-y" 'dired-copy-paste-do-paste)

(require 'dired-fixups)

(defun my-dired-mouse-find-file (event)
  "In dired, visit the file or directory name you click on."
  (interactive "e")
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
            pos (posn-point (event-end event)))
      (if (not (windowp window))
          (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (setq file (dired-get-file-for-visit)))
    (if (file-directory-p file)
        (or (and (cdr dired-subdir-alist)
                 (dired-goto-subdir file))
            (progn
              (select-window window)
              (dired file)))
      (select-window window)
      (find-file (file-name-sans-versions file t)))))

(defun set-my-dired-keys-hook ()
  "My favorite dired keys."
  ; for some reason mouse-2 = left click (mouse-1)
  (define-key dired-mode-map [mouse-2] 'my-dired-mouse-find-file)
  (define-key dired-mode-map [M-mouse-2] 'diredp-mouse-find-file-other-frame)
  ; backspace
  (define-key dired-mode-map [backspace] 'dired-up-directory)
)

(add-hook 'dired-mode-hook 'set-my-dired-keys-hook)

;; whitespace cleaning butler mode
(ws-butler-global-mode 1)
;; hide "wb" minor mode
(diminish 'ws-butler-mode)

;; cap'n'proto

(autoload 'capnp-mode "capnp-mode" "Capnp Mode" t)

(add-to-list 'auto-mode-alist '("\\.capnp$" . capnp-mode))

;; -------------------------------
;; --- Automatic Mode Triggers ---
;; -------------------------------

; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

; special web site scripts
(add-to-list 'auto-mode-alist '("\\.htt\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.blog\\'" . html-mode))

; perl XS extensions recognition
(add-to-list 'auto-mode-alist '("\\.xs\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pc\\'" . c++-mode))

; some more c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

; doxygen mode
(defun my-dox-mode ()
  "Add some latex macro keys"
  (interactive)
  (c++-mode)
  (visual-line-mode 1)
  (flyspell-mode)
  (set-variable 'fill-column 100000)
)
(add-to-list 'auto-mode-alist '("\\.dox\\'" . my-dox-mode))

; customize markdown mode
; doxygen mode
(defun my-markdown-mode ()
  "Customize markdown mode"
  (interactive)
  (visual-line-mode 1)
  (flyspell-mode)
  (set-variable 'fill-column 100000)
)
(add-hook 'markdown-mode-hook 'my-markdown-mode)

(folding-add-to-marks-list 'lua-mode "-- {{{" "-- }}}" nil t)

;; -----------------------------
;; --- General Customization ---
;; -----------------------------

;; put all temporary files into /tmp
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)
(setq tramp-auto-save-directory emacs-tmp-dir)
(setq tramp-persistency-file-name (format "%s/tramp" emacs-tmp-dir))
(setq image-dired-dir (format "%s/image-dired" emacs-tmp-dir))

;; add line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; disable toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; hook for cperl-mode to automatically set my favorite style
;;(add-hook 'cperl-mode-hook (lambda () (cperl-set-style "C++")))

;; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m]"))

;; in every buffer, the line which contains the cursor will be fully highlighted
;(global-hl-line-mode 1)
;; enable inline images:
;(iimage-mode)

;; ---------------------------
;; --- Irony Configuration ---
;; ---------------------------
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

; quick comment and uncommenting
(global-set-key (kbd "C-c SPC") 'comment-or-uncomment-region)

; kills all them buffers except scratch.
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

; set keys f9-f12 to insert German umlauts and sz
; (global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
;(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
;(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
;(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
;(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
;(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
;(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

; magit status

;(global-set-key (kbd "<C-f12>") 'magit-status)

; auto-load magit-svn-mode if git-svn repo is detected.
;(add-hook 'magit-mode-hook
;          (lambda()
            ;(require 'magit-svn)
            ;(if (magit-svn-get-ref-info) (magit-svn-mode))
;           ))

;; Git-Commit-Mode: flyspell
;(add-hook 'git-commit-mode-hook 'turn-on-flyspell)


;; -----------------------------
;; --- bm line bookmark mode ---
;; -----------------------------

(global-set-key (kbd "<M-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; ------------------------
;; --- Smooth Scrolling ---
;; ------------------------

;; Scroll line by line
(setq redisplay-dont-pause t)
;; number of lines at the top and bottom of a window.
(setq scroll-margin 2)
;; Controls if scroll commands move point to keep its screen position unchanged.
(setq scroll-preserve-screen-position nil)

(require 'smooth-scrolling)
 ;; four line at a time
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4)))
 ;; accelerate scrolling
(setq mouse-wheel-progressive-speed 't)
 ;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)
;; keyboard scroll four line at a time
(setq scroll-step 4)
;; number of lines at the top and bottom of a window.
(setq smooth-scroll-margin 3)
(setq smooth-scroll-strict-margins 't)

;; ---------------------------------
;; --- Window Movement Shortcuts ---
;; ---------------------------------

(require 'windmove)
(windmove-default-keybindings)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; -------------------
;; --- rebox2 mode ---
;; -------------------

(require 'rebox2)

;; customisation of rebox
(rebox-register-template
 71 999 '("??! box123456"))

(rebox-register-template
 272 999
 '("/*!"
   " * box123456"
   " */"))

;; set styles
(setq rebox-style-loop '(71 272))

;; --------------------------------
;; --- C/C++ Mode Configuration ---
;; --------------------------------

(defun tb-c-common-hook ()
  ;; switch between .cpp/.hpp files
  (local-set-key [f3] 'ff-find-other-file)

  ;; gnu global tag lookup
  ;(ggtags-mode 1)

  ;; use rebox2 mode
  (local-set-key [(shift meta q)] 'rebox-cycle)

  ;; flyspell mode for comments
  (flyspell-prog-mode)

  ;; org-table mode support for comments
  (orgtbl-mode)

  ;; add C++11 keywords to font-lock
  (require 'modern-cpp-font-lock)
  (modern-c++-font-lock-mode)

  ;; hide "mc++fl" minor mode
  (diminish 'modern-c++-font-lock-mode)

  ;; ------------------------------------------------------------
  ;; add keywords for Qt code (signals, slots, and some Q_ macros

  (setq c-protection-key
        (concat "\\<\\(public\\|public slot\\|protected"
                "\\|protected slot\\|private\\|private slot"
                "\\)\\>")
        c-C++-access-key
        (concat "\\<\\(signals\\|public\\|protected\\|private"
                "\\|public slots\\|protected slots\\|private slots"
                "\\)\\>[ \t]*:"))

  ;; modify the colour of slots to match public, private, etc ...
  (font-lock-add-keywords
   'c++-mode '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
  ;; make new font for rest of qt keywords
  (make-face 'qt-keywords-face)
  (set-face-foreground 'qt-keywords-face "MediumPurple")
  ;; qt keywords
  (font-lock-add-keywords 'c++-mode '(("\\<Q_[A-Z]*\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))

  ;; ---[ end Qt code ]------------------------------------------
)

;(add-hook 'c-mode-common-hook 'tb-c-common-hook)

;; mark 80th column on some modes

(add-hook 'c-mode-common-hook (lambda () (column-marker-1 80)))
(add-hook 'cmake-mode-hook (lambda () (column-marker-1 80)))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; --------------------------------
;; --- ECB - Emacs Code Browser ---
;; --------------------------------

;; (setq ecb-tip-of-the-day nil) ;; no ecb tip of the day
;; (setq stack-trace-on-error t)

;; --------------------
;; --- ido and smex ---
;; --------------------

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(global-set-key (kbd "M-x") 'smex)

;; --------------------
;; --- C/++ support ---
;; --------------------
(require 'header2)

(defsubst my/header-description ()
  "Insert \"Description: \" line."
  (insert header-prefix-string "Description: \n"))

(defsubst my/header-author ()
  "Insert current user's name (`user-full-name') as this file's author."
  (insert (concat header-prefix-string "      Author: " (user-full-name) "\n")))

(defsubst my/header-commentary ()
  "Insert the commentary section"
  (insert (concat header-prefix-string " Commentary : \n")))

(defsubst my/header-dash-line ()
  "Insert dashed line"
  (insert header-prefix-string)
  (insert-char ?- fill-column)
  (insert "\n"))

(defsubst my/header-clean-line ()
  "Insert dashed line"
  (insert "\n"))

(setq make-header-hook '(my/header-dash-line
			 header-title
                         my/header-dash-line
			 header-blank
                         header-file-name
			 header-version
			 my/header-description
			 header-blank
			 my/header-dash-line
			 header-blank
                         header-author
			 header-creation-date
			 header-blank
			 header-modification-date
			 header-modification-author
			 header-update-count
			 header-blank
			 my/header-commentary
			 header-blank
			 header-blank
                         my/header-dash-line
			 my/header-clean-line
			 my/header-clean-line
			 header-eof))

(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook   'auto-make-header)

(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

(global-set-key (kbd "C-c h") 'make-header)

;; ------------------------
;; --- Multiple Cursors ---
;; ------------------------

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c !") 'mc/mark-all-dwim)

(add-hook 'multiple-cursors-mode-hook
          (lambda ()
            (define-key mc/keymap (kbd "<return>") nil)
            ))

;; ------------------------------------------------
;; --- Increment and Decrement Numbers at Point ---
;; ------------------------------------------------
;; from http://www.emacswiki.org/emacs/IncrementNumber

(defun increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))

(defun decrement-number-decimal (&optional arg)
  (interactive "p*")
  (increment-number-decimal (if arg (- arg) -1)))

(defun increment-number-hexadecimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer hex-format)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789abcdefABCDEF")
        (when (re-search-forward "[0-9a-fA-F]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 16) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 16 field-width) answer)))
          (if (equal (match-string 0) (upcase (match-string 0)))
              (setq hex-format "X")
            (setq hex-format "x"))
          (replace-match (format (concat "%0" (int-to-string field-width)
                                         hex-format)
                                 answer)))))))

(defun decrement-number-hexadecimal (&optional arg)
  (interactive "p*")
  (increment-number-hexadecimal (if arg (- arg) -1)))

;; -------------------------------------------
;; --- Custom Minor Mode for Global Keymap ---
;; -------------------------------------------

;; http://emacs.stackexchange.com/questions/352/how-to-override-major-mode-bindings

(defvar my-keymap-mode-map (make-sparse-keymap)
  "Keymap while my-keymap-mode is active.")

(define-minor-mode my-keymap-mode
  "A minor mode so that my key settings override annoying major modes."
  nil
  :lighter ""
  my-keymap-mode-map)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keymap-mode))
      (let ((mykeys (assq 'my-keymap-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keymap-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(defun turn-on-my-keymap-mode ()
  "Turns on my-keymap-mode."
  (interactive) (my-keymap-mode t))

(defun turn-off-my-keymap-mode ()
  "Turns off my-keymap-mode."
  (interactive) (my-keymap-mode -1))

;; ---- list of global key bindings ----

;; ag- or rgrep-based project-wide search
(defun my-ag-grep ()
  "Launch ag or grep in current directory."
  (interactive)
  (if
      ;; if buffer is under tramp
      (file-remote-p default-directory)
      ;; call rgrep for remote buffers
      (call-interactively 'rgrep)
    ;; call ag for local buffers
    (call-interactively 'ag)
    )
  )
(define-key my-keymap-mode-map (kbd "C-c C-s") 'my-ag-grep)

;; window handling
(define-key my-keymap-mode-map "\M-`" 'delete-other-windows)
(define-key my-keymap-mode-map "\M-2" 'make-frame)
(define-key my-keymap-mode-map "\M-3" 'delete-frame)

;; loading the buffer list
(define-key my-keymap-mode-map [C-x C-b] 'buffer-menu)
(define-key my-keymap-mode-map [M-S-up] 'ibuffer)

;; fast nagivation in buffer stack
(define-key my-keymap-mode-map [M-S-left] 'previous-buffer)
(define-key my-keymap-mode-map [M-S-right] 'next-buffer)

;; F4 -> launch a terminal (just about anywhere)
(defun my-terminal (&optional arg)
  "Launch terminal in current directory."
  (interactive)
  ;(start-process "terminal" "*scratch*" "/usr/bin/urxvt")
  (if
      ;; if buffer is under tramp
      (file-remote-p default-directory)
      (shell)
    (start-process "terminal" nil "/usr/bin/urxvt")
    )
)
(define-key my-keymap-mode-map [f4] 'my-terminal)

;; C-\\ -> iedit mode
(define-key my-keymap-mode-map (kbd "C-\\") 'iedit-mode)

;; globally activate keymap
(define-globalized-minor-mode
  global-my-keymap-mode my-keymap-mode turn-on-my-keymap-mode)

(global-my-keymap-mode)

;; Turn off the minor mode in the minibuffer
(add-hook 'minibuffer-setup-hook 'turn-off-my-keymap-mode)

;; modify ibuffer keymap: mouse click opens a file
(defun my-ibuffer-keys ()
  "Modify keymaps used by `ibuffer'."
  (local-set-key (kbd "<down-mouse-1>") 'ibuffer-visit-buffer)
  )

(add-hook 'ibuffer-hook 'my-ibuffer-keys)

;; -------------------------------
;; --- Less Latency with Tramp ---
;; -------------------------------
(require 'tramp)

(defvar disable-tramp-backups '(all))

(eval-after-load "tramp"
   '(progn
      (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
      ;; Modified from https://www.gnu.org/software/emacs/manual/html_node/tramp/Auto_002dsave-and-Backup.html
      (setq backup-enable-predicate
            (lambda (name)
              (and (normal-backup-enable-predicate name)
                   ;; Disable all tramp backups
                   (and disable-tramp-backups
                        (member 'all disable-tramp-backups)
                        (not (file-remote-p name 'method)))
                   (not ;; disable backup for tramp with the listed methods
                    (let ((method (file-remote-p name 'method)))
                      (when (stringp method)
                        (member method disable-tramp-backups)))))))

      (defun tramp-set-auto-save--check (original)
        (if (funcall backup-enable-predicate (buffer-file-name))
            (funcall original)
          (auto-save-mode -1)))

      (advice-add 'tramp-set-auto-save :around #'tramp-set-auto-save--check)

      ;; Use my ~/.ssh/config control master settings according to https://puppet.com/blog/speed-up-ssh-by-reusing-connections
      (setq tramp-ssh-controlmaster-options ""))
   )

;;(setq remote-file-name-inhibit-cache nil)
;;(setq vc-ignore-dir-regexp
;;      (format "%s\\|%s" vc-ignore-dir-regexp tramp-file-name-regexp))

;;(require 'org-s5)

;; ------------------------------------
;; --- Highlighting of current line ---
;; ------------------------------------
;;(global-hl-line-mode 1)
;; underline the current line
;;(set-face-attribute hl-line-face nil :underline t)

(defun highlight-selected-window ()
  "Highlight selected window with a different background color."
  (walk-windows (lambda (w)
                  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
                      (buffer-face-set '(:background "#dde"))))))
  (buffer-face-set 'default))
(add-hook 'buffer-list-update-hook 'highlight-selected-window)

;;(custom-set-faces
;; '(mode-line ((t (:background "dim yellow" :foreground "white"))))
;; '(mode-line-inactive ((t (:background nil)))))


;; ------------------------------------
;; --- VHDL Tool from vhdltool.com  ---
;; ------------------------------------
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
;;
;;(require 'use-package)
;;(setq lsp-vhdl-server-path "vhdl-tool")
;
;;(use-package lsp-mode
;;         :config
;;         (add-hook 'vhdl-mode-hook 'lsp))
