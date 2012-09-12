(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
 '(c-offsets-alist (quote ((inline-open . 0) (innamespace . 0))))
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(cperl-extra-newline-before-brace nil)
 '(cperl-extra-newline-before-brace-multiline nil)
 '(ede-project-placeholder-cache-file "~/.emacs.d/projects.ede")
 '(ede-simple-save-directory "~/.emacs.d/ede-simple")
 '(fill-column 79)
 '(flymake-no-changes-timeout 5)
 '(flyspell-issue-welcome-flag nil)
 '(flyspell-large-region nil)
 '(font-latex-fontify-sectioning 1.0)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(rebox-style-loop (quote (370 243)))
 '(safe-local-variable-values (quote ((rebox-min-fill-column . 100) (rebox-min-fill-column . 110) (rebox-min-fill-column . 120))))
 '(scroll-bar-mode (quote right))
 '(semanticdb-default-save-directory "~/.emacs.d/semanticdb")
 '(size-indication-mode t)
 '(srecode-map-save-file "~/.emacs.d/srecode/srecode-map")
 '(vc-handled-backends nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 117 :width normal :foundry "Misc" :family "Fixed"))))
 '(font-latex-sectioning-5-face ((((class color) (background dark)) (:foreground "#00c000"))))
 '(font-latex-slide-title-face ((t (:inherit (variable-pitch font-lock-type-face) :weight bold))))
 '(font-latex-warning-face ((((class color) (background dark)) (:foreground "#c00000"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "Red" :weight bold)))))

;; ---------------------------------
;; --- Distinction between hosts ---
;; ---------------------------------

(defun system-host-is-iti ()
  "true if system host is at ITI"
  (string-match "iti\.kit\.edu$" system-name)
)

;; -----------------------------------
;; --- Load some custom extensions ---
;; -----------------------------------

(add-to-list 'load-path "~/.emacs.d/")

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)

(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . latex-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; --- autoload actionscript mode ---

(autoload 'actionscript-mode "actionscript-mode-connors" "ActionScript Mode" t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; --- autoload haxe mode ---

(autoload 'haxe-mode "haxe-mode" "haXe Mode" t)
(add-to-list 'auto-mode-alist '("\\.haxe$" . haxe-mode))

;; --- autoload template toolkit mode ---

(autoload 'tt-mode "tt-mode" "Template Toolkit Mode" t)

;; --- autoload protocol buffers mode ---

(autoload 'protobuf-mode "protobuf-mode" "Protocol Buffers Mode" t)

;; --- autoload auto-dictionary-mode ---

(autoload 'auto-dictionary-mode "auto-dictionary" "Flyspell Dictionary Guesser" t)

;; --- autoload mediawiki editing mode ---

(add-to-list 'load-path "~/.emacs.d/mediawiki-el/")
(autoload 'mediawiki-site "mediawiki" "MediaWikiMode" t)
(autoload 'mediawiki-open "mediawiki" "MediaWikiMode" t)

(add-hook 'mediawiki-mode-hook (lambda ()
				 (flyspell-mode 1)
				 (auto-dictionary-mode 1)
				 ))

(add-hook 'outline-minor-mode-hook (lambda ()
				     (local-unset-key [(meta left)])
				     (local-unset-key [(meta right)])
				     (local-unset-key [(control left)])
				     (local-unset-key [(control right)])
				     (local-unset-key [(control up)])
				     (local-unset-key [(control down)])
				     ))

;; --- set up hunspell for flyspell-mode ---

(setq ispell-program-name "/usr/bin/hunspell")

(setq ispell-local-dictionary-alist
      '(("en_US" ; Yankee English
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

;; --- folding mode ---

(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

;(add-hook 'c-mode-hook (lambda () (folding-mode 1)))
;(add-hook 'c++-mode-hook (lambda () (folding-mode 1)))

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

;; --- autoload rebox2 mode ---

(autoload 'rebox-mode "rebox2" "Rebox2 Mode" t)

;; --- autoload dokuwiki editing mode ---

(global-unset-key [(control v)])

(autoload 'dokuwiki-mode "dokuwiki" "DokuWiki Mode" t)
(autoload 'dokuwiki-get-page "dokuwiki" "DokuWiki Mode" t)

(global-set-key [(control v)(control d)] 'dokuwiki-get-page)

(setq dokuwiki-username "Timo"
      dokuwiki-password "test"
      dokuwiki-base-url "idlebox.net/dw") 

;; --- autoload evil-numbers mode ---

(autoload 'evil-numbers/inc-at-pt "evil-numbers" "Evil Numbers Tools" t)
(autoload 'evil-numbers/dec-at-pt "evil-numbers" "Evil Numbers Tools" t)

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
(add-to-list 'auto-mode-alist '("\\.dox\\'" . c++-mode))

; protocol buffer files
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; -----------------------------
;; --- General Customization ---
;; -----------------------------

; turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

; disable toolbar
(tool-bar-mode -1)

; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

; hook for cperl-mode to automatically set my favorite style
(add-hook 'cperl-mode-hook (lambda () (cperl-set-style "C++")))

; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m] @ " (getenv "HOSTNAME")))

; nice new color-theme package
(require 'color-theme)

(defun color-theme-tb-dark ()
  "Dark color theme created by Timo, Aug 2010"
  (interactive)
  (color-theme-install
   '(color-theme-tb-dark
     ((foreground-color . "white")
      (background-color . "black") 
      (background-mode . dark)
      (cursor-color . "palegoldenrod")
      (mouse-color . "white")
     )
     (default ((t (:height 117 :width normal :foundry "Misc" :family "Fixed"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))

     ; emacs base faces
     (link ((t (:underline t :foreground "cyan1"))))
     (link-visited ((t (:underline t :foreground "violet"))))
     (highlight ((t (:background "darkolivegreen"))))
     (region ((t (:background "blue3"))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (trailing-whitespace ((t (:background "red1"))))
     (modeline ((t (:foreground "white" :background "gray10"))))
     (modeline-buffer-id ((t (:foreground "white" :background "gray10"))))
     (modeline-mousable ((t (:foreground "white" :background "gray10"))))
     (modeline-mousable-minor-mode ((t (:foreground "white" :background "gray10"))))
     (minibuffer-prompt ((t (:foreground "cyan"))))
     (isearch ((t (:foreground "brown4" :background "palevioletred2"))))
     (lazy-highlight ((t (:background "paleturquoise4"))))
     (hl-line ((t (:background "#112233"))))
     (fringe ((t (:background "grey10"))))

     ; override some unbareable defaults with dark background
     (cperl-array-face ((t (:foreground "#5555ff" :weight bold))))
     (cperl-hash-face ((t (:foreground "orange" :slant italic :weight bold))))

     ; dark mode-line
     (show-paren-match-face ((t (:foreground "#0090FF" :background "black"))))
     (show-paren-mismatch-face ((t (:foreground "white" :background "purple"))))

     ; default colors
     (font-lock-comment-face ((t (:foreground "chocolate1"))))
     (font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
     (font-lock-string-face ((t (:foreground "LightSalmon"))))
     (font-lock-doc-face ((t (:inherit font-lock-string-face))))
     (font-lock-keyword-face ((t (:foreground "Cyan1"))))
     (font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-type-face ((t (:foreground "PaleGreen"))))
     (font-lock-constant-face ((t (:foreground "Aquamarine"))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     (font-lock-preprocessor-face ((t (:foreground "Orchid"))))
     
     ; cedet semantic faces
     (semantic-highlight-func-current-tag-face ((t (:background "gray20"))))
     (semantic-tag-boundary-face ((((class color) (background dark)) (:overline "#0000a0"))))
     (semantic-decoration-on-private-members-face ((t (:background "#200000"))))
     (semantic-decoration-on-protected-members-face ((t (:background "#000020"))))
     (semantic-decoration-on-unknown-includes ((t (:background "#900000"))))
     (semantic-decoration-on-fileless-includes ((t (:background "#009000"))))
     (semantic-decoration-on-unparsed-includes ((t (:background "#555500"))))
     (semantic-regtest-test-button-face ((t (:forground "blue" :bold t))))
     (semantic-regtest-reference-button-face ((t (:forground "ForestGreen" :bold t))))
     (semantic-complete-inline-face ((t (:underline "yellow"))))
     (semantic-highlight-edits-face ((t (:background "gray20"))))
     (semantic-unmatched-syntax-face ((t (:underline "red"))))
     (semantic-highlight-func-current-tag-face ((t (:background "gray20"))))
     (senator-momentary-highlight-face ((t (:background "gray30"))))
     )
   )
  )

(color-theme-tb-dark)

; kills all them buffers except scratch.
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
	  (buffer-list))
  (delete-other-windows))

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

(global-set-key [C-x C-b] 'buffer-menu)
(global-set-key [M-S-up] 'buffer-menu)

(global-set-key [M-S-left] 'previous-buffer)
(global-set-key [M-S-right] 'next-buffer)

; set keys f9-f12 to insert German umlauts and sz
(global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

; quick recompilation

(global-set-key [f5] 'recompile)

; go to last edit point

(require 'goto-last-change)
(global-set-key [(ctrl meta l)] 'goto-last-change);

; bind Backspace and Delete keys with M- and C- to special kill functions

(defun dove-backward-kill-word (&optional arg)
  "Backward kill word, but do not insert it into kill-ring"
  (interactive "P")
  (let (( end (point) )
	( beg (progn (backward-word arg) (point)))
	)
    (delete-region beg end)
    )
  )

(defun dove-forward-kill-word (&optional arg)
  "Backward kill word, but do not insert it into kill-ring"
  (interactive "P")
  (let (( beg (point) )
	( end (progn (forward-word arg) (point)))
	)
    (delete-region beg end)
    )
  )

(global-set-key [(meta backspace)] 'backward-kill-word)
(global-set-key [(control backspace)] 'dove-backward-kill-word)
(global-set-key [(meta delete)] 'kill-word)
(global-set-key [(control delete)] 'dove-forward-kill-word)

; special bindings for latex quickies

(defun my-latex-key-bindings ()
  "Add some latex macro keys"
  (interactive)
  (local-set-key "\C-\M-z" (lambda () (interactive) (insert "\\mathbb{Z}")))
  (local-set-key "\C-\M-n" (lambda () (interactive) (insert "\\mathbb{N}")))
  (local-set-key (kbd "C-M-S-n") (lambda () (interactive) (insert "\\!{}_1\\mathbb{N}_")))
  (local-set-key "\C-\M-q" (lambda () (interactive) (insert "\\mathbb{Q}")))
  (local-set-key "\C-\M-f" (lambda () (interactive) (insert "\\mathbb{F}")))
  (local-set-key "\C-\M-r" (lambda () (interactive) (insert "\\mathbb{R}")))
  (local-set-key "\C-\M-c" (lambda () (interactive) (insert "\\mathbb{C}")))
  (local-set-key "\C-b" (lambda () (interactive) (insert "\\mathbb{")))
  (local-set-key "\C-f" (lambda () (interactive) (insert "\\mathfrak{")))
  (local-set-key "\C-\M-o" (lambda () (interactive) (insert "\\operatorname{")))
  (turn-on-reftex)
  (visual-line-mode 1)
)

(add-hook 'tex-mode-hook 'my-latex-key-bindings)
(add-hook 'latex-mode-hook 'my-latex-key-bindings)
(add-hook 'TeX-mode-hook 'my-latex-key-bindings)
(add-hook 'LaTeX-mode-hook 'my-latex-key-bindings)

(require 'flymake)

(defun flymake-get-tex-args (file-name)
  (list "pdflatex" (list "-file-line-error" "-interaction=nonstopmode" "-shell-escape" file-name)))

;; ---------------------------
;; --- CEDET Configuration ---
;; ---------------------------

(defun list-all-subfolders (folder)
  (let ((folder-list (list folder)))
    (dolist (subfolder (directory-files folder))
      (let ((name (concat folder "/" subfolder)))
	(when (and (file-directory-p name)
		   (not (equal subfolder ".."))
		   (not (equal subfolder ".")))
	  (set 'folder-list (append folder-list (list name))))))
    folder-list))

(unless (featurep 'cedet)
  (load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
)
(global-ede-mode 1)
(semantic-load-enable-excessive-code-helpers)

(require 'semantic-ia)
(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")

(semantic-add-system-include "/usr/include/" 'c-mode)
(semantic-add-system-include "/usr/include/" 'c++-mode) 
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/" 'c-mode)
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/" 'c++-mode)
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/g++-v4/" 'c++-mode)

;(setq qt4-base-dir "/usr/include/qt4/")
;(dolist (folder (list-all-subfolders qt4-base-dir))
;  (semantic-add-system-include folder 'c++-mode)
;  (add-to-list 'auto-mode-alist (cons folder 'c++-mode)))
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semanticdb-enable-gnu-global-databases 'c-mode)

(defun semantic-symref-no-prompt ()
  "Copy of semantic-symref without prompt"
  (interactive)
  (require 'semantic/symref/list)
  (semantic-fetch-tags)
  (let ((ct (semantic-current-tag))
	(res nil)
	)
    (when (not ct) (error "Place cursor inside tag to be searched for"))
    (message "Gathering References...")
    (setq res (semantic-symref-find-references-by-name (semantic-tag-name ct)))
    (semantic-symref-produce-list-on-results res (semantic-tag-name ct)))
  )

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (local-set-key [(control return)] 'semantic-ia-complete-symbol)
	    (local-set-key [(meta return)] 'semantic-ia-complete-symbol-menu)
	    (local-set-key "\C-c<" 'semantic-ia-fast-jump)
	    (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
	    (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
	    (local-set-key "\C-c?" 'semantic-symref-no-prompt)
	    (local-set-key "\C-cr" 'semantic-symref-rename-local-variable)
	    ))

;; ------------------------------------------
;; --- Tools for compilation within emacs ---
;; ------------------------------------------

(global-set-key [(control c) (c)] 'compile-again)

(setq compilation-last-buffer nil)
(defun compile-again (pfx)
  """Run the same compile as the last time.

If there was no last time, or there is a prefix argument, this acts like
M-x compile.
"""
(interactive "p")
(if (and (eq pfx 1)
	 compilation-last-buffer)
    (progn
      (set-buffer compilation-last-buffer)
      (revert-buffer t t))
  (call-interactively 'compile)))

