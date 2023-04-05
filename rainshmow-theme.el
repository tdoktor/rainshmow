;;; rainshmow-theme.el --- Rainshmow Theme

;; Copyright 2015-present, All rights reserved
;;
;; Code licensed under the MIT license

;; Maintainer: Étienne Deparis <etienne@depar.is>
;; Author: me 
;; Version: 1
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/rainshmow/emacs

;;; Commentary:

;; A dark color theme available for a number of editors.
;; This theme tries as much as possible to follow the consensual
;; specification (see URL `https://spec.rainshmowtheme.com/').

;;; Code:
(deftheme rainshmow)


;;;; Configuration options:

(defgroup rainshmow nil
  "Rainshmow theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom rainshmow-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'rainshmow)

(defcustom rainshmow-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'rainshmow)

(defcustom rainshmow-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'rainshmow)

(defcustom rainshmow-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'rainshmow)

(defcustom rainshmow-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'rainshmow)

(defcustom rainshmow-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'rainshmow)

(defvar rainshmow-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.
Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Rainshmow theme:
    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))
There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/rainshmow/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")

;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]

(let ((colors '(;; Upstream theme color
                (rainshmow-bg      "#2c2b2b" "unspecified-bg" "unspecified-bg") ; official background
                (rainshmow-fg      "#FFFFFF" "#ffffff" "brightwhite") ; official foreground
                (rainshmow-current "#3c3c3c" "#303030" "brightblack") ; official current-line/selection
                (rainshmow-comment "#d3d3d3" "#5f5faf" "blue")        ; official comment
                (rainshmow-cyan    "#80ddff" "#87d7ff" "brightcyan")  ; official cyan
                (rainshmow-green   "#9fff6f" "#5fff87" "green")       ; official green
                (rainshmow-orange  "#ffd200" "#ffaf5f" "brightred")   ; official orange
                (rainshmow-pink    "#ff6f96" "#ff87d7" "magenta")     ; official pink
                (rainshmow-purple  "#d89bf5" "#af87ff" "brightmagenta") ; official purple
                (rainshmow-red     "#ff5e5e" "#ff8787" "red")         ; official red
                (rainshmow-yellow  "#ffd200" "#ffff87" "yellow")      ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#464752" "#262626" "brightblack")
                (bg4             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (other-blue      "#0189cc" "#0087ff" "brightblue")))
  (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,rainshmow-bg :foreground ,rainshmow-fg)
               (default-italic :slant italic)
               (error :foreground ,rainshmow-red)
               (ffap :foreground ,fg4)
               (fringe :background ,rainshmow-bg :foreground ,fg4)
               (header-line :inherit 'mode-line)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,rainshmow-current :extend t)
               (info-quoted-name :foreground ,rainshmow-orange)
               (info-string :foreground ,rainshmow-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,rainshmow-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,rainshmow-bg)
               (line-number :slant italic :foreground ,bg4 :background ,rainshmow-bg)
               (match :background ,rainshmow-yellow :foreground ,rainshmow-bg)
               (menu :background ,rainshmow-current :inverse-video nil
                     ,@(if rainshmow-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground rainshmow-fg)))
               (minibuffer-prompt
                ,@(if rainshmow-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground rainshmow-fg)
                    (list :weight 'bold :foreground rainshmow-pink)))
               (mode-line :background ,rainshmow-current
                          :box ,rainshmow-current :inverse-video nil
                          ,@(if rainshmow-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground rainshmow-fg)))
               (mode-line-inactive
                :background ,rainshmow-bg :inverse-video nil
                ,@(if rainshmow-alternate-mode-line-and-minibuffer
                      (list :foreground rainshmow-comment :box rainshmow-bg)
                    (list :foreground fg4 :box bg2)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,rainshmow-comment)
               (success :foreground ,rainshmow-green)
               (tooltip :foreground ,rainshmow-fg :background ,rainshmow-current)
               (trailing-whitespace :background ,rainshmow-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,rainshmow-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,rainshmow-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,rainshmow-purple)
               (font-lock-doc-face :foreground ,rainshmow-comment)
               (font-lock-function-name-face :foreground ,rainshmow-green :weight bold)
               (font-lock-keyword-face :foreground ,rainshmow-pink :weight bold)
               (font-lock-negation-char-face :foreground ,rainshmow-cyan)
               (font-lock-number-face :foreground ,rainshmow-purple)
               (font-lock-operator-face :foreground ,rainshmow-pink)
               (font-lock-preprocessor-face :foreground ,rainshmow-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,rainshmow-cyan)
               (font-lock-regexp-grouping-construct :foreground ,rainshmow-purple)
               (font-lock-string-face :foreground ,rainshmow-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,rainshmow-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,rainshmow-pink)
               ;; bookmarks
               (bookmark-face :foreground ,rainshmow-pink)
               ;; company
               (company-echo-common :foreground ,rainshmow-bg :background ,rainshmow-fg)
               (company-preview :background ,rainshmow-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,rainshmow-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,rainshmow-green)
               (company-scrollbar-bg :background ,rainshmow-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,rainshmow-green
                                       :underline t)
               (company-tooltip-search-selection :background ,rainshmow-green
                                                 :foreground ,rainshmow-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,rainshmow-bg)
               (company-tooltip-common :foreground ,rainshmow-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,rainshmow-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,rainshmow-green)
               (completions-first-difference :foreground ,rainshmow-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,rainshmow-orange :background ,rainshmow-orange)
               (diff-hl-delete :foreground ,rainshmow-red :background ,rainshmow-red)
               (diff-hl-insert :foreground ,rainshmow-green :background ,rainshmow-green)
               ;; dired
               (dired-directory :foreground ,rainshmow-green :weight normal)
               (dired-flagged :foreground ,rainshmow-pink)
               (dired-header :foreground ,fg3 :background ,rainshmow-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,rainshmow-fg :weight bold)
               (dired-marked :foreground ,rainshmow-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,rainshmow-yellow :weight normal :slant italic)
               (dired-warning :foreground ,rainshmow-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,rainshmow-fg)
               (diredp-deletion-file-name :foreground ,rainshmow-pink :background ,rainshmow-current)
               (diredp-deletion :foreground ,rainshmow-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,rainshmow-orange)
               (diredp-file-name :foreground ,rainshmow-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,rainshmow-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,rainshmow-current)
               (diredp-ignored-file-name :foreground ,rainshmow-fg)
               (diredp-mode-line-flagged :foreground ,rainshmow-orange)
               (diredp-mode-line-marked :foreground ,rainshmow-orange)
               (diredp-no-priv :foreground ,rainshmow-fg)
               (diredp-number :foreground ,rainshmow-cyan)
               (diredp-other-priv :foreground ,rainshmow-orange)
               (diredp-rare-priv :foreground ,rainshmow-orange)
               (diredp-read-priv :foreground ,rainshmow-purple)
               (diredp-write-priv :foreground ,rainshmow-pink)
               (diredp-exec-priv :foreground ,rainshmow-yellow)
               (diredp-symlink :foreground ,rainshmow-orange)
               (diredp-link-priv :foreground ,rainshmow-orange)
               (diredp-autofile-name :foreground ,rainshmow-yellow)
               (diredp-tagged-autofile-name :foreground ,rainshmow-yellow)
               ;; eglot
               (eglot-diagnostic-tag-unnecessary-face :inherit warning)
               (eglot-diagnostic-tag-deprecated-face :inherit warning :strike-through t)
               ;; eldoc-box
               (eldoc-box-border :background ,rainshmow-current)
               (eldoc-box-body :background ,rainshmow-current)
               ;; elfeed
               (elfeed-search-date-face :foreground ,rainshmow-comment)
               (elfeed-search-title-face :foreground ,rainshmow-fg)
               (elfeed-search-unread-title-face :foreground ,rainshmow-pink :weight bold)
               (elfeed-search-feed-face :foreground ,rainshmow-fg :weight bold)
               (elfeed-search-tag-face :foreground ,rainshmow-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,rainshmow-pink)
               (elfeed-search-filter-face :foreground ,rainshmow-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,rainshmow-red)
               (elfeed-log-warn-level-face :foreground ,rainshmow-orange)
               (elfeed-log-info-level-face :foreground ,rainshmow-cyan)
               (elfeed-log-debug-level-face :foreground ,rainshmow-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,rainshmow-pink
                                       ,@(when rainshmow-enlarge-headings
                                           (list :height rainshmow-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,rainshmow-purple
                                       ,@(when rainshmow-enlarge-headings
                                           (list :height rainshmow-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,rainshmow-green
                                       ,@(when rainshmow-enlarge-headings
                                           (list :height rainshmow-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,rainshmow-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,rainshmow-yellow)
               (enh-ruby-op-face :foreground ,rainshmow-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,rainshmow-yellow)
               (enh-ruby-string-delimiter-face :foreground ,rainshmow-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,rainshmow-orange))
               (flyspell-incorrect :underline (:style wave :color ,rainshmow-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,rainshmow-purple)
               (font-latex-italic-face :foreground ,rainshmow-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,rainshmow-cyan)
               (font-latex-match-variable-keywords :foreground ,rainshmow-fg)
               (font-latex-string-face :foreground ,rainshmow-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,rainshmow-pink
                                      ,@(when rainshmow-enlarge-headings
                                          (list :height rainshmow-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,rainshmow-purple
                                      ,@(when rainshmow-enlarge-headings
                                          (list :height rainshmow-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,rainshmow-green
                                      ,@(when rainshmow-enlarge-headings
                                          (list :height rainshmow-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,rainshmow-yellow)
               (gemini-quote-face :foreground ,rainshmow-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,rainshmow-pink)
               (go-test--standard-face :foreground ,rainshmow-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,rainshmow-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,rainshmow-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,rainshmow-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,rainshmow-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,rainshmow-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,rainshmow-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,rainshmow-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,rainshmow-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,rainshmow-purple)
               (gnus-header-from :foreground ,rainshmow-fg)
               (gnus-header-name :foreground ,rainshmow-green)
               (gnus-header-subject :foreground ,rainshmow-pink :weight bold)
               (gnus-summary-markup-face :foreground ,rainshmow-cyan)
               (gnus-summary-high-unread :foreground ,rainshmow-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,rainshmow-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,rainshmow-pink :weight bold)
               (gnus-summary-low-unread :foreground ,rainshmow-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,rainshmow-pink)
               (haskell-constructor-face :foreground ,rainshmow-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,rainshmow-purple)
               (helm-buffer-not-saved :foreground ,rainshmow-purple :background ,rainshmow-bg)
               (helm-buffer-process :foreground ,rainshmow-orange :background ,rainshmow-bg)
               (helm-buffer-saved-out :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (helm-buffer-size :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (helm-candidate-number :foreground ,rainshmow-bg :background ,rainshmow-fg)
               (helm-ff-directory :foreground ,rainshmow-green :background ,rainshmow-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,rainshmow-green :background ,rainshmow-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,rainshmow-bg :weight normal)
               (helm-ff-file :foreground ,rainshmow-fg :background ,rainshmow-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,rainshmow-pink :background ,rainshmow-bg :weight bold)
               (helm-ff-prefix :foreground ,rainshmow-bg :background ,rainshmow-pink :weight normal)
               (helm-ff-symlink :foreground ,rainshmow-pink :background ,rainshmow-bg :weight bold)
               (helm-grep-cmd-line :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (helm-grep-file :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (helm-grep-finish :foreground ,fg2 :background ,rainshmow-bg)
               (helm-grep-lineno :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,rainshmow-green :background ,rainshmow-bg)
               (helm-header :foreground ,fg2 :background ,rainshmow-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,rainshmow-green :background ,rainshmow-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,rainshmow-purple :background ,rainshmow-bg)
               (helm-source-go-package-godoc-description :foreground ,rainshmow-yellow)
               (helm-source-header :foreground ,rainshmow-pink :background ,rainshmow-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,rainshmow-orange :background ,rainshmow-bg)
               (helm-time-zone-home :foreground ,rainshmow-purple :background ,rainshmow-bg)
               (helm-visible-mark :foreground ,rainshmow-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,rainshmow-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,rainshmow-fg)
               (icicle-search-current-input :foreground ,rainshmow-pink)
               (icicle-search-context-level-8 :foreground ,rainshmow-orange)
               (icicle-search-context-level-7 :foreground ,rainshmow-orange)
               (icicle-search-context-level-6 :foreground ,rainshmow-orange)
               (icicle-search-context-level-5 :foreground ,rainshmow-orange)
               (icicle-search-context-level-4 :foreground ,rainshmow-orange)
               (icicle-search-context-level-3 :foreground ,rainshmow-orange)
               (icicle-search-context-level-2 :foreground ,rainshmow-orange)
               (icicle-search-context-level-1 :foreground ,rainshmow-orange)
               (icicle-search-main-regexp-current :foreground ,rainshmow-fg)
               (icicle-saved-candidate :foreground ,rainshmow-fg)
               (icicle-proxy-candidate :foreground ,rainshmow-fg)
               (icicle-mustmatch-completion :foreground ,rainshmow-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,rainshmow-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,rainshmow-orange)
               (icicle-match-highlight-Completions :foreground ,rainshmow-green)
               (icicle-key-complete-menu-local :foreground ,rainshmow-fg)
               (icicle-key-complete-menu :foreground ,rainshmow-fg)
               (icicle-input-completion-fail-lax :foreground ,rainshmow-pink)
               (icicle-input-completion-fail :foreground ,rainshmow-pink)
               (icicle-historical-candidate-other :foreground ,rainshmow-fg)
               (icicle-historical-candidate :foreground ,rainshmow-fg)
               (icicle-current-candidate-highlight :foreground ,rainshmow-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,rainshmow-fg)
               (icicle-complete-input :foreground ,rainshmow-orange)
               (icicle-common-match-highlight-Completions :foreground ,rainshmow-purple)
               (icicle-candidate-part :foreground ,rainshmow-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,rainshmow-orange)
               ;; ido
               (ido-first-match
                ,@(if rainshmow-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground rainshmow-green)
                    (list :weight 'bold :foreground rainshmow-pink)))
               (ido-only-match :foreground ,rainshmow-orange)
               (ido-subdir :foreground ,rainshmow-yellow)
               (ido-virtual :foreground ,rainshmow-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,rainshmow-fg :background ,rainshmow-pink)
               ;; ivy
               (ivy-current-match
                ,@(if rainshmow-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background rainshmow-current :foreground rainshmow-green)
                    (list :weight 'bold :background rainshmow-current :foreground rainshmow-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,rainshmow-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,rainshmow-green
                                            :foreground ,rainshmow-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,rainshmow-yellow
                                            :foreground ,rainshmow-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,rainshmow-pink
                                            :foreground ,rainshmow-bg)
               (ivy-confirm-face :foreground ,rainshmow-orange)
               (ivy-match-required-face :foreground ,rainshmow-red)
               (ivy-subdir :foreground ,rainshmow-yellow)
               (ivy-remote :foreground ,rainshmow-pink)
               (ivy-virtual :foreground ,rainshmow-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,rainshmow-bg :background ,rainshmow-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,rainshmow-cyan)
               (jde-java-font-lock-modifier-face :foreground ,rainshmow-pink)
               (jde-java-font-lock-number-face :foreground ,rainshmow-fg)
               (jde-java-font-lock-package-face :foreground ,rainshmow-fg)
               (jde-java-font-lock-private-face :foreground ,rainshmow-pink)
               (jde-java-font-lock-public-face :foreground ,rainshmow-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,rainshmow-purple)
               (js2-function-param :foreground ,rainshmow-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,rainshmow-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,rainshmow-yellow)
               (js2-private-function-call :foreground ,rainshmow-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,rainshmow-orange)
               (js3-external-variable-face :foreground ,rainshmow-fg)
               (js3-function-param-face :foreground ,rainshmow-pink)
               (js3-instance-member-face :foreground ,rainshmow-cyan)
               (js3-jsdoc-tag-face :foreground ,rainshmow-pink)
               (js3-warning-face :underline ,rainshmow-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,rainshmow-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,rainshmow-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,rainshmow-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,rainshmow-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,rainshmow-fg :weight ultra-bold
                                               :box (:line-width -1 :color rainshmow-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,rainshmow-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,rainshmow-bg)
               (lsp-ui-doc-header :foreground ,rainshmow-bg :background ,rainshmow-cyan)
               ;; magit
               (magit-branch-local :foreground ,rainshmow-cyan)
               (magit-branch-remote :foreground ,rainshmow-green)
               (magit-tag :foreground ,rainshmow-orange)
               (magit-section-heading :foreground ,rainshmow-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,rainshmow-orange
                                            :background ,rainshmow-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,rainshmow-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,rainshmow-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,rainshmow-green)
               (magit-diffstat-removed :foreground ,rainshmow-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,rainshmow-orange :weight bold)
               (magit-process-ok :foreground ,rainshmow-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,rainshmow-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,rainshmow-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,rainshmow-pink
                ,@(when rainshmow-enlarge-headings
                    (list :height rainshmow-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,rainshmow-purple
                ,@(when rainshmow-enlarge-headings
                    (list :height rainshmow-height-title-2)))
               (markdown-header-face-3
                :foreground ,rainshmow-green
                ,@(when rainshmow-enlarge-headings
                    (list :height rainshmow-height-title-3)))
               (markdown-header-face-4 :foreground ,rainshmow-yellow)
               (markdown-header-face-5 :foreground ,rainshmow-cyan)
               (markdown-header-face-6 :foreground ,rainshmow-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,rainshmow-fg)
               (markdown-inline-code-face :foreground ,rainshmow-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,rainshmow-orange)
               (markdown-table-face :foreground ,rainshmow-purple)
               (markdown-list-face :foreground ,rainshmow-cyan)
               (markdown-language-keyword-face :foreground ,rainshmow-comment)
               ;; message
               (message-header-to :foreground ,rainshmow-fg :weight bold)
               (message-header-cc :foreground ,rainshmow-fg :bold bold)
               (message-header-subject :foreground ,rainshmow-orange)
               (message-header-newsgroups :foreground ,rainshmow-purple)
               (message-header-other :foreground ,rainshmow-purple)
               (message-header-name :foreground ,rainshmow-green)
               (message-header-xheader :foreground ,rainshmow-cyan)
               (message-separator :foreground ,rainshmow-cyan :slant italic)
               (message-cited-text :foreground ,rainshmow-purple)
               (message-cited-text-1 :foreground ,rainshmow-purple)
               (message-cited-text-2 :foreground ,rainshmow-orange)
               (message-cited-text-3 :foreground ,rainshmow-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,rainshmow-green :weight normal)
               ;; mini-modeline
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,rainshmow-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,rainshmow-purple)
               (mu4e-highlight-face :background ,rainshmow-bg
                                    :foreground ,rainshmow-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,rainshmow-current
                                           :foreground ,rainshmow-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,rainshmow-purple)
               (mu4e-cited-1-face :foreground ,rainshmow-purple)
               (mu4e-cited-2-face :foreground ,rainshmow-orange)
               (mu4e-cited-3-face :foreground ,rainshmow-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,rainshmow-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,rainshmow-purple)
               (neo-expand-btn-face :foreground ,rainshmow-fg)
               (neo-file-link-face :foreground ,rainshmow-cyan)
               (neo-header-face :background ,rainshmow-bg
                                :foreground ,rainshmow-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,rainshmow-purple :weight bold)
               (neo-vc-added-face :foreground ,rainshmow-orange)
               (neo-vc-conflict-face :foreground ,rainshmow-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,rainshmow-orange)
               (neo-vc-ignored-face :foreground ,rainshmow-comment)
               (neo-vc-missing-face :foreground ,rainshmow-red)
               (neo-vc-needs-merge-face :foreground ,rainshmow-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,rainshmow-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,rainshmow-green)
               (neo-vc-user-face :foreground ,rainshmow-purple)
               ;; org
               (org-agenda-date :foreground ,rainshmow-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,rainshmow-comment)
               (org-agenda-done :foreground ,rainshmow-green)
               (org-agenda-structure :foreground ,rainshmow-purple)
               (org-block :foreground ,rainshmow-orange)
               (org-code :foreground ,rainshmow-green)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,rainshmow-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,rainshmow-comment)
               (org-document-title :weight bold :foreground ,rainshmow-orange
                                   ,@(when rainshmow-enlarge-headings
                                       (list :height rainshmow-height-doc-title)))
               (org-done :foreground ,rainshmow-green)
               (org-ellipsis :foreground ,rainshmow-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,rainshmow-pink)
               (org-headline-done :foreground ,rainshmow-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,rainshmow-bg :background ,rainshmow-bg)
               (org-level-1 :inherit bold :foreground ,rainshmow-pink
                            ,@(when rainshmow-enlarge-headings
                                (list :height rainshmow-height-title-1)))
               (org-level-2 :inherit bold :foreground ,rainshmow-purple
                            ,@(when rainshmow-enlarge-headings
                                (list :height rainshmow-height-title-2)))
               (org-level-3 :weight normal :foreground ,rainshmow-green
                            ,@(when rainshmow-enlarge-headings
                                (list :height rainshmow-height-title-3)))
               (org-level-4 :weight normal :foreground ,rainshmow-yellow)
               (org-level-5 :weight normal :foreground ,rainshmow-cyan)
               (org-level-6 :weight normal :foreground ,rainshmow-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,rainshmow-fg)
               (org-link :foreground ,rainshmow-cyan :underline t)
               (org-priority :foreground ,rainshmow-cyan)
               (org-quote :foreground ,rainshmow-yellow :slant italic)
               (org-scheduled :foreground ,rainshmow-green)
               (org-scheduled-previously :foreground ,rainshmow-yellow)
               (org-scheduled-today :foreground ,rainshmow-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,rainshmow-yellow)
               (org-table :foreground ,rainshmow-purple)
               (org-tag :foreground ,rainshmow-pink :weight bold :background ,bg2)
               (org-todo :foreground ,rainshmow-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,rainshmow-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,rainshmow-pink)
               ;; outline
               (outline-1 :foreground ,rainshmow-pink)
               (outline-2 :foreground ,rainshmow-purple)
               (outline-3 :foreground ,rainshmow-green)
               (outline-4 :foreground ,rainshmow-yellow)
               (outline-5 :foreground ,rainshmow-cyan)
               (outline-6 :foreground ,rainshmow-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,rainshmow-pink)
               ;; powerline
               (powerline-active1 :background ,rainshmow-bg :foreground ,rainshmow-pink)
               (powerline-active2 :background ,rainshmow-bg :foreground ,rainshmow-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,rainshmow-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,rainshmow-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,rainshmow-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,rainshmow-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,rainshmow-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,rainshmow-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,rainshmow-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,rainshmow-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,rainshmow-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,rainshmow-fg)
               (rainbow-delimiters-depth-2-face :foreground ,rainshmow-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,rainshmow-purple)
               (rainbow-delimiters-depth-4-face :foreground ,rainshmow-pink)
               (rainbow-delimiters-depth-5-face :foreground ,rainshmow-orange)
               (rainbow-delimiters-depth-6-face :foreground ,rainshmow-green)
               (rainbow-delimiters-depth-7-face :foreground ,rainshmow-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,rainshmow-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,rainshmow-green)
               (rpm-spec-doc-face :foreground ,rainshmow-pink)
               (rpm-spec-ghost-face :foreground ,rainshmow-purple)
               (rpm-spec-macro-face :foreground ,rainshmow-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,rainshmow-purple)
               (rpm-spec-section-face :foreground ,rainshmow-yellow)
               (rpm-spec-tag-face :foreground ,rainshmow-cyan)
               (rpm-spec-var-face :foreground ,rainshmow-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,rainshmow-pink :weight bold)
               (rst-level-2 :foreground ,rainshmow-purple :weight bold)
               (rst-level-3 :foreground ,rainshmow-green)
               (rst-level-4 :foreground ,rainshmow-yellow)
               (rst-level-5 :foreground ,rainshmow-cyan)
               (rst-level-6 :foreground ,rainshmow-orange)
               (rst-level-7 :foreground ,other-blue)
               (rst-level-8 :foreground ,rainshmow-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,rainshmow-pink)
               (selectrum-secondary-highlight :foreground ,rainshmow-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,rainshmow-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,rainshmow-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,rainshmow-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,rainshmow-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,rainshmow-green)
               (speedbar-file-face :foreground ,rainshmow-cyan)
               (speedbar-directory-face :foreground ,rainshmow-purple)
               (speedbar-tag-face :foreground ,rainshmow-yellow)
               (speedbar-selected-face :foreground ,rainshmow-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,rainshmow-bg
                                        :foreground ,rainshmow-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,rainshmow-purple :background ,rainshmow-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,rainshmow-pink :background ,rainshmow-bg
                            :box (:line-width 2 :color ,rainshmow-bg :style nil))
               (tab-bar-tab-inactive :foreground ,rainshmow-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,rainshmow-purple :background ,rainshmow-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,rainshmow-pink :background ,rainshmow-bg
                             :box (:line-width 2 :color ,rainshmow-bg :style nil))
               (tab-line-tab-inactive :foreground ,rainshmow-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,rainshmow-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,rainshmow-bg :foreground ,rainshmow-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,rainshmow-purple)
               (telephone-line-unimportant :background ,rainshmow-bg :foreground ,rainshmow-comment)
               ;; term
               (term :foreground ,rainshmow-fg :background ,rainshmow-bg)
               (term-color-black :foreground ,rainshmow-bg :background ,rainshmow-comment)
               (term-color-blue :foreground ,rainshmow-purple :background ,rainshmow-purple)
               (term-color-cyan :foreground ,rainshmow-cyan :background ,rainshmow-cyan)
               (term-color-green :foreground ,rainshmow-green :background ,rainshmow-green)
               (term-color-magenta :foreground ,rainshmow-pink :background ,rainshmow-pink)
               (term-color-red :foreground ,rainshmow-red :background ,rainshmow-red)
               (term-color-white :foreground ,rainshmow-fg :background ,rainshmow-fg)
               (term-color-yellow :foreground ,rainshmow-yellow :background ,rainshmow-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,rainshmow-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,rainshmow-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,rainshmow-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,rainshmow-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,rainshmow-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,rainshmow-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,rainshmow-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,rainshmow-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,rainshmow-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,rainshmow-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,rainshmow-purple)
               (web-mode-html-attr-value-face :foreground ,rainshmow-green)
               (web-mode-html-tag-face :foreground ,rainshmow-pink :weight bold)
               (web-mode-keyword-face :foreground ,rainshmow-pink)
               (web-mode-string-face :foreground ,rainshmow-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,rainshmow-green)
               ;; whitespace
               (whitespace-big-indent :background ,rainshmow-red :foreground ,rainshmow-red)
               (whitespace-empty :background ,rainshmow-orange :foreground ,rainshmow-red)
               (whitespace-hspace :background ,bg3 :foreground ,rainshmow-comment)
               (whitespace-indentation :background ,rainshmow-orange :foreground ,rainshmow-red)
               (whitespace-line :background ,rainshmow-bg :foreground ,rainshmow-pink)
               (whitespace-newline :foreground ,rainshmow-comment)
               (whitespace-space :background ,rainshmow-bg :foreground ,rainshmow-comment)
               (whitespace-space-after-tab :background ,rainshmow-orange :foreground ,rainshmow-red)
               (whitespace-space-before-tab :background ,rainshmow-orange :foreground ,rainshmow-red)
               (whitespace-tab :background ,bg2 :foreground ,rainshmow-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'rainshmow
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if rainshmow-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'rainshmow
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'rainshmow-bg colors))
               ,(funcall get-func (alist-get 'rainshmow-red colors))
               ,(funcall get-func (alist-get 'rainshmow-green colors))
               ,(funcall get-func (alist-get 'rainshmow-yellow colors))
               ,(funcall get-func (alist-get 'rainshmow-comment colors))
               ,(funcall get-func (alist-get 'rainshmow-purple colors))
               ,(funcall get-func (alist-get 'rainshmow-cyan colors))
               ,(funcall get-func (alist-get 'rainshmow-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'rainshmow)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; rainshmow-theme.el ends here
